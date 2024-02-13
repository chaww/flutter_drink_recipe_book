part of '../menu_info.dart';

class _ConfirmDeleteDialog extends StatelessWidget {
  const _ConfirmDeleteDialog({
    required this.onConfirm,
  });

  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.dialogConfirmDeleteTitle),
      content: Text(context.l10n.dialogConfirmDeleteContent),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            context.l10n.cancel,
            style: context.typographies.headingSmall.copyWith(
              color: context.colors.text,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          child: Text(
            context.l10n.confirm,
            style: context.typographies.headingSmall,
          ),
        ),
      ],
    );
  }
}
