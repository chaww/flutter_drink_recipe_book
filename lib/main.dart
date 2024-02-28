import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/data/source/firebase/firebase_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_file/local_file.dart';
import 'package:flutter_drink_recipe_book/global_providers.dart';
import 'package:flutter_drink_recipe_book/presenter/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final localDataSource = LocalDataSource();
  await localDataSource.initialize();

  const localFile = LocalFile();

  final firebaseDataSource = FirebaseDataSource();
  await firebaseDataSource.initialize();

  runApp(
    GlobalBlocProviders(
      localDataSource: localDataSource,
      localFile: localFile,
      firebaseDataSource: firebaseDataSource,
      child: const DrinkRecipeBookApp(),
    ),
  );
}
