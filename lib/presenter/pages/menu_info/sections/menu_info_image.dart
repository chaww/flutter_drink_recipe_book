part of '../menu_info.dart';

class _MenuInfoImage extends StatelessWidget {
  const _MenuInfoImage();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safeArea = MediaQuery.paddingOf(context);
    final appBarHeight = AppBar().preferredSize.height;

    final areaMinHeight = screenHeight * 0.5 - appBarHeight - safeArea.top;

    return Placeholder(
      child: SizedBox(
        height: areaMinHeight,
        width: double.infinity,
      ),
    );
  }
}
