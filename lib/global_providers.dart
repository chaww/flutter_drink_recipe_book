import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/repositories/app_settings_repository.default.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.default.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/menu/menu_bloc.dart';

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;
  final AppSettings appSettings;

  const GlobalBlocProviders({
    super.key,
    required this.child,
    required this.appSettings,
  });

  Widget _buildMultiBlocProvider({
    required Widget child,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            appSettinsRepository: context.read<AppSettinsDefaultRepository>(),
            appSettings: appSettings,
          ),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(
            menuRepository: context.read<MenuDefaultRepository>(),
          )..add(const SubscriptionMenuList()),
        ),
      ],
      child: child,
    );
  }

  Widget _buildMultiRepositoryProvider({
    required Widget child,
  }) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MenuDefaultRepository>(
          create: (context) => MenuDefaultRepository(),
        ),
        RepositoryProvider<AppSettinsDefaultRepository>(
          create: (context) => AppSettinsDefaultRepository(),
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
