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
    return Column(
      children: [
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              spacing: 5.0,
              children: _buildListOptionChoiceChip(context),
            ),
          ),
        ),
        SizedBox(height: 16),
        ..._buildIngredients(context),
      ],
    );
  }

  List<Widget> _buildListOptionChoiceChip(BuildContext context) {
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
        return ChoiceChip(
          backgroundColor: Colors.transparent,
          selectedColor: context.colors.primary,
          label: Text(
            widget.recipeList[index].optionName,
            style: context.appTheme.typographies.body,
          ),
          selected: optionFocus == index,
          onSelected: (bool selected) {
            cubit.setOptionFocus(
              type: widget.type,
              value: selected ? index : 0,
            );
          },
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
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Row(
            children: [
              Row(
                children: [
                  Text(
                    ingredient.name,
                    style: context.appTheme.typographies.body,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    ingredient.value,
                    style: context.appTheme.typographies.body,
                  ),
                  SizedBox(width: 16),
                  Text(
                    ingredient.unit,
                    style: context.appTheme.typographies.body,
                  ),
                  if (false)
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, size: 22),
                    )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
