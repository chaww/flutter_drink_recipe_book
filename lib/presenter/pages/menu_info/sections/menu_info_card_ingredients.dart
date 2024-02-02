// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

part of '../menu_info.dart';

class _MenuInfoCardIngredients extends StatefulWidget {
  const _MenuInfoCardIngredients();

  @override
  State<_MenuInfoCardIngredients> createState() =>
      _MenuInfoCardIngredientsState();
}

class _MenuInfoCardIngredientsState extends State<_MenuInfoCardIngredients> {
  int? _value = 1;

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
              children: List<Widget>.generate(
                5,
                (int index) {
                  return ChoiceChip(
                    backgroundColor: Colors.transparent,
                    selectedColor: context.colors.primary,
                    label: Text(
                      'Option Name ${index + 1}',
                      style: context.appTheme.typographies.body,
                    ),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ),
        ),
        SizedBox(height: 16),
        ...List<Widget>.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Row(
              children: [
                Row(
                  children: [
                    // Icon(Icons.water_drop_outlined),
                    Text(
                      'Syrup',
                      style: context.appTheme.typographies.body,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '15',
                      style: context.appTheme.typographies.body,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'ML',
                      style: context.appTheme.typographies.body,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
