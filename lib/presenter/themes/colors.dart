import 'package:flutter/material.dart';

class AppThemeColors {
  final Color primary;
  final Color background;
  final Color backgroundDark;
  final Color text;

  const AppThemeColors({
    required this.primary,
    required this.background,
    required this.backgroundDark,
    required this.text,
  });

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      text: Color.lerp(text, other.text, t)!,
    );
  }

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
    Color? background,
    Color? backgroundDark,
    Color? text,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      text: text ?? this.text,
    );
  }
}
