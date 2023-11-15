import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/inherited/app_config_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
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
    final appConfig = AppConfigModelInheritedNotifier.watch(context);
    final bool isNotExistTodo = todoModel.isEmpty;
    final bool isShowFinishedTodo =
        appConfig.isHiddenFinish == false && todoModel.isExistCompleted;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: const Color.fromRGBO(248, 251, 255, 1),
        child: CustomScrollView(
          slivers: [
            const TodoListSliverTitle(
              title: '하는 중',
            ),
            if (isNotExistTodo) const TodoListSliverEmpty(),
            if (!isNotExistTodo)
              TodoListSliverList(
                completeState: CompleteState.not,
                importantState: appConfig.importantFilter,
              ),
            if (isShowFinishedTodo)
              const TodoListSliverTitle(
                title: '완료',
              ),
            if (isShowFinishedTodo)
              TodoListSliverList(
                completeState: CompleteState.completed,
                importantState: appConfig.importantFilter,
              ),
          ],
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
