import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/home/home.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_info.dart';

class DrinkRecipeBookApp extends StatelessWidget {
  const DrinkRecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drink Recipe Book',
      // home: HomePage(),
      home: MenuInfoPage(),
    );
  }
}
