import 'package:flutter/material.dart';

class AppThemeTypography {
  final TextStyle body;

  const AppThemeTypography({
    this.body = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  });

  AppThemeTypography lerp(covariant dynamic other, double t) {
    if (other is! AppThemeTypography) return this;

    return AppThemeTypography(
      body: TextStyle.lerp(body, other.body, t)!,
    );
  }
}
