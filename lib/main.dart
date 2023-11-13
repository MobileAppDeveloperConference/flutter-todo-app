import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/app_config_repository.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';
import 'package:flutter_todo_app/domain/app_config_model.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/todo_app.dart';
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
