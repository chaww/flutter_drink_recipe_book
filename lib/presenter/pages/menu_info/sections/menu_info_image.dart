part of '../menu_info.dart';

class _MenuInfoImage extends StatelessWidget {
  const _MenuInfoImage();

  Widget _buildCategory(BuildContext context) {
    final cubit = context.watch<MenuInfoCubit>();
    final state = cubit.state;

    final categoriesMap = {
      'tea': context.l10n.drinkCategoryTea,
      'coffee': context.l10n.drinkCategoryCoffee,
      'smoothies': context.l10n.drinkCategorySmoothies,
      'soda': context.l10n.drinkCategorySoda,
      'others': context.l10n.drinkCategoryOthers,
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(color: context.colors.primary),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoriesMap[state.menu.category]!.toString(),
                  style: context.typographies.body,
                ),
                if (state.showEditButton) ...[
                  const SizedBox(width: 8),
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
                    child: const Icon(Icons.edit),
                  )
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

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
          state.menu.imageSrc == ''
              ? Padding(
                  padding: const EdgeInsets.all(64),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: context.appTheme.name == 'light'
                            ? Assets.hidden.logoLight.provider()
                            : Assets.hidden.logoDark.provider(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : Container(
                  decoration: state.menu.imageSrc != ''
                      ? kIsWeb
                          ? BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.menu.imageSrc),
                                fit: BoxFit.contain,
                              ),
                            )
                          : BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(state.menu.imageSrc)),
                                fit: BoxFit.contain,
                              ),
                            )
                      : null,
                ),
          _buildCategory(context),
          if (state.showEditButton)
            Center(
              heightFactor: areaMinHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.menu.imageSrc.isEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {
                        cubit.updateImage();
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                      label: Text(context.l10n.addImage),
                    ),
                  if (state.menu.imageSrc.isNotEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {
                        cubit.updateImage();
                      },
                      icon: const Icon(Icons.photo),
                      label: Text(context.l10n.changeImage),
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
                      icon: const Icon(Icons.delete_forever),
                      label: Text(context.l10n.deleteImage),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
