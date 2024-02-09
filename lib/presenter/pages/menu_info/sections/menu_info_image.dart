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
    final state = cubit.state;

    return SizedBox(
      height: areaMinHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Placeholder(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: context.colors.primary),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.menu.category[0].toUpperCase()}${state.menu.category.substring(1)}',
                        style: context.typographies.body,
                      ),
                      if (state.showEditButton) ...[
                        SizedBox(width: 8),
                        _IconButtonSize(
                          onTap: () {
                            showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) => _EditCategoryDialog(
                                category: state.menu.category,
                                onSave: (category) {
                                  cubit.updateCategory(category: category);
                                },
                              ),
                            );
                          },
                          size: 18,
                          child: Icon(Icons.edit),
                        )
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (state.showEditButton)
            Center(
              heightFactor: areaMinHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.menu.imageSrc.isEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: Icon(Icons.add_photo_alternate),
                      label: Text('เพิ่มรูปภาพ'),
                    ),
                  if (state.menu.imageSrc.isNotEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: Icon(Icons.photo),
                      label: Text('เปลี่ยนรูปภาพ'),
                    ),
                  if (state.menu.imageSrc.isNotEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (_) => _ConfirmDeleteDialog(
                            onConfirm: () {
                              cubit.deleteImage();
                            },
                          ),
                        );
                      },
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
