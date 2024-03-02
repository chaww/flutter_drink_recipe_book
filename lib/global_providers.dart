import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/repositories/app_settings_repository.default.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.default.dart';
import 'package:flutter_drink_recipe_book/data/source/firebase/firebase_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_datasource/local_datasource.dart';
import 'package:flutter_drink_recipe_book/data/source/local_file/local_file.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/menu/menu_bloc.dart';

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;
  final LocalFile localFile;
  final LocalDataSource localDataSource;
  final FirebaseDataSource firebaseDataSource;

  const GlobalBlocProviders({
    super.key,
    required this.child,
    required this.localFile,
    required this.localDataSource,
    required this.firebaseDataSource,
  });

  Widget _buildMultiRepositoryProvider({
    required Widget child,
  }) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MenuDefaultRepository>(
          create: (context) => MenuDefaultRepository(
            localDataSource: localDataSource,
            localFile: localFile,
            firebaseDataSource: firebaseDataSource,
          ),
        ),
        RepositoryProvider<AppSettinsDefaultRepository>(
          create: (context) => AppSettinsDefaultRepository(
            localDataSource: localDataSource,
            firebaseDataSource: firebaseDataSource,
          ),
        ),
      ],
      child: child,
    );
  }

  Widget _buildMultiBlocProvider({
    required Widget child,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            appSettinsRepository: context.read<AppSettinsDefaultRepository>(),
          ),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(
            menuRepository: context.read<MenuDefaultRepository>(),
          )..add(const SubscriptionListMenu()),
        ),
      ],
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMultiRepositoryProvider(
      child: _buildMultiBlocProvider(
        child: child,
      ),
    );
  }
}
