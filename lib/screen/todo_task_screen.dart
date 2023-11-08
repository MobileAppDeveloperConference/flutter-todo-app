import 'package:flutter/material.dart';
import 'package:flutter_todo_app/component/todo_task_app_bar.dart';

class TodoTaskScreen extends StatelessWidget {
  const TodoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoTaskAppBar(
        isReadOnly: true,
      ),
      body: Container(),
    );
  }
}
