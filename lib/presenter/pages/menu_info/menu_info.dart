// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
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
part 'widgets/icon_button_size.dart';
part 'modals/modal_edit_ingredient.dart';
part 'modals/modal_edit_name.dart';
part 'modals/modal_edit_option_name.dart';

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
    if (cubit.state.menu.id.isEmpty) cubit.setShowEditButton(true);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              cubit.state.menu.nameTh,
            ),
            Text(
              cubit.state.menu.nameEn.isNotEmpty ? '(${cubit.state.menu.nameEn})' : '',
            ),
          ],
        ),
        foregroundColor: context.colors.text,
        titleTextStyle: context.typographies.headingSmall.copyWith(
          color: context.colors.text,
        ),
        actions: [
          if (cubit.state.showEditButton)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          PopupMenuButton<int>(
            onSelected: (item) {
              switch (item) {
                case 0:
                  cubit.setShowEditButton(!cubit.state.showEditButton);
                  break;
                case 1:
                  break;
                default:
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Edit')),
              PopupMenuItem<int>(value: 1, child: Text('Delete')),
            ],
          ),
        ],
      ),
      floatingActionButton: cubit.state.showEditButton
          ? FloatingActionButton(
              onPressed: () {
                cubit.setShowEditButton(!cubit.state.showEditButton);
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.done),
            )
          : null,
      body: Stack(
        children: [
          _MenuInfoImage(),
          _MenuInfoCard(),
        ],
      ),
    );
  }
}
