import 'package:flutter/material.dart';

class TodoToggle extends StatelessWidget {
  final bool isCompleted;
  final VoidCallback onTap;
  const TodoToggle({
    super.key,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        isCompleted
            ? 'assets/images/icon_checked_2x.png'
            : 'assets/images/icon_not_checked_2x.png',
        scale: 2,
      ),
    );
  }
}
