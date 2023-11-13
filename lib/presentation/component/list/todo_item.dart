import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_toggle.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_list_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_detail_task_screen.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final todoChangeNotifier = TodoListInheritedNotifier.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoDetailTaskScreen(initialTodo: todo),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        height: 64,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 16),
            TodoToggle(
              isCompleted: todo.isCompleted,
              onTap: () {
                todoChangeNotifier.setComplete(
                  todo: todo,
                  isCompleted: !todo.isCompleted,
                );
              },
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(todo.title)),
            if (todo.isNotCompleted) ...[
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  todoChangeNotifier.setFavorite(
                    todo: todo,
                    isFavorite: !todo.isFavorite,
                  );
                },
                child: Image.asset(
                  todo.isFavorite
                      ? 'assets/images/icon_todo_star_on_2x.png'
                      : 'assets/images/icon_todo_star_off_2x.png',
                  scale: 2,
                ),
              ),
            ],
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
