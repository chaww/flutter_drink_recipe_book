import 'package:flutter_drink_recipe_book/presenter/themes/themes.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.light.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(LightAppTheme()) AppTheme theme,
    @Default('en') String locale,
  }) = _SettingsState;
}
