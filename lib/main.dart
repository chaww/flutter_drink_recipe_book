import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/global_providers.dart';
import 'package:flutter_drink_recipe_book/presenter/app.dart';

void main() {
  runApp(
    const GlobalBlocProviders(
      child: DrinkRecipeBookApp(),
    ),
  );
}
