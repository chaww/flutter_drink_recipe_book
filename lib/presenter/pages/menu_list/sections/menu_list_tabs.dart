part of '../menu_list.dart';

class _MenuListTabs extends StatefulWidget {
  const _MenuListTabs();

  @override
  State<_MenuListTabs> createState() => _MenuListTabsState();
}

class _MenuListTabsState extends State<_MenuListTabs> {
  final category = ['ทั้งหมด', 'ชา', 'กาแฟ', 'สมูทตี้', 'โซดา', 'อื่นๆ'];

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      initialIndex: 0,
      length: category.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('รายการเมนู'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 32,
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: sizeWidth <= (category.length + 1) * 120,
            tabs: [
              ...List.generate(
                category.length,
                (index) => Tab(
                  child: Text(
                    category[index],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ...List.generate(
              category.length,
              (index) => const _MenuListGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
