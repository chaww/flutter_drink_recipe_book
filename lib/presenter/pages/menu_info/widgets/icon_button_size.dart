part of '../menu_info.dart';

class _IconButtonSize extends StatelessWidget {
  const _IconButtonSize({
    required this.onTap,
    required this.size,
    required this.child,
  });

  final void Function()? onTap;
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: child,
        ),
      ),
    );
  }
}
