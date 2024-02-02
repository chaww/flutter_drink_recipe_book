import 'package:flutter/material.dart';

class LocaleSwitcherButton extends StatelessWidget {
  final String locale;
  final VoidCallback onPressed;

  const LocaleSwitcherButton({
    super.key,
    required this.locale,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(locale == 'en' ? 'EN' : 'ไทย'),
    );
  }
}
