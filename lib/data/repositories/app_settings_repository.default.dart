import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/entities/user_data.dart';
import 'package:flutter_drink_recipe_book/data/repositories/app_settings_repository.dart';
import 'package:flutter_drink_recipe_book/data/source/firebase/firebase_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/entity_to_local_mapper.dart';
import 'package:flutter_drink_recipe_book/data/source/mappers/local_to_entity_mapper.dart';
import 'package:rxdart/subjects.dart';

class AppSettinsDefaultRepository extends AppSettinsRepository {
  AppSettinsDefaultRepository({
    required LocalDataSource localDataSource,
    required FirebaseDataSource firebaseDataSource,
  })  : _localDataSource = localDataSource,
        _firebaseDataSource = firebaseDataSource {
    initialize();
  }

  final LocalDataSource _localDataSource;
  final FirebaseDataSource _firebaseDataSource;

  final _authChangesStreamController = BehaviorSubject<UserData>.seeded(UserData.getDafault());

  @override
  Stream<UserData> authChanges() => _authChangesStreamController.asBroadcastStream();

  @override
  Future<void> initialize() async {
    await _onAuthChanges();
  }

  Future<void> _onAuthChanges() async {
    _firebaseDataSource.authStateChanges().listen((User? user) async {
      var email = '';
      var isEditor = false;
      var isReader = false;
      if (user != null && user.email != null) {
        email = user.email!;
        if (email.contains('master')) {
          isEditor = true;
          isReader = true;
        } else {
          isReader = true;
        }
      }
      _authChangesStreamController.add(
        UserData(
          email: email,
          isEditor: isEditor,
          isReader: isReader,
        ),
      );
    });
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _firebaseDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

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
}
