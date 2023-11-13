import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_list_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_empty.dart';
import 'package:flutter_todo_app/presentation/component/list/todos_app_bar.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_bottom_navigation_bar.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_add_floating_action_button.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_list.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_title.dart';
import 'package:flutter_todo_app/presentation/screen/todo_add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});
  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoTab _selectedTodoTab = TodoTab.all;
  bool _isHideFinished = false;
  @override
  Widget build(BuildContext context) {
    final todoModel = TodoModelInheritedNotifier.watch(context);
    final bool isNotExistTodo = todoModel.isEmpty;
    final bool isShowFinishedTodo =
        _isHideFinished == false && todoModel.isExistCompleted;

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
                filter: TodoFilters.notCompleted,
                isShowOnlyFavorite: _selectedTodoTab.isImportants,
              ),
            if (isShowFinishedTodo)
              const TodoListSliverTitle(
                title: '완료',
              ),
            if (isShowFinishedTodo)
              TodoListSliverList(
                filter: TodoFilters.completed,
                isShowOnlyFavorite: _selectedTodoTab.isImportants,
              ),
          ],
        ),
      ),
      appBar: TodoListAppBar(
        selectedTodoTab: _selectedTodoTab,
        isHideFinished: _isHideFinished,
        onToggleHideFinished: () {
          setState(() {
            _isHideFinished = !_isHideFinished;
          });
        },
      ),
      floatingActionButton: TodoAddFloatingActionButton(
        onAdd: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TodoAddTaskScreen(),
            ),
          );
        },
      ),
      bottomNavigationBar: TodoListBottomNavigationBar(
        selectedTodoTab: _selectedTodoTab,
        onTap: (tappedTab) {
          setState(() {
            _selectedTodoTab = tappedTab;
          });
        },
      ),
    );
  }
}
