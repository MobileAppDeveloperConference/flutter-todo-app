import 'package:flutter_todo_app/data/todo.dart';

abstract class TodoRepository {
  List<Todo> load();
  void save({required List<Todo> todoList});
}
