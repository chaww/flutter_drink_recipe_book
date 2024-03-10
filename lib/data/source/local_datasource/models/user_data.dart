import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 5)
class UserDataHiveModel extends HiveObject {
  static const String boxKey = 'userData';

  @HiveField(0)
  late String email;

  @HiveField(1)
  late bool isEditor;

  @HiveField(2)
  late bool isReader;
}
