part of '../menu_info.dart';

class _EditCategoryDialog extends StatefulWidget {
  const _EditCategoryDialog({
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
    final categoriesMap = {
      'tea': context.l10n.drinkCategoryTea,
      'coffee': context.l10n.drinkCategoryCoffee,
      'smoothies': context.l10n.drinkCategorySmoothies,
      'soda': context.l10n.drinkCategorySoda,
      'others': context.l10n.drinkCategoryOthers,
    };

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.l10n.drinkCategories,
              style: context.typographies.heading,
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) => DropdownMenu(
                width: constraints.maxWidth,
                initialSelection: category,
                label: Text(
                  context.l10n.drinkCategories,
                  style: context.typographies.heading,
                ),
                textStyle: context.typographies.body,
                onSelected: (v) {
                  setState(() {
                    category = v ?? categoriesValue.last;
                  });
                },
                dropdownMenuEntries: categoriesMap.entries
                    .map(
                      (e) => DropdownMenuEntry(
                        value: e.key,
                        label: e.value,
                        labelWidget: Text(
                          e.value,
                          style: context.typographies.body,
                        ),
                      ),
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
                      context.l10n.cancel,
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
                      context.l10n.save,
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
