import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/menu.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/recipe.dart';

extension MenuHiveModelX on Menu {
  MenuHiveModel toHiveModel() => MenuHiveModel()
    ..id = id
    ..nameTh = nameTh
    ..nameEn = nameEn
    ..imageSrc = imageSrc
    ..category = category
    ..recipesHot = recipesHot.map((e) => e.toHiveModel()).toList()
    ..recipesIce = recipesIce.map((e) => e.toHiveModel()).toList()
    ..recipesFrappe = recipesFrappe.map((e) => e.toHiveModel()).toList();
}

extension RecipeHiveModelX on Recipe {
  RecipeHiveModel toHiveModel() => RecipeHiveModel()
    ..optionName = optionName
    ..ingredients = ingredients.map((e) => e.toHiveModel()).toList();
}

extension IngredientHiveModelX on Ingredient {
  IngredientHiveModel toHiveModel() => IngredientHiveModel()
    ..name = name
    ..volume = volume
    ..unit = unit;
}

extension AppSettingsHiveModelX on AppSettings {
  AppSettingsHiveModel toHiveModel() => AppSettingsHiveModel()
    ..locale = locale
    ..theme = theme;
}
