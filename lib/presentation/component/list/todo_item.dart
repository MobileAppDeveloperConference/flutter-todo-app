import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_toggle.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_detail_task_screen.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
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
              completeState: todo.completeState,
              onTap: () {
                TodoModelInheritedNotifier.read(context).update(
                  todo: todo.copyWith(
                    completeState: todo.completeState.nextState,
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: todo.completeState.isCompleted
                      ? ColorPalette.rgb204.color
                      : Colors.black,
                ),
              ),
            ),
            if (todo.isNotCompleted) ...[
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  TodoModelInheritedNotifier.read(context).update(
                    todo: todo.copyWith(
                      importantState: todo.importantState.nextState,
                    ),
                  );
                },
                child: Image.asset(
                  todo.isImportant
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
