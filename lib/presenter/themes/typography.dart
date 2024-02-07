import 'package:flutter/material.dart';

class AppThemeTypography {
  final TextStyle heading;
  final TextStyle headingSmall;
  final TextStyle bodyLarge;
  final TextStyle body;
  final TextStyle bodySmall;

  const AppThemeTypography({
    this.heading = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    this.headingSmall = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    this.bodyLarge = const TextStyle(
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
      heading: TextStyle.lerp(heading, other.heading, t)!,
      headingSmall: TextStyle.lerp(headingSmall, other.headingSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
    );
  }
}
