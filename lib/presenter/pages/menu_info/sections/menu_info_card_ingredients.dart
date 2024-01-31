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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                5,
                (int index) {
                  return ChoiceChip(
                    label: Text('คั่วอ่อน $index'),
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
        ...List<Widget>.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined),
                    Text('asdasd'),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text('15'),
                    SizedBox(width: 4),
                    Text('ML'),
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
