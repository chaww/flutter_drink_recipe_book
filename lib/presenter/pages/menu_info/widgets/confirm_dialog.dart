part of '../menu_info.dart';

class _ConfirmDeleteDialog extends StatelessWidget {
  const _ConfirmDeleteDialog({
    required this.onConfirm,
  });

  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ยืนยันการลบ'),
      content: Text('กรุณากดยืนยันเพื่อทำการลบ'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'ยกเลิก',
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
            'ยืนยัน',
            style: context.typographies.headingSmall,
          ),
        ),
      ],
    );
  }
}
