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
      ..nameTh = fields[0] as String
      ..nameEn = fields[1] as String
      ..imageSrc = fields[2] as String
      ..category = fields[3] as String
      ..recipesHot = (fields[4] as List).cast<RecipeHiveModel>()
      ..recipesIce = (fields[5] as List).cast<RecipeHiveModel>()
      ..recipesFrappe = (fields[6] as List).cast<RecipeHiveModel>();
  }

  @override
  void write(BinaryWriter writer, MenuHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.nameTh)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.imageSrc)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.recipesHot)
      ..writeByte(5)
      ..write(obj.recipesIce)
      ..writeByte(6)
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
