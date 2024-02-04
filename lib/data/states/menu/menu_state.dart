import 'package:flutter/foundation.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    @Default([]) List<Menu> menuList,
  }) = _MenuState;
}
