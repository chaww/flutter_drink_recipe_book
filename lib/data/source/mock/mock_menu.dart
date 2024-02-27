import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';

class MockMenu {
  static final listMenu = <Menu>[
    const Menu(
      id: '03c41b99-9346-4cfd-8fcf-0f58cf665275',
      nameTh: 'อเมริกาโน่',
      nameEn: 'Americano',
      imageSrc: '',
      category: 'coffee',
      recipesHot: [
        Recipe(
          optionName: 'คั่วอ่อน',
          ingredients: [
            Ingredient(name: 'กาแฟอ่อน', volume: '1', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', volume: '2', unit: 'ML'),
          ],
        ),
        Recipe(
          optionName: 'คั่วกลาง',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', volume: '3', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', volume: '4', unit: 'ML'),
          ],
        ),
        Recipe(
          optionName: 'คั่วเข้ม',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วเข้ม', volume: '3', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', volume: '4', unit: 'ML'),
          ],
        ),
      ],
      recipesIce: [
        Recipe(
          optionName: 'คั่วอ่อน',
          ingredients: [
            Ingredient(name: 'กาแฟอ่อน', volume: '1', unit: 'ML'),
            Ingredient(name: 'น้ำแข็ง', volume: '2', unit: 'ML'),
          ],
        ),
        Recipe(
          optionName: 'คั่วกลาง',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', volume: '3', unit: 'ML'),
            Ingredient(name: 'น้ำแข็ง', volume: '4', unit: 'ML'),
          ],
        ),
      ],
      recipesFrappe: [],
    ),
    const Menu(
      id: '5ef89221-158a-4e5e-8e2c-c52d68ace951',
      nameTh: 'ชาพีช',
      nameEn: 'Peach Tea',
      imageSrc: '',
      category: 'tea',
      recipesHot: [
        Recipe(
          optionName: 'ปกติ',
          ingredients: [
            Ingredient(name: 'ผงชาพีช', volume: '15', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', volume: '16', unit: 'ML'),
          ],
        ),
      ],
      recipesIce: [
        Recipe(
          optionName: 'ปกติ',
          ingredients: [
            Ingredient(name: 'กาแฟคั่วกลาง', volume: '12', unit: 'ML'),
            Ingredient(name: 'น้ำร้อน', volume: '16', unit: 'ML'),
            Ingredient(name: 'น้ำแข็ง', volume: '11', unit: 'ML'),
          ],
        ),
      ],
      recipesFrappe: [],
    ),
  ];
}
