import 'package:hive/hive.dart';

part 'login_remember.g.dart';

@HiveType(typeId: 5)
class LoginRememberHiveModel extends HiveObject {
  static const String boxKey = 'loginRemember';

  @HiveField(0)
  late String email;

  @HiveField(1)
  late String password;
}
