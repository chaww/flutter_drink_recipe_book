part of '../menu_info.dart';

class _EditCategoryDialog extends StatefulWidget {
  const _EditCategoryDialog({
    // ignore: unused_element
    required this.category,
    required this.onSave,
  });

  final String category;
  final void Function(String category) onSave;

  @override
  State<_EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<_EditCategoryDialog> {
  late String category;
  final categoriesValue = [
    'tea',
    'coffee',
    'smoothies',
    'soda',
    'others',
  ];
  @override
  void initState() {
    category = widget.category;
    if (!categoriesValue.contains(category)) {
      category = categoriesValue.last;
    }
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
              'ตัวเลือกวัตถุดิบ',
              style: context.typographies.heading,
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) => DropdownMenu(
                width: constraints.maxWidth,
                initialSelection: category,
                label: Text(
                  'ประเภท',
                  style: context.typographies.heading,
                ),
                textStyle: context.typographies.body,
                onSelected: (v) {
                  setState(() {
                    category = v ?? categoriesValue.last;
                  });
                },
                dropdownMenuEntries: categoriesValue
                    .map(
                      (e) => DropdownMenuEntry(
                          value: e,
                          label: e,
                          labelWidget: Text(
                            e,
                            style: context.typographies.body,
                          )),
                    )
                    .toList(),
              ),
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
                      widget.onSave(category);
                      Navigator.pop(context);
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
