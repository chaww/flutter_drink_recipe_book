part of '../menu_list.dart';

class _MenuListTabs extends StatefulWidget {
  const _MenuListTabs();

  @override
  State<_MenuListTabs> createState() => _MenuListTabsState();
}

class _MenuListTabsState extends State<_MenuListTabs> {
  @override
  Widget build(BuildContext context) {
    final categoriesText = [
      context.l10n.drinkCategorieAll,
      context.l10n.drinkCategorieTea,
      context.l10n.drinkCategorieCoffee,
      context.l10n.drinkCategorieSmoothies,
      context.l10n.drinkCategorieSoda,
      context.l10n.drinkCategorieOthers,
    ];
    final categoriesValue = [
      'all',
      'tea',
      'coffee',
      'smoothies',
      'soda',
      'others',
    ];
    final sizeWidth = MediaQuery.sizeOf(context).width;

    return DefaultTabController(
      initialIndex: 0,
      length: categoriesText.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.menuListAppBarTitle),
          foregroundColor: context.colors.text,
          titleTextStyle: context.typographies.headingSmall.copyWith(
            color: context.colors.text,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 32,
              onPressed: () {
                var menu = Menu.createDefault();
                Navigator.of(context).push(MenuInfoPage.route(menu: menu));
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: sizeWidth <= (categoriesText.length + 1) * 120,
            indicatorColor: context.colors.primary,
            labelColor: context.colors.text,
            labelStyle: context.typographies.bodyLarge,
            tabs: [
              ...List.generate(
                categoriesText.length,
                (index) => Tab(
                  child: Text(
                    categoriesText[index],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ...List.generate(
              categoriesText.length,
              (index) => _MenuListGrid(filterCategory: categoriesValue[index]),
            ),
          ],
        ),
      ),
    );
  }
}
