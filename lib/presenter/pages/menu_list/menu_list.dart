import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/config/locale/l10n.dart';
import 'package:flutter_drink_recipe_book/presenter/states/menu/menu_bloc.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_info.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/extensions.dart';

import 'widgets/item_card.dart';

part 'sections/menu_list_grid.dart';
part 'sections/menu_list_tabs.dart';

class ListMenuPage extends StatelessWidget {
  const ListMenuPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const ListMenuPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _ListMenuTabs();
  }
}
