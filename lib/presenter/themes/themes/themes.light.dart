import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/colors.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes.dart';

class LightAppTheme extends AppTheme {
  const LightAppTheme()
      : super(
          name: 'light',
          brightness: Brightness.light,
          colors: const AppThemeColors(
            primary: Color(0xFF13A262),
            background: Color(0xFFFFFFFF),
            backgroundDark: Color(0xFFFAFAFA),
            text: Color(0xFF303943),
          ),
        );
}
