import 'package:flutter/material.dart';

class AppThemeTypography {
  final TextStyle title;
  final TextStyle bodyHeader;
  final TextStyle body;
  final TextStyle bodySmall;

  const AppThemeTypography({
    this.title = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    this.bodyHeader = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    this.body = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    this.bodySmall = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  });

  AppThemeTypography lerp(covariant dynamic other, double t) {
    if (other is! AppThemeTypography) return this;

    return AppThemeTypography(
      title: TextStyle.lerp(title, other.title, t)!,
      bodyHeader: TextStyle.lerp(bodyHeader, other.bodyHeader, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
    );
  }
}
