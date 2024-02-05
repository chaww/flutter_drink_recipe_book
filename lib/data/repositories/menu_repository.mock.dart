// ignore_for_file: prefer_const_constructors

import 'package:rxdart/subjects.dart';
import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';

class MenuMockRepository extends MenuRepository {
  MenuMockRepository() {
    _init();
  }

  final menuList = <Menu>[
    Menu(
      id: '1',
      nameTh: 'อเมริกาโน่',
      nameEn: 'Americano',
      imageSrc: '',
      category: 'coffee',
      recipesHot: [
        Recipe(
          optionName: 'กาแฟอ่อน',
          ingredients: [
            Ingredient(name: 'กาแฟอ่อน', value: '1', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', value: '2', unit: 'ML'),
          ],
        ),
        Recipe(
          optionName: 'กาแฟคั่วกลาง',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', value: '3', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', value: '4', unit: 'ML'),
          ],
        ),
        Recipe(
          optionName: 'กาแฟคั่วเข้ม',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วเข้ม', value: '3', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', value: '4', unit: 'ML'),
          ],
        ),
      ],
      recipesIce: [
        Recipe(
          optionName: 'กาแฟอ่อน',
          ingredients: [
            Ingredient(name: 'กาแฟอ่อน', value: '1', unit: 'ML'),
            Ingredient(name: 'น้ำแข็ง', value: '2', unit: 'ML'),
          ],
        ),
        Recipe(
          optionName: 'กาแฟคั่วกลาง',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', value: '3', unit: 'ML'),
            Ingredient(name: 'น้ำแข็ง', value: '4', unit: 'ML'),
          ],
        ),
      ],
      recipesFrappe: [],
    ),
    Menu(
      id: '2',
      nameTh: 'ชาพีช',
      nameEn: 'Peach Tea',
      imageSrc: '',
      category: 'tea',
      recipesHot: [
        Recipe(
          optionName: 'ปกติ',
          ingredients: [
            Ingredient(name: 'ผงชาพีช', value: '15', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', value: '16', unit: 'ML'),
          ],
        ),
      ],
      recipesIce: [
        Recipe(
          optionName: 'ปกติ',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', value: '12', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', value: '16', unit: 'ML'),
            Ingredient(name: 'น้ำแข็ง', value: '11', unit: 'ML'),
          ],
        ),
      ],
      recipesFrappe: [],
    ),
  ];

  final _menuStreamController = BehaviorSubject<List<Menu>>.seeded(const []);

  void _init() {
    _menuStreamController.add(menuList);
  }

  @override
  Stream<List<Menu>> getMenuList() => _menuStreamController.asBroadcastStream();

  @override
  Future<Menu?> getMenu(String id) async {
    final menu = menuList.where((e) => e.id == id);
    return menu.first;
  }

  @override
  Future<void> saveMenu(Menu menu) async {}

  @override
  Future<void> deleteMenu(String id) async {}
}
