import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';
import 'package:flutter_drink_recipe_book/global_providers.dart';
import 'package:flutter_drink_recipe_book/presenter/app.dart';

Future<void> main() async {
  await LocalDataSource().initialize();
  final appSettings = await _getAppSettings();

  runApp(
    GlobalBlocProviders(
      appSettings: appSettings,
      child: const DrinkRecipeBookApp(),
    ),
  );
}

Future<AppSettings> _getAppSettings() async {
  final localDataSource = LocalDataSource();
  final appSettingsModel = await localDataSource.getAppSettings();
  if (appSettingsModel == null) {
    return const AppSettings(theme: 'light', locale: 'th');
  } else {
    final appSettings = appSettingsModel.toEntity();
    return appSettings;
  }
}
