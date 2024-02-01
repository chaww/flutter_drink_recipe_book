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
                    // backgroundColor: Colors.transparent,
                    // selectedColor: Colors.transparent,
                    label: Text(
                      'Option Name ${index + 1}',
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'ML',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
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
