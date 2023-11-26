import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/data/config.dart';
import 'package:flutter_todo_app/data/config_repository.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';

class TodoModel extends ChangeNotifier {
  final TodoRepository todoRepository;
  final ConfigRepository configRepository;

  List<Todo> todoList;
  Config config;

  TodoModel({
    required this.todoRepository,
    required this.configRepository,
  })  : todoList = todoRepository.load(),
        config = configRepository.load();

  bool get isEmpty => todoList.isEmpty;
  bool get isExistCompleted => todoList.any((e) => e.completed.isCompleted);
  bool get isHiddenFinish => config.isHiddenFinish;
  Important get important => config.important;

  //----------------------------------------------------------------------------
  // Todo
  // create method
  void create({
    required String title,
    required Important important,
    String? description,
  }) {
    todoList.add(
      Todo(
        completed: Completed.not,
        important: important,
        title: title,
        description: description ?? '',
        createdAt: DateTime.now(),
      ),
    );
    _saveAndNotifyTodo();
  }

  // read method
  Iterable<Todo> get({
    required Completed completed,
    required Important important,
  }) =>
      todoList.where(
        (e) => e.isInCondition(
          completed: completed,
          important: important.isImportant ? important : null,
        ),
      );

  // update method
  void update({required Todo todo}) {
    final targetIndex = todoList.indexWhere(
      (e) => e.createdAt.isAtSameMomentAs(todo.createdAt),
    );
    if (targetIndex != -1) {
      todoList[targetIndex] = todo;
    }
    _saveAndNotifyTodo();
  }

  // delete method
  void delete({required Todo todo}) {
    todoList.removeWhere((e) => e.createdAt.isAtSameMomentAs(todo.createdAt));
    _saveAndNotifyTodo();
  }

  void _saveAndNotifyTodo() {
    todoRepository.save(todoList: todoList);
    notifyListeners();
  }

  //----------------------------------------------------------------------------
  // Config
  // update method
  void updateHiddenFinish(bool isHiddenFinish) {
    config = config.copyWith(
      isHiddenFinish: isHiddenFinish,
    );
    _saveAndNotifyConfig();
  }

  void updateImportant(Important important) {
    config = config.copyWith(
      important: important,
    );
    _saveAndNotifyConfig();
  }

  void _saveAndNotifyConfig() {
    configRepository.save(config: config);
    notifyListeners();
  }
}
