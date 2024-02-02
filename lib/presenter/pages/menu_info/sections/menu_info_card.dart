// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../menu_info.dart';

class _MenuInfoCard extends StatelessWidget {
  const _MenuInfoCard();

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
                'Hot',
              ),
              child: _MenuInfoCardIngredients(),
            ),
            MainTabData(
              label: Text(
                'Ice',
              ),
              child: _MenuInfoCardIngredients(),
            ),
            MainTabData(
              label: Text(
                'Frappe',
              ),
              child: _MenuInfoCardIngredients(),
            ),
          ],
        ),
      ),
    );
  }

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
}
