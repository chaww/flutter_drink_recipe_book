import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/colors.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes.dart';

class DarkAppTheme extends AppTheme {
  const DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
          colors: const AppThemeColors(
            primarySwatch: Colors.red,
            primary: Color(0xFF55FAB0),
          ),
        );
}
