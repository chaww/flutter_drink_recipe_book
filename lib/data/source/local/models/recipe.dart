import 'package:flutter_drink_recipe_book/data/source/local/models/ingredient.dart';

class Recipe {
  const Recipe({
    this.optionName = '',
    this.ingredients = const [],
  });
  final String optionName;
  final List<Ingredient> ingredients;
}
