import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/component/todo_add_floating_action_button.dart';
import 'package:flutter_todo_app/component/todo_home_app_bar.dart';
import 'package:flutter_todo_app/component/todo_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoTab _selectedTodoTab = TodoTab.all;
  bool _isHideFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      appBar: TodoHomeAppBar(
        selectedTodoTab: _selectedTodoTab,
        isHideFinished: _isHideFinished,
        onToggleHideFinished: () {
          setState(() {
            _isHideFinished = !_isHideFinished;
          });
        },
      ),
      floatingActionButton: TodoAddFloatingActionButton(
        onAdd: () {},
      ),
      bottomNavigationBar: TodoBottomNavigationBar(
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
