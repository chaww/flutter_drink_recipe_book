import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_selector.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/home/home.dart';

class DrinkRecipeBookApp extends StatelessWidget {
  const DrinkRecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsThemeSelector(
      builder: (theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.themeData,
        title: 'Drink Recipe Book',
        home: const HomePage(),
      ),
    );
  }
}
