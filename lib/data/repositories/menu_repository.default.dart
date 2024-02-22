import 'dart:developer';

import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';
import 'package:flutter_drink_recipe_book/data/source/firebase/firebase_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_image/local_image.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/entity_to_local_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mock/mock_menu.dart';
import 'package:rxdart/subjects.dart';
import 'package:uuid/uuid.dart';

class MenuDefaultRepository extends MenuRepository {
  MenuDefaultRepository() {
    _updateAll();
    // for (var menu in MockMenu.menuList) {
    //   updateMenu(menu);
    // }
    syncUpload();
  }

  final _localImage = const LocalImage();
  final _localDataSource = LocalDataSource();
  final _firebaseDataSource = FirebaseDataSource();

  final _menuStreamController = BehaviorSubject<List<Menu>>.seeded(const []);

  Future<void> _updateAll() async {
    final menuHiveModels = await _localDataSource.getAllMenu();
    final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();

    _menuStreamController.add(menuEntities);
  }

  @override
  Stream<List<Menu>> getMenuList() => _menuStreamController.asBroadcastStream();

  @override
  Future<Menu> updateMenu(Menu menu) async {
    if (menu.imageSrc.isNotEmpty) {
      menu = menu.copyWith(imageSrc: await _localImage.moveImageToDirectory(source: menu.imageSrc));
    }
    final menuHiveModels = await _localDataSource.getAllMenu();
    final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();
    final index = menuEntities.indexWhere((e) => e.id == menu.id);
    late Menu newMenu;
    if (index > -1) {
      await _localDataSource.updateMenu(index: index, menu: menu.toHiveModel());
      newMenu = menu;
    } else {
      newMenu = menu;
      if (menu.id.isEmpty) newMenu = menu.copyWith(id: const Uuid().v4());
      await _localDataSource.addMenu(newMenu.toHiveModel());
    }
    _updateAll();
    _localImage.cleanImageCache();
    return newMenu;
  }

  @override
  Future<void> deleteMenu(String id) async {
    final menuHiveModels = await _localDataSource.getAllMenu();
    final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();
    final index = menuEntities.indexWhere((e) => e.id == id);
    if (index > -1) {
      await _localDataSource.deleteMenu(index: index);
    }
    _updateAll();
  }

  @override
  Future<List<String>?> displayPickImageDialog() => _localImage.displayPickImageDialog();

  @override
  Future<void> syncUpload() async {
    // upload menu data
    final menuHiveModels = await _localDataSource.getAllMenu();
    final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();
    final menuData =
        menuEntities.map((menu) => menu.copyWith(imageSrc: menu.imageSrc.split('/').last)).toList();
    await _firebaseDataSource.uploadMenuData(menuData);

    // upload images
    List<String> listMenuFilename = [];
    for (var menu in menuData) {
      if (menu.imageSrc.isNotEmpty) {
        listMenuFilename.add(menu.imageSrc);
      }
    }
    final listFilenameServer = await _firebaseDataSource.getListImageFilename();
    final menuSet = listMenuFilename.toSet();
    final serverSet = listFilenameServer.toSet();
    final listFilenameUpload = menuSet.difference(serverSet).toList();
    for (var filename in listFilenameUpload) {
      await _firebaseDataSource.uploadImageFile(filename);
    }

    // clean server images
    final listFilenameDelete = serverSet.difference(menuSet).toList();
    for (var filename in listFilenameDelete) {
      await _firebaseDataSource.deleteImageFile(filename);
    }

    // clean local images
    final listLocalFilename = await _localImage.getListFilename();
    final localSet = listLocalFilename.toSet();
    final listDelete = localSet.difference(menuSet).toList();
    for (var filename in listDelete) {
      await _localImage.deleteFile(filename);
    }
  }

  @override
  Future<void> syncDownload() async {}
}
