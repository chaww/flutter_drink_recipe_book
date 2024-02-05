// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../menu_info.dart';

class _MenuInfoCardIngredients extends StatefulWidget {
  const _MenuInfoCardIngredients({required this.recipeList});

  final List<Recipe> recipeList;

  @override
  State<_MenuInfoCardIngredients> createState() => _MenuInfoCardIngredientsState();
}

class _MenuInfoCardIngredientsState extends State<_MenuInfoCardIngredients> {
  int _optionFocus = 0;

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
          selected: _optionFocus == index,
          onSelected: (bool selected) {
            setState(() {
              _optionFocus = selected ? index : 0;
            });
          },
        );
      },
    ).toList();
  }

  List<Widget> _buildIngredients(BuildContext context) {
    int ingredientsLength = 0;
    if (widget.recipeList.isNotEmpty) {
      ingredientsLength = widget.recipeList[_optionFocus].ingredients.length;
    }

    return List<Widget>.generate(
      ingredientsLength,
      (int index) {
        final ingredient = widget.recipeList[_optionFocus].ingredients[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Row(
            children: [
              Row(
                children: [
                  // Icon(Icons.water_drop_outlined),
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
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
