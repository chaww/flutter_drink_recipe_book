import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/entities/login_remember.dart';

abstract class AppSettinsRepository {
  AppSettinsRepository();

  Future<AppSettings> getAppSettings();

  Future<void> updateAppSettings(AppSettings appSettings);

  Future<LoginRemember> getLoginRemember();

  Future<void> updateLoginRemember(LoginRemember loginRemember);
}
