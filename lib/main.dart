import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/app_config_repository.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';
import 'package:flutter_todo_app/domain/app_config_model.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/presentation/component/inherited/app_config_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    TodoApp(
      todoModel: TodoModel(
        repository: TodoRepositoryImpl(
          sharedPreferences: sharedPreferences,
        ),
      ),
      appConfigModel: AppConfigModel(
        repository: AppConfigRepositoryImpl(
          sharedPreferences: sharedPreferences,
        ),
      ),
    ),
  );
}

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
