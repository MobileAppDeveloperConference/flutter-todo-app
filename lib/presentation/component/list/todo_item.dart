import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/dialog/todo_delete_dialog_creator.dart';
import 'package:flutter_todo_app/presentation/component/common/toast/custom_toast.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_toggle.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_detail_task_screen.dart';

class TodoItem extends StatelessWidget with TodoDeleteDialogCreator {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  void _update(BuildContext context, Todo willUpdateTodo) {
    TodoModelInheritedNotifier.read(context).update(
      todo: willUpdateTodo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(todo.createdAt.hashCode),
      groupTag: 'todo_group',
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.3,
        dragDismissible: true,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showDeleteDialog(context: context, todo: todo);
            },
            autoClose: true,
            backgroundColor: ColorPalette.primary.color,
            foregroundColor: Colors.white,
            label: '삭제',
          ),
        ],
      ),
      child: InkWell(
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
                completed: todo.completed,
                onTap: (nextCompleted) {
                  _update(
                    context,
                    todo.copyWith(
                      completed: nextCompleted,
                    ),
                  );
                  if (nextCompleted.isCompleted) {
                    CustomToast.show(context: context, message: '투두 완료!');
                  }
                },
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: todo.isNotCompleted
                        ? Colors.black
                        : ColorPalette.rgb204.color,
                  ),
                ),
              ),
              if (todo.isNotCompleted) ...[
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    _update(
                      context,
                      todo.copyWith(
                        important: todo.nextImportant,
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
      ),
    );
  }
}
