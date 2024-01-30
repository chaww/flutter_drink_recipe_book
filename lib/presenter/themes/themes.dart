import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme();

  @override
  AppTheme copyWith() {
    return const AppTheme();
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return const AppTheme();
  }
}
