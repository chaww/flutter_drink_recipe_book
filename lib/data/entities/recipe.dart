// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionName': optionName,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      optionName: map['optionName'] as String,
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List<dynamic>).map<Ingredient>(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);
}
