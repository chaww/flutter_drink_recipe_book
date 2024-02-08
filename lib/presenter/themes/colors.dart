import 'package:flutter/material.dart';

class AppThemeColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color backgroundDark;
  final Color text;

  const AppThemeColors({
    required this.primary,
    required this.secondary,
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
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      text: Color.lerp(text, other.text, t)!,
    );
  }

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
    Color? secondary,
    Color? background,
    Color? backgroundDark,
    Color? text,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      text: text ?? this.text,
    );
  }
}
