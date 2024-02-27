part of '../menu_list.dart';

class _ListMenuGrid extends StatelessWidget {
  const _ListMenuGrid({
    required this.filterCategory,
  });

  final String filterCategory;

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = MediaQuery.sizeOf(context).width ~/ 160;
    if (crossAxisCount == 0) crossAxisCount = 1;
    final listMenu = context.watch<MenuBloc>().state.listMenu;
    final listMenuFiltered = listMenu.where(
      (e) {
        final isAll = filterCategory.toLowerCase() == 'all';
        final filterText = filterCategory.toLowerCase();
        final isEqual = e.category.toLowerCase() == filterText;
        return isAll || isEqual;
      },
    );

    return GridView.count(
      // childAspectRatio: 408 / 612,
      crossAxisCount: crossAxisCount,
      childAspectRatio: 1 / 1.52,
      primary: false,
      padding: const EdgeInsets.all(4),
      children: <Widget>[
        ...listMenuFiltered.map(
          (menu) => ItemCard(
            menu: menu,
          ),
        ),
      ],
    );
  }
}
