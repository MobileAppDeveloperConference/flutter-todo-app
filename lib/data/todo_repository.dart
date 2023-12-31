import 'dart:convert';

import 'package:flutter_todo_app/data/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TodoRepository {
  List<Todo> load();
  void save({required List<Todo> todoList});
}

class TodoRepositoryImpl implements TodoRepository {
  static const String key = 'todoListKey';
  final SharedPreferences sharedPreferences;

  TodoRepositoryImpl({
    required this.sharedPreferences,
  });

  @override
  List<Todo> load() {
    final todoStringList = sharedPreferences.getStringList(key);
    if (todoStringList != null) {
      return todoStringList
          .map((todoString) => Todo.fromJson(jsonDecode(todoString)))
          .toList();
    } else {
      return List.empty(growable: true);
    }
  }

  @override
  void save({required List<Todo> todoList}) {
    sharedPreferences.setStringList(
      key,
      todoList.map((todo) => jsonEncode(todo.toJson())).toList(),
    );
  }
}
