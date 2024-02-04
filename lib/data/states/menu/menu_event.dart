import 'package:flutter/foundation.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_event.freezed.dart';

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.subscriptionMenuList() = SubscriptionMenuList;
  const factory MenuEvent.getMenu(String id) = GetMenu;
  const factory MenuEvent.saveMenu(Menu menu) = SaveMenu;
  const factory MenuEvent.deleteMenu(Menu menu) = DeleteMenu;
}
