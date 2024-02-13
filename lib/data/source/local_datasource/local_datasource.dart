import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/app_settings.dart';
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

    await Hive.openBox<MenuHiveModel>(MenuHiveModel.boxKey);
    await Hive.openBox<RecipeHiveModel>(RecipeHiveModel.boxKey);
    await Hive.openBox<IngredientHiveModel>(IngredientHiveModel.boxKey);
    await Hive.openBox<AppSettingsHiveModel>(AppSettingsHiveModel.boxKey);
  }

  Future<List<MenuHiveModel>> getAllMenu() async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    final menuList = List.generate(menuBox.length, (index) => menuBox.getAt(index))
        .whereType<MenuHiveModel>()
        .toList();
    return menuList;
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
    await appSettingsBox.putAt(0, appSettings);
  }
}
