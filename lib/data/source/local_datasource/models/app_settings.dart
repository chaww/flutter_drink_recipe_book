import 'package:hive/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 4)
class AppSettingsHiveModel extends HiveObject {
  static const String boxKey = 'appSettings';

  @HiveField(0)
  late String theme;

  @HiveField(1)
  late String locale;
}
