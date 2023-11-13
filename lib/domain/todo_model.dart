import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/todo.dart';

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = List.empty();

  bool get isEmpty => _todos.isEmpty;
  bool get isNotEmpty => !isEmpty;

  bool get isExistCompleted => _todos.any((element) => element.isCompleted);
  bool get isNotExistCompleted => isExistCompleted;

  int _getTodoIndex({required DateTime createdAt}) {
    return _todos.indexWhere(
      (e) => e.createdAt.isAtSameMomentAs(createdAt),
    );
  }

  void create({
    required String title,
    required bool isFavorite,
    String? description,
  }) {
    _todos = [
      ..._todos,
      Todo(
        isCompleted: false,
        isFavorite: isFavorite,
        title: title,
        description: description ?? '',
        createdAt: DateTime.now(),
      )
    ];
    notifyListeners();
  }

  Iterable<Todo> get({required TodoFilters filter}) => switch (filter) {
        TodoFilters.notCompleted => _todos.where((e) => e.isNotCompleted),
        TodoFilters.completed => _todos.where((e) => e.isCompleted),
      };

  void delete({
    required Todo todo,
  }) {
    _todos = _todos
        .where((e) => !e.createdAt.isAtSameMomentAs(todo.createdAt))
        .toList();
    notifyListeners();
  }

  void setTitle({
    required Todo todo,
    required String title,
  }) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      _todos[targetTodoIndex] = _todos[targetTodoIndex].copyWith(title: title);
    }
    notifyListeners();
  }

  void setDescription({
    required Todo todo,
    required String description,
  }) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      _todos[targetTodoIndex] =
          _todos[targetTodoIndex].copyWith(description: description);
    }
    notifyListeners();
  }

  void setFavorite({required Todo todo, required bool isFavorite}) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      _todos[targetTodoIndex] =
          _todos[targetTodoIndex].copyWith(isFavorite: isFavorite);
    }
    notifyListeners();
  }

  void setComplete({required Todo todo, required bool isCompleted}) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      _todos[targetTodoIndex] =
          _todos[targetTodoIndex].copyWith(isCompleted: isCompleted);
    }
    notifyListeners();
  }
}
