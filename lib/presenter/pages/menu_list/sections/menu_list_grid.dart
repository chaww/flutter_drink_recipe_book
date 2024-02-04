part of '../menu_list.dart';

class _MenuListGrid extends StatelessWidget {
  const _MenuListGrid({
    required this.filterCategory,
  });

  final String filterCategory;

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = MediaQuery.sizeOf(context).width ~/ 160;
    if (crossAxisCount == 0) crossAxisCount = 1;

    final menuList = context.watch<MenuBloc>().state.menuList;
    final menuListFiltered = menuList.where(
      (e) {
        final isAll = filterCategory.toLowerCase() == 'all';
        final isEqual = e.category.toLowerCase() == filterCategory.toLowerCase();
        return isAll || isEqual;
      },
    );

    return GridView.count(
      // childAspectRatio: 408 / 612,
      crossAxisCount: crossAxisCount,
      childAspectRatio: 1 / 1.2,
      primary: false,
      padding: const EdgeInsets.all(4),
      children: <Widget>[
        ...menuListFiltered.map(
          (menu) => ItemCard(
            menu: menu,
          ),
        ),
      ],
    );
  }
}
