import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/app_config_model.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/presentation/component/inherited/app_config_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_list_screen.dart';

class TodoApp extends StatelessWidget {
  final TodoModel todoModel;
  final AppConfigModel appConfigModel;
  const TodoApp({
    super.key,
    required this.todoModel,
    required this.appConfigModel,
  });
  @override
  Widget build(BuildContext context) {
    return AppConfigModelInheritedNotifier(
      notifier: appConfigModel,
      child: TodoModelInheritedNotifier(
        notifier: todoModel,
        child: MaterialApp(
          title: 'Todo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Pretendard',
            useMaterial3: true,
          ),
          home: const TodoListScreen(),
        ),
      ),
    );
  }
}
