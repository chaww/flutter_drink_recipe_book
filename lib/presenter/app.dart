import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/config/locale/l10n.dart';
import 'package:flutter_drink_recipe_book/presenter/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/presenter/states/settings/settings_selector.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/home/home.dart';

class DrinkRecipeBookApp extends StatelessWidget {
  const DrinkRecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsBloc>().state;

    return SettingsThemeSelector(
      builder: (theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.themeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(state.locale),
        title: 'Drink Recipe Book',
        home: const HomePage(),
      ),
    );
  }
}
