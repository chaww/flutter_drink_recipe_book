import 'package:equatable/equatable.dart';

import 'ingredient.dart';

class Recipe extends Equatable {
  final String optionName;
  final List<Ingredient> ingredients;
  const Recipe({
    required this.optionName,
    required this.ingredients,
  });

  Recipe copyWith({
    String? optionName,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      optionName: optionName ?? this.optionName,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  List<Object> get props => [optionName, ingredients];
}
