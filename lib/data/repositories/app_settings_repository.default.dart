import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/entities/login_remember.dart';
import 'package:flutter_drink_recipe_book/data/repositories/app_settings_repository.dart';
import 'package:flutter_drink_recipe_book/data/source/firebase/firebase_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/entity_to_local_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';

class AppSettinsDefaultRepository extends AppSettinsRepository {
  AppSettinsDefaultRepository({
    required LocalDataSource localDataSource,
    required FirebaseDataSource firebaseDataSource,
  })  : _localDataSource = localDataSource,
        _firebaseDataSource = firebaseDataSource;

  final LocalDataSource _localDataSource;
  final FirebaseDataSource _firebaseDataSource;

  @override
  Future<AppSettings> getAppSettings() async {
    final appSettingsModel = await _localDataSource.getAppSettings();
    if (appSettingsModel == null) {
      return const AppSettings(theme: 'light', locale: 'th');
    } else {
      return appSettingsModel.toEntity();
    }
  }

  @override
  Future<void> updateAppSettings(AppSettings appSettings) async {
    await _localDataSource.updateAppSettings(appSettings: appSettings.toHiveModel());
  }

  @override
  Future<LoginRemember> getLoginRemember() async {
    final loginRemember = await _localDataSource.getLoginRemember();
    if (loginRemember == null) return const LoginRemember(email: '', password: '');
    return loginRemember.toEntity();
  }

  @override
  Future<void> updateLoginRemember(LoginRemember loginRemember) async {
    await _localDataSource.updateLoginRemember(loginRemember: loginRemember.toHiveModel());
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _firebaseDataSource.signInWithEmailAndPassword(email: email, password: password);

  // Stream<void> authChanges() {}
}
