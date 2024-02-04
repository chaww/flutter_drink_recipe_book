import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'recipe.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String name,
    required String imageSrc,
    required MenuCategories category,
    required List<Recipe> recipesHot,
    required List<Recipe> recipesIce,
    required List<Recipe> recipesFrappe,
  }) = _Menu;

  factory Menu.fromJson(Map<String, Object?> json) => _$MenuFromJson(json);
}

enum MenuCategories {
  tea,
  coffee,
  smoothies,
  soda,
  others,
}
