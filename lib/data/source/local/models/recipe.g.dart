// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeHiveModelAdapter extends TypeAdapter<RecipeHiveModel> {
  @override
  final int typeId = 3;

  @override
  RecipeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeHiveModel()
      ..optionName = fields[0] as String
      ..ingredients = (fields[1] as List).cast<IngredientHiveModel>();
  }

  @override
  void write(BinaryWriter writer, RecipeHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.optionName)
      ..writeByte(1)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
