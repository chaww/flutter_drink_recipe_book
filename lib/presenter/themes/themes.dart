import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/colors.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/typography.dart';
import 'package:flutter_drink_recipe_book/presenter/fonts.gen.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final String name;
  final String fontFamily;
  final Brightness brightness;
  final AppThemeColors colors;
  final AppThemeTypography typographies;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    this.typographies = const AppThemeTypography(),
    this.fontFamily = FontFamily.prompt,
  });

  ColorScheme get baseColorScheme => brightness == Brightness.light
      ? const ColorScheme.light()
      : const ColorScheme.dark();

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        platform: TargetPlatform.iOS,
        extensions: [this],
        brightness: brightness,
        fontFamily: fontFamily,
        primaryColor: colors.primary,
        colorScheme: baseColorScheme.copyWith(
          primary: colors.primary,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: typographies.body,
          centerTitle: true,
          color: Colors.transparent,
        ),
      );

  @override
  AppTheme copyWith({
    String? name,
    Brightness? brightness,
    AppThemeColors? colors,
    AppThemeTypography? typographies,
  }) {
    return AppTheme(
      brightness: brightness ?? this.brightness,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      typographies: typographies ?? this.typographies,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      name: name,
      brightness: brightness,
      colors: colors.lerp(other.colors, t),
      typographies: typographies.lerp(other.typographies, t),
    );
  }
}
