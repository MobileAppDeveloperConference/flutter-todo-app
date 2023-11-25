import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/dialog/todo_delete_dialog_creator.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_toggle.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';

class TodoEditHeader extends StatefulWidget {
  final Todo initialTodo;
  const TodoEditHeader({
    super.key,
    required this.initialTodo,
  });

  @override
  State<TodoEditHeader> createState() => _TodoEditHeaderState();
}

class _TodoEditHeaderState extends State<TodoEditHeader>
    with TodoDeleteDialogCreator {
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
            completed: editingTodo.completed,
            onTap: (nextCompleted) {
              setState(() {
                todo = editingTodo.copyWith(
                  completed: nextCompleted,
                );
                TodoModelInheritedNotifier.read(context).update(todo: todo!);
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
                style: TextStyle(
                  color: ColorPalette.secondary.color,
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
              showDeleteDialog(context: context, todo: editingTodo)
                  .then((deleted) {
                if (deleted) {
                  Navigator.of(context).pop();
                }
              });
            },
            child: Text(
              '안할래',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorPalette.rgb153.color,
              ),
            ),
          )
        ],
      ),
    );
  }
}
