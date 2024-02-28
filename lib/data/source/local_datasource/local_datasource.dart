import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/login_remember.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/menu.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/recipe.dart';

class LocalDataSource {
  LocalDataSource();

  Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<MenuHiveModel>(MenuHiveModelAdapter());
    Hive.registerAdapter<RecipeHiveModel>(RecipeHiveModelAdapter());
    Hive.registerAdapter<IngredientHiveModel>(IngredientHiveModelAdapter());
    Hive.registerAdapter<AppSettingsHiveModel>(AppSettingsHiveModelAdapter());
    Hive.registerAdapter<LoginRememberHiveModel>(LoginRememberHiveModelAdapter());

    await Hive.openBox<MenuHiveModel>(MenuHiveModel.boxKey);
    await Hive.openBox<RecipeHiveModel>(RecipeHiveModel.boxKey);
    await Hive.openBox<IngredientHiveModel>(IngredientHiveModel.boxKey);
    await Hive.openBox<AppSettingsHiveModel>(AppSettingsHiveModel.boxKey);
    await Hive.openBox<LoginRememberHiveModel>(LoginRememberHiveModel.boxKey);
  }

  Future<List<MenuHiveModel>> getAllMenu() async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    final listMenu = List.generate(menuBox.length, (index) => menuBox.getAt(index))
        .whereType<MenuHiveModel>()
        .toList();
    return listMenu;
  }

  Future<MenuHiveModel?> getMenu(String index) async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    return menuBox.get(index);
  }

  Future<void> addMenu(MenuHiveModel menu) async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    await menuBox.add(menu);
  }

  Future<void> updateMenu({
    required int index,
    required MenuHiveModel menu,
  }) async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    await menuBox.putAt(index, menu);
  }

  Future<void> deleteMenu({
    required int index,
  }) async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    await menuBox.deleteAt(index);
  }

  Future<AppSettingsHiveModel?> getAppSettings() async {
    final appSettings = Hive.box<AppSettingsHiveModel>(AppSettingsHiveModel.boxKey);
    return appSettings.get(0);
  }

  Future<void> updateAppSettings({
    required AppSettingsHiveModel appSettings,
  }) async {
    final appSettingsBox = Hive.box<AppSettingsHiveModel>(AppSettingsHiveModel.boxKey);
    if (appSettingsBox.length == 0) {
      appSettingsBox.add(appSettings);
    } else {
      await appSettingsBox.putAt(0, appSettings);
    }
  }

  Future<LoginRememberHiveModel?> getLoginRemember() async {
    final loginRemember = Hive.box<LoginRememberHiveModel>(LoginRememberHiveModel.boxKey);
    return loginRemember.get(0);
  }

  Future<void> updateLoginRemember({
    required LoginRememberHiveModel loginRemember,
  }) async {
    final loginRememberBox = Hive.box<LoginRememberHiveModel>(LoginRememberHiveModel.boxKey);
    if (loginRememberBox.length == 0) {
      loginRememberBox.add(loginRemember);
    } else {
      await loginRememberBox.putAt(0, loginRemember);
    }
  }
}
