import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/user_data.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';
import 'package:flutter_drink_recipe_book/data/source/firebase/firebase_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_file/local_file.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/entity_to_local_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';
import 'package:rxdart/subjects.dart';
import 'package:uuid/uuid.dart';

class MenuDefaultRepository extends MenuRepository {
  MenuDefaultRepository({
    required LocalFile localFile,
    required LocalDataSource localDataSource,
    required FirebaseDataSource firebaseDataSource,
  })  : _localFile = localFile,
        _localDataSource = localDataSource,
        _firebaseDataSource = firebaseDataSource {
    // for (var menu in MockMenu.listMenu) {
    //   updateMenu(menu);
    // }
    // syncDownload();
    // syncUpload();
    initialize();
  }

  @override
  Future<void> initialize() async {
    await _sendUpdateListMenu();
  }

  final LocalFile _localFile;
  final LocalDataSource _localDataSource;
  final FirebaseDataSource _firebaseDataSource;

  final _menuStreamController = BehaviorSubject<List<Menu>>.seeded(const []);

  @override
  Stream<List<Menu>> listMenuStream() => _menuStreamController.asBroadcastStream();

  Future<void> _sendUpdateListMenu() async {
    final menuHiveModels = await _localDataSource.getAllMenu();
    final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();

    _menuStreamController.add(menuEntities);
  }

  @override
  Future<Menu> updateMenu(Menu menu) async {
    if (menu.imageSrc.isNotEmpty) {
      menu = menu.copyWith(imageSrc: await _localFile.moveImageToDirectory(source: menu.imageSrc));
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
    _sendUpdateListMenu();
    _localFile.cleanImageCache();
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
    _sendUpdateListMenu();
  }

  // @override
  // Future<void> syncUpload() async {
  //   // upload menu data
  //   final menuHiveModels = await _localDataSource.getAllMenu();
  //   final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();
  //   final menuData =
  //       menuEntities.map((menu) => menu.copyWith(imageSrc: menu.imageSrc.split('/').last)).toList();
  //   await _firebaseDataSource.uploadMenuData(menuData);

  //   List<String> listMenuFilename = [];
  //   for (var menu in menuData) {
  //     if (menu.imageSrc.isNotEmpty) {
  //       listMenuFilename.add(menu.imageSrc);
  //     }
  //   }
  //   final listFilenameServer = await _firebaseDataSource.getListImageFilename();
  //   final menuSet = listMenuFilename.toSet();
  //   final serverSet = listFilenameServer.toSet();

  //   // upload images
  //   final listFilenameUpload = menuSet.difference(serverSet).toList();
  //   for (var filename in listFilenameUpload) {
  //     final file = await _localFile.getImageFile(filename);
  //     if (file != null) {
  //       await _firebaseDataSource.uploadImageFile(file: file, filename: filename);
  //     }
  //   }

  //   // clean server images
  //   final listFilenameDelete = serverSet.difference(menuSet).toList();
  //   for (var filename in listFilenameDelete) {
  //     await _firebaseDataSource.deleteImageFile(filename);
  //   }

  //   await _cleanLocalFilesByListMenu(menuData);
  // }

  @override
  Future<void> syncDownload() async {
    final menuData = await _firebaseDataSource.getMenuData();
    if (menuData == null) return;
    for (var menu in menuData) {
      if (menu.imageSrc.isNotEmpty) {
        final path = await _firebaseDataSource.dowloadImageToLocal(menu.imageSrc);
        await updateMenu(menu.copyWith(imageSrc: path));
      } else {
        await updateMenu(menu);
      }
    }
    await _cleanLocalFilesByListMenu(menuData);
  }

  Future<void> _cleanLocalFilesByListMenu(List<Menu> listMenu) async {
    List<String> listMenuFilename = [];
    for (var menu in listMenu) {
      if (menu.imageSrc.isNotEmpty) {
        listMenuFilename.add(menu.imageSrc.split('/').last);
      }
    }
    final listLocalFilename = await _localFile.getListFilename();
    final localSet = listLocalFilename.toSet();
    final listDelete = localSet.difference(listMenuFilename.toSet()).toList();
    for (var filename in listDelete) {
      await _localFile.deleteFile(filename);
    }
  }
}
