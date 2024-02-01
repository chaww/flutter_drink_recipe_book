import 'package:flutter/material.dart';

class AppThemeColors {
  final MaterialColor primarySwatch;
  final Color primary;

  const AppThemeColors({
    required this.primarySwatch,
    required this.primary,
  });

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
    );
  }

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
  }) {
    return AppThemeColors(
      primarySwatch: primarySwatch ?? this.primarySwatch,
      primary: primary ?? this.primary,
    );
  }
}
