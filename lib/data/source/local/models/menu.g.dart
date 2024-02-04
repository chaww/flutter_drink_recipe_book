// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuHiveModelAdapter extends TypeAdapter<MenuHiveModel> {
  @override
  final int typeId = 1;

  @override
  MenuHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuHiveModel()
      ..name = fields[0] as String
      ..imageSrc = fields[1] as String
      ..category = fields[2] as String
      ..recipesHot = (fields[3] as List).cast<RecipeHiveModel>()
      ..recipesIce = (fields[4] as List).cast<RecipeHiveModel>()
      ..recipesFrappe = (fields[5] as List).cast<RecipeHiveModel>();
  }

  @override
  void write(BinaryWriter writer, MenuHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageSrc)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.recipesHot)
      ..writeByte(4)
      ..write(obj.recipesIce)
      ..writeByte(5)
      ..write(obj.recipesFrappe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
