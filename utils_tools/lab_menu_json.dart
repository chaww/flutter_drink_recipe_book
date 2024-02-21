// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

void main() async {
  {
    File jsonFile = File('utils_tools/lab_menu_json.json');
    final menuList = MockMenu.menuList;
    final mmm = menuList.map((e) => e.toMap()).toList();
    final aaa = jsonEncode(mmm);
    jsonFile.writeAsStringSync(aaa);
  }
  {
    File jsonFile = File('utils_tools/lab_menu_json.json');
    final jsonStr = jsonFile.readAsStringSync();
    List<dynamic> list = jsonDecode(jsonStr);
    final aaa = list.map((e) => Menu.fromMap(e)).toList();
    print(aaa[0].category);
  }
}

class MockMenu {
  static final menuList = <Menu>[
    const Menu(
      id: '1',
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
      id: '2',
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

class Ingredient extends Equatable {
  final String name;
  final String volume;
  final String unit;

  const Ingredient({
    required this.name,
    required this.volume,
    required this.unit,
  });

  Ingredient copyWith({
    String? name,
    String? volume,
    String? unit,
  }) {
    return Ingredient(
      name: name ?? this.name,
      volume: volume ?? this.volume,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object> get props => [name, volume, unit];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'volume': volume,
      'unit': unit,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'] as String,
      volume: map['volume'] as String,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class Recipe extends Equatable {
  final String optionName;
  final List<Ingredient> ingredients;
  const Recipe({
    required this.optionName,
    required this.ingredients,
  });

  Recipe copyWith({
    String? optionName,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      optionName: optionName ?? this.optionName,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  List<Object> get props => [optionName, ingredients];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionName': optionName,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      optionName: map['optionName'] as String,
      ingredients: List<Ingredient>.from(
        (map['ingredients'] as List<dynamic>).map<Ingredient>(
          (x) => Ingredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) =>
      Recipe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class Menu extends Equatable {
  final String id;
  final String nameTh;
  final String nameEn;
  final String imageSrc;
  final String category;
  final List<Recipe> recipesHot;
  final List<Recipe> recipesIce;
  final List<Recipe> recipesFrappe;
  const Menu({
    required this.id,
    required this.nameTh,
    required this.nameEn,
    required this.imageSrc,
    required this.category,
    required this.recipesHot,
    required this.recipesIce,
    required this.recipesFrappe,
  });

  Menu copyWith({
    String? id,
    String? nameTh,
    String? nameEn,
    String? imageSrc,
    String? category,
    List<Recipe>? recipesHot,
    List<Recipe>? recipesIce,
    List<Recipe>? recipesFrappe,
  }) {
    return Menu(
      id: id ?? this.id,
      nameTh: nameTh ?? this.nameTh,
      nameEn: nameEn ?? this.nameEn,
      imageSrc: imageSrc ?? this.imageSrc,
      category: category ?? this.category,
      recipesHot: recipesHot ?? this.recipesHot,
      recipesIce: recipesIce ?? this.recipesIce,
      recipesFrappe: recipesFrappe ?? this.recipesFrappe,
    );
  }

  static Menu createDefault() {
    return const Menu(
      id: '',
      nameTh: '',
      nameEn: '',
      imageSrc: '',
      category: 'others',
      recipesHot: [],
      recipesIce: [],
      recipesFrappe: [],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      nameTh,
      nameEn,
      imageSrc,
      category,
      recipesHot,
      recipesIce,
      recipesFrappe,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameTh': nameTh,
      'nameEn': nameEn,
      'imageSrc': imageSrc,
      'category': category,
      'recipesHot': recipesHot.map((x) => x.toMap()).toList(),
      'recipesIce': recipesIce.map((x) => x.toMap()).toList(),
      'recipesFrappe': recipesFrappe.map((x) => x.toMap()).toList(),
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] as String,
      nameTh: map['nameTh'] as String,
      nameEn: map['nameEn'] as String,
      imageSrc: map['imageSrc'] as String,
      category: map['category'] as String,
      recipesHot: List<Recipe>.from(
        (map['recipesHot'] as List<dynamic>).map<Recipe>(
          (x) => Recipe.fromMap(x as Map<String, dynamic>),
        ),
      ),
      recipesIce: List<Recipe>.from(
        (map['recipesIce'] as List<dynamic>).map<Recipe>(
          (x) => Recipe.fromMap(x as Map<String, dynamic>),
        ),
      ),
      recipesFrappe: List<Recipe>.from(
        (map['recipesFrappe'] as List<dynamic>).map<Recipe>(
          (x) => Recipe.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
