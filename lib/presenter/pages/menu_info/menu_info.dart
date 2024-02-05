// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';
import 'package:flutter_drink_recipe_book/data/locale/l10n.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/cubit/menu_info_cubit.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_type.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/extensions.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/main_tab_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'sections/menu_info_image.dart';
part 'sections/menu_info_card.dart';
part 'sections/menu_info_card_ingredients.dart';

class MenuInfoPage extends StatelessWidget {
  const MenuInfoPage({
    super.key,
    required this.menu,
  });

  final Menu menu;

  static Route<void> route({required Menu menu}) {
    return MaterialPageRoute(
      builder: (context) => MenuInfoPage(menu: menu),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuInfoCubit(menu: menu),
      child: MenuInfoPageScaffold(),
    );
  }
}

class MenuInfoPageScaffold extends StatelessWidget {
  const MenuInfoPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MenuInfoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(cubit.state.menu.nameTh),
        foregroundColor: context.colors.text,
        titleTextStyle: context.typographies.title.copyWith(
          color: context.colors.text,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: cubit.state.showEditButton ? context.colors.primary : null,
            onPressed: () {
              cubit.setShowEditButton(!cubit.state.showEditButton);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Text(cubit.state.menu.nameTh),
              _MenuInfoImage(),
            ],
          ),
          _MenuInfoCard(),
        ],
      ),
    );
  }
}
