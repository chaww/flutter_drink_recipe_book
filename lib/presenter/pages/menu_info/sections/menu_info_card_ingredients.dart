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
                ..._buildListOptionName(context),
                if (cubit.state.showEditButton)
                  _IconButtonSize(
                    size: 36,
                    onTap: () {},
                    child: Icon(Icons.add),
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        ..._buildIngredients(context),
        if (cubit.state.showEditButton && widget.recipeList.isNotEmpty)
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(
              context.l10n.menuInfoAddIngredient,
              style: context.typographies.bodySmall,
            ),
          ),
      ],
    );
  }

  List<Widget> _buildListOptionName(BuildContext context) {
    late int optionFocus = 0;
    final cubit = context.read<MenuInfoCubit>();
    final state = cubit.state;
    switch (widget.type) {
      case MenuType.hot:
        optionFocus = state.hotOptionFocus;
        break;
      case MenuType.ice:
        optionFocus = state.iceOptionFocus;
        break;
      case MenuType.frappe:
        optionFocus = state.frappeOptionFocus;
        break;
      default:
    }
    return List<Widget>.generate(
      widget.recipeList.length,
      (int index) {
        final isShowButtonMore = state.showEditButton && index == optionFocus;
        final isSelect = index == optionFocus;
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
                  onTap: () {
                    cubit.setOptionFocus(
                      type: widget.type,
                      value: index,
                    );
                  },
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
            if (state.showEditButton && index == optionFocus)
              PopupMenuButton<int>(
                onSelected: (item) {
                  switch (item) {
                    case 0:
                      break;
                    case 1:
                      break;
                    default:
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
              )
          ],
        );
      },
    ).toList();
  }

  List<Widget> _buildIngredients(BuildContext context) {
    late int optionFocus = 0;
    final state = context.watch<MenuInfoCubit>().state;
    switch (widget.type) {
      case MenuType.hot:
        optionFocus = state.hotOptionFocus;
        break;
      case MenuType.ice:
        optionFocus = state.iceOptionFocus;
        break;
      case MenuType.frappe:
        optionFocus = state.frappeOptionFocus;
        break;
      default:
    }

    int ingredientsLength = 0;
    if (widget.recipeList.isNotEmpty) {
      ingredientsLength = widget.recipeList[optionFocus].ingredients.length;
    }

    return List<Widget>.generate(
      ingredientsLength,
      (int index) {
        final ingredient = widget.recipeList[optionFocus].ingredients[index];
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
                    switch (value) {
                      case 0:
                        showDialog<String>(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => _EditIngredientDialog(
                            ingredient: ingredient,
                            onSave: (data) {},
                          ),
                        );
                        break;
                      case 1:
                        break;
                      default:
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
