import 'package:flutter/material.dart';

import 'widgets/item_card.dart';

part 'sections/menu_list_grid.dart';
part 'sections/menu_list_tabs.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MenuListTabs();
  }
}
