import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/global_providers.dart';
import 'package:flutter_drink_recipe_book/presenter/app.dart';

Future<void> main() async {
  await LocalDataSource().initialize();

  runApp(
    const GlobalBlocProviders(
      child: DrinkRecipeBookApp(),
    ),
  );
}
