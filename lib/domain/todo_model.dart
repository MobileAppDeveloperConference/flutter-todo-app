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
  bool get isExistCompleted => todoList.any((e) => e.completeState.isCompleted);
  bool get isHiddenFinish => config.isHiddenFinish;
  ImportantState get importantState => config.importantState;

  //----------------------------------------------------------------------------
  // Todo
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
    _saveTodo();
  }

  // read method
  Iterable<Todo> get({
    required CompleteState completeState,
    required ImportantState importantState,
  }) =>
      todoList.where(
        (e) => e.isInCondition(
          completeState: completeState,
          importantState: importantState.isImportant ? importantState : null,
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
    _saveTodo();
  }

  // delete method
  void delete({required Todo todo}) {
    todoList = todoList
        .where((e) => !e.createdAt.isAtSameMomentAs(todo.createdAt))
        .toList();
    _saveTodo();
  }

  void _saveTodo() {
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
    _saveConfig();
  }

  void updateImportantFilter(ImportantState importantFilter) {
    config = config.copyWith(
      importantState: importantFilter,
    );
    _saveConfig();
  }

  void _saveConfig() {
    configRepository.save(config: config);
    notifyListeners();
  }
}
