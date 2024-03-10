import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/entities/user_data.dart';

abstract class AppSettinsRepository {
  AppSettinsRepository();

  Future<void> initialize();

  Future<AppSettings> getAppSettings();

  Future<void> updateAppSettings(AppSettings appSettings);

  Stream<UserData> authChanges();

  Future<void> signInWithEmailAndPassword({required String email, required String password});
}
