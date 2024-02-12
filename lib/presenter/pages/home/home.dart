// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/locale/l10n.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_selector.dart';
import 'package:flutter_drink_recipe_book/presenter/assets.gen.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_list/menu_list.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/extensions.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.dark.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/locale_switcher_button.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/theme_switcher_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onThemeSwitcherPressed(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    settingsBloc.add(SettingsThemeSwitch());
  }

  void _onLocaleSwitcherPressed(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    settingsBloc.add(SettingsLocaleSwitch());
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      context.l10n.drinkCategorieAll,
      context.l10n.drinkCategorieTea,
      context.l10n.drinkCategorieCoffee,
      context.l10n.drinkCategorieSmoothies,
      context.l10n.drinkCategorieSoda,
      context.l10n.drinkCategorieOthers,
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              SizedBox(height: 26),
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: SettingsThemeSelector(
                      builder: (theme) => ThemeSwitcherButton(
                        isDarkTheme: theme is DarkAppTheme,
                        onPressed: () => _onThemeSwitcherPressed(context),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: LocaleSwitcherButton(
                      locale: context.watch<SettingsBloc>().state.locale,
                      onPressed: () => _onLocaleSwitcherPressed(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              if (context.appTheme.name == 'light')
                Image(image: Assets.hidden.logoLight.provider(), width: 240)
              else
                Image(image: Assets.hidden.logoDark.provider(), width: 240),
              const SizedBox(height: 64),
              Text(
                context.l10n.appTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 64),
              Center(
                child: Text(
                  context.l10n.drinkCategories,
                  style: context.typographies.headingSmall,
                ),
              ),
              GridView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.58,
                  mainAxisSpacing: 15,
                ),
                children: [
                  ...categories.map(
                    (e) => Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MenuListPage.route());
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            e,
                            style: context.typographies.body,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
