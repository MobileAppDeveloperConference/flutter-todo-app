import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';

class TodoModel extends ChangeNotifier {
  final TodoRepository repository;
  List<Todo> todoList;

  TodoModel({required this.repository}) : todoList = repository.load();

  bool get isEmpty => todoList.isEmpty;
  bool get isNotEmpty => !isEmpty;

  bool get isExistCompleted => todoList.any((e) => e.completeState.isCompleted);
  bool get isNotExistCompleted => isExistCompleted;

  //----------------------------------------------------------------------------
  // create method
  void create({
    required String title,
    required ImportantState importantState,
    String? description,
  }) {
    todoList = [
      ...todoList,
      Todo(
        completeState: CompleteState.not,
        importantState: importantState,
        title: title,
        description: description ?? '',
        createdAt: DateTime.now(),
      )
    ];
    _saveAndNotify();
  }

  //----------------------------------------------------------------------------
  // read method
  Iterable<Todo> get({
    required CompleteState completeState,
    required ImportantState importantState,
  }) =>
      todoList.where(
        (e) => e.isEqualStates(
          completeState: completeState,
          importantState: importantState,
        ),
      );

  //----------------------------------------------------------------------------
  // update method
  void update({required Todo todo}) {
    final targetIndex = todoList.indexWhere(
      (e) => e.createdAt.isAtSameMomentAs(todo.createdAt),
    );
    if (targetIndex != -1) {
      todoList[targetIndex] = todo;
    }
    _saveAndNotify();
  }

  //----------------------------------------------------------------------------
  // delete method
  void delete({
    required Todo todo,
  }) {
    todoList = todoList
        .where((e) => !e.createdAt.isAtSameMomentAs(todo.createdAt))
        .toList();
    _saveAndNotify();
  }

  //----------------------------------------------------------------------------
  // private method
  void _saveAndNotify() {
    repository.save(todoList: todoList);
    notifyListeners();
  }
}
