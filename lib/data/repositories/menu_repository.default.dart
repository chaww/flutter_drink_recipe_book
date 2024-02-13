import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_image/local_image.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/entity_to_local_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';
import 'package:rxdart/subjects.dart';
import 'package:uuid/uuid.dart';

class MenuDefaultRepository extends MenuRepository {
  MenuDefaultRepository() {
    _init();
  }

  final _localImage = const LocalImage();
  final _localDataSource = LocalDataSource();

  final _menuStreamController = BehaviorSubject<List<Menu>>.seeded(const []);

  void _init() async {
    await _localDataSource.initialize();
    _updateAll();
  }

  Future<void> _updateAll() async {
    final menuHiveModels = await _localDataSource.getAllMenu();
    final menuEntities = menuHiveModels.map((e) => e.toEntity()).toList();

    _menuStreamController.add(menuEntities);
  }

  @override
  Stream<List<Menu>> getMenuList() => _menuStreamController.asBroadcastStream();

  @override
  Future<Menu> updateMenu(Menu menu) async {
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
}
