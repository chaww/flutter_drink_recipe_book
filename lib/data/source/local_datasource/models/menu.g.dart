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
      ..id = fields[0] as String
      ..nameTh = fields[1] as String
      ..nameEn = fields[2] as String
      ..imageSrc = fields[3] as String
      ..category = fields[4] as String
      ..recipesHot = (fields[5] as List).cast<RecipeHiveModel>()
      ..recipesIce = (fields[6] as List).cast<RecipeHiveModel>()
      ..recipesFrappe = (fields[7] as List).cast<RecipeHiveModel>();
  }

  @override
  void write(BinaryWriter writer, MenuHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameTh)
      ..writeByte(2)
      ..write(obj.nameEn)
      ..writeByte(3)
      ..write(obj.imageSrc)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.recipesHot)
      ..writeByte(6)
      ..write(obj.recipesIce)
      ..writeByte(7)
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
