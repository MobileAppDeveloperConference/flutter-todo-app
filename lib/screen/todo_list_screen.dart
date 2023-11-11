import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/component/todo_add_floating_action_button.dart';
import 'package:flutter_todo_app/component/todo_list_app_bar.dart';
import 'package:flutter_todo_app/component/todo_list_bottom_navigation_bar.dart';
import 'package:flutter_todo_app/screen/todo_add_task_screen.dart';

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
    return Scaffold(
      body: Container(),
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
