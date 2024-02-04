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
      ..category = fields[2] as MenuCategoriesHiveModel
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

class MenuCategoriesHiveModelAdapter
    extends TypeAdapter<MenuCategoriesHiveModel> {
  @override
  final int typeId = 2;

  @override
  MenuCategoriesHiveModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MenuCategoriesHiveModel.tea;
      case 1:
        return MenuCategoriesHiveModel.coffee;
      case 2:
        return MenuCategoriesHiveModel.smoothies;
      case 3:
        return MenuCategoriesHiveModel.soda;
      case 4:
        return MenuCategoriesHiveModel.others;
      default:
        return MenuCategoriesHiveModel.tea;
    }
  }

  @override
  void write(BinaryWriter writer, MenuCategoriesHiveModel obj) {
    switch (obj) {
      case MenuCategoriesHiveModel.tea:
        writer.writeByte(0);
        break;
      case MenuCategoriesHiveModel.coffee:
        writer.writeByte(1);
        break;
      case MenuCategoriesHiveModel.smoothies:
        writer.writeByte(2);
        break;
      case MenuCategoriesHiveModel.soda:
        writer.writeByte(3);
        break;
      case MenuCategoriesHiveModel.others:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuCategoriesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
