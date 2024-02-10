import 'package:hive/hive.dart';

import 'ingredient.dart';

part 'recipe.g.dart';

@HiveType(typeId: 2)
class RecipeHiveModel extends HiveObject {
  static const String boxKey = 'recipe';

  @HiveField(0)
  late String optionName;

  @HiveField(1)
  late List<IngredientHiveModel> ingredients;
}
