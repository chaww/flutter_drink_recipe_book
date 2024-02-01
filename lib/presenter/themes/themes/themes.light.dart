import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/colors.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes.dart';

class LightAppTheme extends AppTheme {
  const LightAppTheme()
      : super(
          name: 'light',
          brightness: Brightness.light,
          colors: const AppThemeColors(
            primarySwatch: Colors.red,
            primary: Color(0xFFFA6555),
          ),
        );
}
