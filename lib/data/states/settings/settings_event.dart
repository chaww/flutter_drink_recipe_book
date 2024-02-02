import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.themeChanged(AppTheme theme) =
      SettingsThemeChanged;

  const factory SettingsEvent.localeChanged(String locale) =
      SettingsLocaleChanged;
}
