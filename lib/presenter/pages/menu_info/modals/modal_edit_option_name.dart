part of '../menu_info.dart';

class _EditOptionNameDialog extends StatefulWidget {
  const _EditOptionNameDialog({
    // ignore: unused_element
    required this.optionName,
    required this.onSave,
  });

  final String optionName;
  final void Function(String data) onSave;

  @override
  State<_EditOptionNameDialog> createState() => _EditOptionNameDialogState();
}

class _EditOptionNameDialogState extends State<_EditOptionNameDialog> {
  late String optionName;

  @override
  void initState() {
    optionName = widget.optionName;
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
              context.l10n.ingredientOption,
              style: context.typographies.heading,
            ),
            const SizedBox(height: 32),
            TextFormField(
              initialValue: optionName,
              onChanged: (v) {
                setState(() {
                  optionName = v;
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(context.l10n.ingredientOptionName),
                floatingLabelStyle: context.typographies.heading,
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
                      widget.onSave(optionName);
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
