import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 4)
class IngredientHiveModel extends HiveObject {
  static const String boxKey = 'ingredient';

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String value;

  @HiveField(2)
  late String unit;
}
