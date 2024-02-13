import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/repositories/app_settings_repository.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/entity_to_local_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';

class AppSettinsDefaultRepository extends AppSettinsRepository {
  AppSettinsDefaultRepository();

  final _localDataSource = LocalDataSource();

  @override
  Future<AppSettings?> getAppSettings() async {
    final appSettingsModel = await _localDataSource.getAppSettings();
    if (appSettingsModel == null) return null;
    return appSettingsModel.toEntity();
  }

  @override
  Future<void> updateAppSettings(AppSettings appSettings) async {
    await _localDataSource.updateAppSettings(appSettings: appSettings.toHiveModel());
  }
}
