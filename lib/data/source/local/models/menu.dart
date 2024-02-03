import 'package:flutter_drink_recipe_book/data/source/local/models/recipe.dart';

class Menu {
  const Menu({
    this.name = '',
    this.category = MenuCategories.others,
    this.imageSrc = '',
    this.recipesHot = const [],
    this.recipesIce = const [],
    this.recipesFrappe = const [],
  });
  final String name;
  final MenuCategories category;
  final String imageSrc;
  final List<Recipe> recipesHot;
  final List<Recipe> recipesIce;
  final List<Recipe> recipesFrappe;
}

enum MenuCategories {
  tea,
  coffee,
  smoothies,
  soda,
  others,
}
