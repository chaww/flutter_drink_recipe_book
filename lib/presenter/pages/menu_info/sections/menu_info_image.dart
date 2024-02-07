part of '../menu_info.dart';

class _MenuInfoImage extends StatelessWidget {
  const _MenuInfoImage();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final safeArea = MediaQuery.paddingOf(context);
    final appBarHeight = AppBar().preferredSize.height;

    final areaMinHeight = screenHeight * 0.5 - appBarHeight - safeArea.top;

    final cubit = context.watch<MenuInfoCubit>();

    return SizedBox(
      height: areaMinHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Placeholder(),
          if (cubit.state.showEditButton)
            Center(
              heightFactor: areaMinHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (cubit.state.menu.imageSrc.isEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: Icon(Icons.add_photo_alternate),
                      label: Text('เพิ่มรูปภาพ'),
                    ),
                  if (cubit.state.menu.imageSrc.isNotEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: Icon(Icons.photo),
                      label: Text('เปลี่ยนรูปภาพ'),
                    ),
                  if (cubit.state.menu.imageSrc.isNotEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: Icon(Icons.delete_forever),
                      label: Text('ลบรูปภาพ'),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
