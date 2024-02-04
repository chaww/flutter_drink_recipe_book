// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientHiveModelAdapter extends TypeAdapter<IngredientHiveModel> {
  @override
  final int typeId = 4;

  @override
  IngredientHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientHiveModel()
      ..name = fields[0] as String
      ..value = fields[1] as String
      ..unit = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, IngredientHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
