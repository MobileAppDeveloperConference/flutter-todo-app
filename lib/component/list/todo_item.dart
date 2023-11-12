import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 64,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 16),
          Image.asset(
            todo.isCompleted
                ? 'assets/images/icon_checked_2x.png'
                : 'assets/images/icon_not_checked_2x.png',
            scale: 2,
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(todo.description)),
          if (todo.isNotCompleted) ...[
            const SizedBox(width: 16),
            Image.asset(
              todo.isFavorite
                  ? 'assets/images/icon_todo_star_on_2x.png'
                  : 'assets/images/icon_todo_star_off_2x.png',
              scale: 2,
            ),
          ],
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
