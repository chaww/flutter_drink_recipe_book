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
}
