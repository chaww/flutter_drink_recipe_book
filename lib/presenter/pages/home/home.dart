// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_event.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_selector.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_list/menu_list.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/extensions.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.dark.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.light.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onThemeSwitcherPressed(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    final currentTheme = settingsBloc.state.theme;

    settingsBloc.add(SettingsThemeChanged(
      currentTheme is LightAppTheme
          ? const DarkAppTheme()
          : const LightAppTheme(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Tea', 'Coffee', 'Smoothies', 'Soda', 'Others'];

    return Scaffold(
      // backgroundColor: context.appTheme.colors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              SizedBox(height: 26),
              Row(
                children: [
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: SettingsThemeSelector(
                      builder: (theme) => ThemeSwitcherButton(
                        isDarkTheme: theme is DarkAppTheme,
                        onPressed: () => _onThemeSwitcherPressed(context),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Placeholder(
                child: SizedBox(height: 120, width: 240),
              ),
              const SizedBox(height: 64),
              const Text(
                'Drink Recipe',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 64),
              // const Row(
              //   children: [
              //     Text(
              //       'categories',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              //     ),
              //     Spacer(),
              //   ],
              // ),
              Center(
                child: Text(
                  'Categories',
                  // style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  style: context.typographies.title,
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
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
