import 'package:hive/hive.dart';

import 'recipe.dart';

part 'menu.g.dart';

@HiveType(typeId: 1)
class MenuHiveModel extends HiveObject {
  static const String boxKey = 'menu';

  @HiveField(0)
  late String nameTh;

  @HiveField(1)
  late String nameEn;

  @HiveField(2)
  late String imageSrc;

  @HiveField(3)
  late String category;

  @HiveField(4)
  late List<RecipeHiveModel> recipesHot;

  @HiveField(5)
  late List<RecipeHiveModel> recipesIce;

  @HiveField(6)
  late List<RecipeHiveModel> recipesFrappe;
}
