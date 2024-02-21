// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'recipe.dart';

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
}
