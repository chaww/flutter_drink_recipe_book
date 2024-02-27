import 'package:flutter_drink_recipe_book/data/entities/menu.dart';

abstract class MenuRepository {
  const MenuRepository();

  Stream<List<Menu>> listMenuStream();

  Future<Menu> updateMenu(Menu menu);

  Future<void> deleteMenu(String id);

  Future<List<String>?> displayPickImageDialog();

  Future<void> syncUpload();

  Future<void> syncDownload();
}
