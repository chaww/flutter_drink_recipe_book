// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../menu_info.dart';

class _MenuInfoCardIngredients extends StatefulWidget {
  const _MenuInfoCardIngredients({
    required this.type,
    required this.recipeList,
  });

  final MenuType type;
  final List<Recipe> recipeList;

  @override
  State<_MenuInfoCardIngredients> createState() => _MenuInfoCardIngredientsState();
}

class _MenuInfoCardIngredientsState extends State<_MenuInfoCardIngredients> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuInfoCubit>();
    final state = cubit.state;
    late int isSelected;
    switch (widget.type) {
      case MenuType.hot:
        isSelected = state.hotOptionFocus;
        break;
      case MenuType.ice:
        isSelected = state.iceOptionFocus;
        break;
      case MenuType.frappe:
        isSelected = state.frappeOptionFocus;
        break;
      default:
    }
    return Column(
      children: [
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              spacing: 5.0,
              // crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ..._buildListOptionName(
                  context,
                  isSelected: isSelected,
                  onSelect: (index) {
                    cubit.setOptionFocus(
                      type: widget.type,
                      value: index,
                    );
                  },
                  onActionEdit: (index) {
                    final optionName = widget.recipeList[isSelected].optionName;
                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => _EditOptionNameDialog(
                        optionName: optionName,
                        onSave: (data) {
                          cubit.updateOptionName(
                            type: widget.type,
                            recipeIndex: isSelected,
                            optionName: data,
                          );
                        },
                      ),
                    );
                  },
                  onActionDelete: (index) {
                    showDialog<String>(
                      context: context,
                      builder: (_) => _ConfirmDeleteDialog(
                        onConfirm: () {
                          cubit.deleteRecipe(type: widget.type, recipeIndex: index);
                        },
                      ),
                    );
                  },
                ),
                if (cubit.state.showEditButton)
                  _IconButtonSize(
                    size: 36,
                    onTap: () {
                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => _EditOptionNameDialog(
                          optionName: '',
                          onSave: (data) {
                            cubit.updateOptionName(
                              type: widget.type,
                              recipeIndex: -1,
                              optionName: data,
                            );
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        ..._buildIngredients(
          context,
          isSelected: isSelected,
          onActionEdit: (index) {
            final ingredient = widget.recipeList[isSelected].ingredients[index];
            showDialog<String>(
              barrierDismissible: false,
              context: context,
              builder: (_) => _EditIngredientDialog(
                ingredient: ingredient,
                onSave: (data) {
                  cubit.updateIngredient(
                    type: widget.type,
                    recipeIndex: isSelected,
                    ingredientIndex: index,
                    ingredient: data,
                  );
                },
              ),
            );
          },
          onActionDelete: (index) {
            showDialog<String>(
              context: context,
              builder: (_) => _ConfirmDeleteDialog(
                onConfirm: () {
                  cubit.deleteIngredient(
                    type: widget.type,
                    recipeIndex: isSelected,
                    ingredientIndex: index,
                  );
                },
              ),
            );
          },
        ),
        if (cubit.state.showEditButton && widget.recipeList.isNotEmpty)
          FilledButton.tonalIcon(
            onPressed: () {
              showDialog<String>(
                barrierDismissible: false,
                context: context,
                builder: (_) => _EditIngredientDialog(
                  ingredient: const Ingredient(name: '', value: '', unit: ''),
                  onSave: (data) {
                    cubit.updateIngredient(
                      type: widget.type,
                      recipeIndex: isSelected,
                      ingredientIndex: -1,
                      ingredient: data,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: Text(
              context.l10n.menuInfoAddIngredient,
              style: context.typographies.bodySmall,
            ),
          ),
      ],
    );
  }

  List<Widget> _buildListOptionName(
    BuildContext context, {
    required int isSelected,
    required void Function(int index) onSelect,
    required void Function(int index) onActionEdit,
    required void Function(int index) onActionDelete,
  }) {
    final state = context.read<MenuInfoCubit>().state;
    return List<Widget>.generate(
      widget.recipeList.length,
      (int index) {
        final isShowButtonMore = state.showEditButton && index == isSelected;
        final isSelect = index == isSelected;
        const itemHeight = 36.0;
        return Row(
          children: [
            Container(
              height: itemHeight,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: isSelect ? context.colors.primary : null,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(itemHeight),
                  bottomLeft: Radius.circular(itemHeight),
                  topRight: Radius.circular(isShowButtonMore ? 0 : itemHeight),
                  bottomRight: Radius.circular(isShowButtonMore ? 0 : itemHeight),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onSelect(index),
                  child: Row(
                    children: [
                      SizedBox(width: itemHeight / 2),
                      Text(
                        widget.recipeList[index].optionName,
                        style: context.appTheme.typographies.body,
                      ),
                      if (!isShowButtonMore) SizedBox(width: itemHeight / 2),
                    ],
                  ),
                ),
              ),
            ),
            if (state.showEditButton && index == isSelected)
              PopupMenuButton<int>(
                onSelected: (value) {
                  if (value == 0) {
                    onActionEdit(index);
                  } else if (value == 1) {
                    onActionDelete(index);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text('Edit')),
                  PopupMenuItem<int>(value: 1, child: Text('Delete')),
                ],
                child: Container(
                  padding: EdgeInsets.all((itemHeight - 24) / 2),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(state.showEditButton ? 0 : itemHeight),
                      bottomLeft: Radius.circular(state.showEditButton ? 0 : itemHeight),
                      topRight: Radius.circular(itemHeight),
                      bottomRight: Radius.circular(itemHeight),
                    ),
                  ),
                  child: Icon(Icons.more_vert),
                ),
              ),
          ],
        );
      },
    ).toList();
  }

  List<Widget> _buildIngredients(
    BuildContext context, {
    required int isSelected,
    required void Function(int index) onActionEdit,
    required void Function(int index) onActionDelete,
  }) {
    final state = context.watch<MenuInfoCubit>().state;
    int ingredientsLength = 0;
    if (widget.recipeList.isNotEmpty) {
      ingredientsLength = widget.recipeList[isSelected].ingredients.length;
    }

    return List<Widget>.generate(
      ingredientsLength,
      (int index) {
        final ingredient = widget.recipeList[isSelected].ingredients[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            children: [
              SizedBox(width: 32),
              Row(
                children: [
                  Text(
                    ingredient.name,
                    style: context.appTheme.typographies.body,
                  ),
                ],
              ),
              Spacer(),
              Text(
                ingredient.value,
                style: context.appTheme.typographies.body,
              ),
              SizedBox(width: 16, height: 48),
              Text(
                ingredient.unit,
                style: context.appTheme.typographies.body,
              ),
              if (state.showEditButton)
                PopupMenuButton<int>(
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    if (value == 0) {
                      onActionEdit(index);
                    } else if (value == 1) {
                      onActionDelete(index);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(value: 0, child: Text('Edit')),
                    PopupMenuItem<int>(value: 1, child: Text('Delete')),
                  ],
                ),
              SizedBox(width: state.showEditButton ? 12 : 32)
            ],
          ),
        );
      },
    );
  }
}
