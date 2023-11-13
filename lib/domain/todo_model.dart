import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';

class TodoModel extends ChangeNotifier {
  final TodoRepository todoRepository;
  List<Todo> todoList;

  TodoModel._({required this.todoList, required this.todoRepository});

  factory TodoModel.load({required TodoRepository todoRepository}) {
    return TodoModel._(
      todoList: List.empty(),
      todoRepository: todoRepository,
    );
  }

  bool get isEmpty => todoList.isEmpty;
  bool get isNotEmpty => !isEmpty;

  bool get isExistCompleted => todoList.any((element) => element.isCompleted);
  bool get isNotExistCompleted => isExistCompleted;

  int _getTodoIndex({required DateTime createdAt}) {
    return todoList.indexWhere(
      (e) => e.createdAt.isAtSameMomentAs(createdAt),
    );
  }

  void create({
    required String title,
    required bool isFavorite,
    String? description,
  }) {
    todoList = [
      ...todoList,
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
        TodoFilters.notCompleted => todoList.where((e) => e.isNotCompleted),
        TodoFilters.completed => todoList.where((e) => e.isCompleted),
      };

  void delete({
    required Todo todo,
  }) {
    todoList = todoList
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
      todoList[targetTodoIndex] =
          todoList[targetTodoIndex].copyWith(title: title);
    }
    notifyListeners();
  }

  void setDescription({
    required Todo todo,
    required String description,
  }) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      todoList[targetTodoIndex] =
          todoList[targetTodoIndex].copyWith(description: description);
    }
    notifyListeners();
  }

  void setFavorite({required Todo todo, required bool isFavorite}) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      todoList[targetTodoIndex] =
          todoList[targetTodoIndex].copyWith(isFavorite: isFavorite);
    }
    notifyListeners();
  }

  void setComplete({required Todo todo, required bool isCompleted}) {
    final targetTodoIndex = _getTodoIndex(createdAt: todo.createdAt);
    if (targetTodoIndex != -1) {
      todoList[targetTodoIndex] =
          todoList[targetTodoIndex].copyWith(isCompleted: isCompleted);
    }
    notifyListeners();
  }
}
