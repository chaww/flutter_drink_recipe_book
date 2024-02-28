// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/locale/l10n.dart';
import 'package:flutter_drink_recipe_book/data/states/menu/menu_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_bloc.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_selector.dart';
import 'package:flutter_drink_recipe_book/presenter/assets.gen.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_list/menu_list.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/extensions.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.dark.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/locale_switcher_button.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/theme_switcher_button.dart';

part 'sections/home_cloud.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Image imageLight;
  late Image imageDark;

  @override
  void initState() {
    super.initState();
    imageLight = Image(image: Assets.hidden.logoLight.provider(), width: 240);
    imageDark = Image(image: Assets.hidden.logoDark.provider(), width: 240);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(imageLight.image, context);
    precacheImage(imageDark.image, context);
  }

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
      context.l10n.drinkCategoryAll,
      context.l10n.drinkCategoryTea,
      context.l10n.drinkCategoryCoffee,
      context.l10n.drinkCategorySmoothies,
      context.l10n.drinkCategorySoda,
      context.l10n.drinkCategoryOthers,
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
              if (context.appTheme.name == 'light') imageLight else imageDark,
              const SizedBox(height: 64),
              _HomeCloud(),

              // Text(
              //   context.l10n.appTitle,
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(height: 64),
              // Center(
              //   child: Text(
              //     context.l10n.drinkCategories,
              //     style: context.typographies.headingSmall,
              //   ),
              // ),
              // GridView(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     childAspectRatio: 2.58,
              //     mainAxisSpacing: 15,
              //   ),
              //   children: [
              //     ...categories.map(
              //       (e) => Card(
              //         clipBehavior: Clip.antiAlias,
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.of(context).push(ListMenuPage.route());
              //           },
              //           child: Align(
              //             alignment: Alignment.center,
              //             child: Text(
              //               e,
              //               style: context.typographies.body,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
