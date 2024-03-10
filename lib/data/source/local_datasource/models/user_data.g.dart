// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataHiveModelAdapter extends TypeAdapter<UserDataHiveModel> {
  @override
  final int typeId = 5;

  @override
  UserDataHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataHiveModel()
      ..email = fields[0] as String
      ..isEditor = fields[1] as bool
      ..isReader = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, UserDataHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.isEditor)
      ..writeByte(2)
      ..write(obj.isReader);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
