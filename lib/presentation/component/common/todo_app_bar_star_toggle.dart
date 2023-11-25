import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class TodoAppBarStarToggle extends StatelessWidget {
  final Important important;
  final Function(Important nextImportant) onTap;
  const TodoAppBarStarToggle({
    super.key,
    required this.important,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(important.next),
      child: Image.asset(
        important.isImportant
            ? 'assets/images/icon_star_on_2x.png'
            : 'assets/images/icon_star_off_2x.png',
        scale: 2,
      ),
    );
  }
}
