import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.mock.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/menu/menu_bloc.dart';

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  Widget _buildMultiBlocProvider({
    required Widget child,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(
            menuRepository: context.read<MenuMockRepository>(),
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
        RepositoryProvider<MenuMockRepository>(
          create: (context) => MenuMockRepository(),
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
