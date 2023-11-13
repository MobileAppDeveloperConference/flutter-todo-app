import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_toggle.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_list_inherited_notifier.dart';

class TodoEditHeader extends StatefulWidget {
  final Todo initialTodo;
  const TodoEditHeader({
    super.key,
    required this.initialTodo,
  });

  @override
  State<TodoEditHeader> createState() => _TodoEditHeaderState();
}

class _TodoEditHeaderState extends State<TodoEditHeader> {
  Todo? todo;
  @override
  Widget build(BuildContext context) {
    todo ??= widget.initialTodo;
    final editingTodo = todo!;
    return SizedBox(
      height: 62,
      child: Row(
        children: [
          TodoToggle(
            isCompleted: editingTodo.isCompleted,
            onTap: () {
              setState(() {
                todo =
                    editingTodo.copyWith(isCompleted: !editingTodo.isCompleted);
                TodoListInheritedNotifier.of(context).setComplete(
                  todo: editingTodo,
                  isCompleted: !editingTodo.isCompleted,
                );
              });
            },
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Center(
              child: Text(
                '${editingTodo.createdAt.toMonthString} ${editingTodo.createdAt.toDayString} ${editingTodo.createdAt.toWeekdayString}',
                style: const TextStyle(
                  color: Color.fromRGBO(81, 130, 255, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              TodoListInheritedNotifier.of(context).delete(
                todo: widget.initialTodo,
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              '안할래',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
