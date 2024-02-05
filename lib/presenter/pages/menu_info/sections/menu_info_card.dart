// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../menu_info.dart';

class _MenuInfoCard extends StatelessWidget {
  const _MenuInfoCard({required this.menu});

  final Menu menu;

  Widget _buildSlidingUpPanel({
    required BuildContext context,
    required Widget child,
  }) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safeArea = MediaQuery.paddingOf(context);
    final appBarHeight = AppBar().preferredSize.height;

    final cardMinHeight = screenHeight * 0.5;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;

    return SlidingUpPanel(
      minHeight: cardMinHeight,
      maxHeight: cardMaxHeight,
      boxShadow: null,
      color: Colors.transparent,
      panel: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSlidingUpPanel(
      context: context,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: MainTabView(
          tabs: [
            MainTabData(
              label: Text(
                context.l10n.drinkTypeHot,
              ),
              child: _MenuInfoCardIngredients(recipeList: menu.recipesHot),
            ),
            MainTabData(
              label: Text(
                context.l10n.drinkTypeIce,
              ),
              child: _MenuInfoCardIngredients(recipeList: menu.recipesIce),
            ),
            MainTabData(
              label: Text(
                context.l10n.drinkTypeFrappe,
              ),
              child: _MenuInfoCardIngredients(recipeList: menu.recipesFrappe),
            ),
          ],
        ),
      ),
    );
  }
}
