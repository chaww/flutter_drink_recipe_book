import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/locale/l10n.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_selector.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/home/home.dart';

class DrinkRecipeBookApp extends StatelessWidget {
  const DrinkRecipeBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<SettingsBloc>().state.locale;

    return SettingsThemeSelector(
      builder: (theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.themeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(locale),
        title: 'Drink Recipe Book',
        home: const HomePage(),
      ),
    );
  }
}
