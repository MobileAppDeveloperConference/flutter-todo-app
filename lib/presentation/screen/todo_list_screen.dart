import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_empty.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_app_bar.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_bottom_navigation_bar.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_add_floating_action_button.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_list.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_title.dart';
import 'package:flutter_todo_app/presentation/screen/todo_add_task_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoModel = TodoModelInheritedNotifier.watch(context);
    final important = todoModel.important;
    final bool isNotExistTodo = todoModel.isEmpty;
    final bool isShowFinishedTodo =
        todoModel.isHiddenFinish == false && todoModel.isExistCompleted;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: ColorPalette.backgroundList.color,
        child: SlidableAutoCloseBehavior(
          child: CustomScrollView(
            slivers: [
              const TodoListSliverTitle(title: '하는 중'),
              if (isNotExistTodo) const TodoListSliverEmpty(),
              if (!isNotExistTodo)
                TodoListSliverList(
                  completed: Completed.not,
                  important: important,
                ),
              if (isShowFinishedTodo) ...[
                const TodoListSliverTitle(
                  title: '완료',
                ),
                TodoListSliverList(
                  completed: Completed.completed,
                  important: important,
                ),
              ],
            ],
          ),
        ),
      ),
      appBar: const TodoListAppBar(),
      floatingActionButton: TodoAddFloatingActionButton(
        onAdd: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TodoAddTaskScreen(),
            ),
          );
        },
      ),
      bottomNavigationBar: const TodoListBottomNavigationBar(),
    );
  }
}
