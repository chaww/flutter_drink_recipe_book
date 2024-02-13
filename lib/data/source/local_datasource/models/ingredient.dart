import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 3)
class IngredientHiveModel extends HiveObject {
  static const String boxKey = 'ingredient';

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String volume;

  @HiveField(2)
  late String unit;
}
