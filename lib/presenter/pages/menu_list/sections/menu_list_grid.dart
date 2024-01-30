part of '../menu_list.dart';

class _MenuListGrid extends StatelessWidget {
  const _MenuListGrid();

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = MediaQuery.sizeOf(context).width ~/ 160;
    if (crossAxisCount == 0) crossAxisCount = 1;

    final menuList = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    return GridView.count(
      // childAspectRatio: 408 / 612,
      crossAxisCount: crossAxisCount,
      childAspectRatio: 1 / 1.2,
      primary: false,
      padding: const EdgeInsets.all(4),
      children: <Widget>[
        ...menuList.map(
          (v) => const ItemCard(),
        ),
      ],
    );
  }
}
