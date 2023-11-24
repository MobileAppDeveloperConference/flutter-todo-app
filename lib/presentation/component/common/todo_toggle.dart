import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class TodoToggle extends StatelessWidget {
  final Completed completed;
  final VoidCallback onTap;
  const TodoToggle({
    super.key,
    required this.completed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        completed.isCompleted
            ? 'assets/images/icon_checked_2x.png'
            : 'assets/images/icon_not_checked_2x.png',
        scale: 2,
        excludeFromSemantics: true,
      ),
    );
  }
}
