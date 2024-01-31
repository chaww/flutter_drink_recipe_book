// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/widgets/main_tab_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'sections/menu_info_image.dart';
part 'sections/menu_info_card.dart';
part 'sections/menu_info_card_ingredients.dart';

class MenuInfoPage extends StatelessWidget {
  const MenuInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ชาพีชชชชชชชชชชช'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          _MenuInfoImage(),
          _MenuInfoCard(),
        ],
      ),
    );
  }
}
