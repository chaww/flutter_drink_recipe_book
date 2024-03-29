import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/user_data.dart';
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
    Hive.registerAdapter<UserDataHiveModel>(UserDataHiveModelAdapter());

    await Hive.openBox<MenuHiveModel>(MenuHiveModel.boxKey);
    await Hive.openBox<RecipeHiveModel>(RecipeHiveModel.boxKey);
    await Hive.openBox<IngredientHiveModel>(IngredientHiveModel.boxKey);
    await Hive.openBox<AppSettingsHiveModel>(AppSettingsHiveModel.boxKey);
    await Hive.openBox<UserDataHiveModel>(UserDataHiveModel.boxKey);
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

  Future<UserDataHiveModel?> getUserData() async {
    final userData = Hive.box<UserDataHiveModel>(UserDataHiveModel.boxKey);
    return userData.get(0);
  }

  Future<void> updateUserData({
    required UserDataHiveModel userData,
  }) async {
    final userDataBox = Hive.box<UserDataHiveModel>(UserDataHiveModel.boxKey);
    if (userDataBox.length == 0) {
      userDataBox.add(userData);
    } else {
      await userDataBox.putAt(0, userData);
    }
  }
}
