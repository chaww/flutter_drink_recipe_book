import 'package:flutter_drink_recipe_book/data/entities/menu.dart';

abstract class MenuRepository {
  const MenuRepository();

  Stream<List<Menu>> getMenuList();

  Future<Menu?> getMenu(String id);

  Future<void> saveMenu(Menu menu);

  Future<void> deleteMenu(String id);
}
