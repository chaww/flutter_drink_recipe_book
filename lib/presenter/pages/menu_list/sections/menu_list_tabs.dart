part of '../menu_list.dart';

class _MenuListTabs extends StatefulWidget {
  const _MenuListTabs();

  @override
  State<_MenuListTabs> createState() => _MenuListTabsState();
}

class _MenuListTabsState extends State<_MenuListTabs> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      context.l10n.drinkCategorieAll,
      context.l10n.drinkCategorieTea,
      context.l10n.drinkCategorieCoffee,
      context.l10n.drinkCategorieSmoothies,
      context.l10n.drinkCategorieSoda,
      context.l10n.drinkCategorieOthers,
    ];
    final sizeWidth = MediaQuery.sizeOf(context).width;

    return DefaultTabController(
      initialIndex: 0,
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.menuListAppBarTitle),
          foregroundColor: context.colors.text,
          titleTextStyle: context.typographies.title.copyWith(
            color: context.colors.text,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 32,
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: sizeWidth <= (categories.length + 1) * 120,
            indicatorColor: context.colors.primary,
            labelColor: context.colors.text,
            labelStyle: context.typographies.bodyHeader,
            tabs: [
              ...List.generate(
                categories.length,
                (index) => Tab(
                  child: Text(
                    categories[index],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ...List.generate(
              categories.length,
              (index) => const _MenuListGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
