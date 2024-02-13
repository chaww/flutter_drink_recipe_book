part of '../menu_info.dart';

class _EditNameDialog extends StatefulWidget {
  const _EditNameDialog({
    required this.nameTh,
    required this.nameEn,
    required this.onSave,
  });

  final String nameTh;
  final String nameEn;
  final void Function(String nameTh, String nameEn) onSave;

  @override
  State<_EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<_EditNameDialog> {
  late String nameTh;
  late String nameEn;

  @override
  void initState() {
    nameTh = widget.nameTh;
    nameEn = widget.nameEn;
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
              context.l10n.menuName,
              style: context.typographies.heading,
            ),
            const SizedBox(height: 32),
            TextFormField(
              initialValue: nameTh,
              onChanged: (v) {
                setState(() {
                  nameTh = v;
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(context.l10n.menuNameTh),
                floatingLabelStyle: context.typographies.heading,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              initialValue: nameEn,
              onChanged: (v) {
                setState(() {
                  nameEn = v;
                });
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(context.l10n.menuNameEn),
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
                      widget.onSave(nameTh, nameEn);
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
