import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/menu.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/models/recipe.dart';

extension MenuHiveModelX on MenuHiveModel {
  Menu toEntity() => Menu(
        id: id,
        nameTh: nameTh,
        nameEn: nameEn,
        imageSrc: imageSrc,
        category: category,
        recipesHot: recipesHot.map((e) => e.toEntity()).toList(),
        recipesIce: recipesIce.map((e) => e.toEntity()).toList(),
        recipesFrappe: recipesFrappe.map((e) => e.toEntity()).toList(),
      );
}

extension RecipeHiveModelX on RecipeHiveModel {
  Recipe toEntity() => Recipe(
        optionName: optionName,
        ingredients: ingredients.map((e) => e.toEntity()).toList(),
      );
}

extension IngredientHiveModelX on IngredientHiveModel {
  Ingredient toEntity() => Ingredient(
        name: name,
        volume: value,
        unit: unit,
      );
}
