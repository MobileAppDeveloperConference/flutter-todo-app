import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final Function(BuildContext context) onTap;
  const CustomDialogButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 77,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
