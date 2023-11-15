import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';

class TodoAddFloatingActionButton extends StatelessWidget {
  final Function() onAdd;
  const TodoAddFloatingActionButton({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: FittedBox(
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: onAdd,
          elevation: 0,
          backgroundColor: ColorPalette.primary.color,
          child: Image.asset(
            'assets/images/icon_add_2x.png',
            scale: 2,
          ),
        ),
      ),
    );
  }
}
