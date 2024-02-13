import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';

abstract class AppSettinsRepository {
  const AppSettinsRepository();

  Future<AppSettings?> getAppSettings();

  Future<void> updateAppSettings(AppSettings appSettings);
}
