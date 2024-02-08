part of '../menu_info.dart';

class _EditIngredientDialog extends StatefulWidget {
  const _EditIngredientDialog({
    required this.ingredient,
    required this.onSave,
  });

  final Ingredient ingredient;
  final void Function(Ingredient data) onSave;

  @override
  State<_EditIngredientDialog> createState() => _EditIngredientDialogState();
}

class _EditIngredientDialogState extends State<_EditIngredientDialog> {
  late String name;
  late String value;
  late String unit;
  bool showNameValidate = false;

  @override
  void initState() {
    name = widget.ingredient.name;
    value = widget.ingredient.value;
    unit = widget.ingredient.unit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'วัตถุดิบ',
              style: context.typographies.heading,
            ),
            const SizedBox(height: 32),
            TextFormField(
              initialValue: name,
              onChanged: (v) {
                setState(() {
                  name = v;
                  showNameValidate = true;
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text('ชื่อวัตถุดิบ'),
                floatingLabelStyle: context.typographies.heading,
                errorText: showNameValidate && name.isEmpty ? 'ต้องมีชื่อวัตถุดิบ' : null,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: value,
                    onChanged: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('ปริมาณ'),
                      floatingLabelStyle: context.typographies.heading,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: unit,
                    onChanged: (v) {
                      setState(() {
                        unit = v;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('หน่วย'),
                      floatingLabelStyle: context.typographies.heading,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ยกเลิก',
                      style: context.typographies.headingSmall.copyWith(
                        color: context.colors.text,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showNameValidate = true;
                      });
                      if (name.isNotEmpty) {
                        final item = Ingredient(
                          name: name,
                          value: value,
                          unit: unit,
                        );
                        widget.onSave(item);
                        Navigator.pop(context);
                      } else {}
                    },
                    child: Text(
                      'บันทึก',
                      style: context.typographies.headingSmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
