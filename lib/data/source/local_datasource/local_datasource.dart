import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/menu.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/recipe.dart';

@singleton
class LocalDataSource {
  const LocalDataSource();

  @PostConstruct(preResolve: true)
  Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<MenuHiveModel>(MenuHiveModelAdapter());
    Hive.registerAdapter<RecipeHiveModel>(RecipeHiveModelAdapter());
    Hive.registerAdapter<IngredientHiveModel>(IngredientHiveModelAdapter());

    await Hive.openBox<MenuHiveModel>(MenuHiveModel.boxKey);
    await Hive.openBox<MenuHiveModel>(MenuHiveModel.boxKey);
    await Hive.openBox<MenuHiveModel>(MenuHiveModel.boxKey);
  }

  Future<bool> hasMenuData() async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    return menuBox.length > 0;
  }

  Future<void> saveMenu(MenuHiveModel menu) async {
    final menuBox = Hive.box<MenuHiveModel>(MenuHiveModel.boxKey);
    await menuBox.add(menu);
  }

  Future<List<MenuHiveModel>> getAllMenu(String index) async {
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
}
