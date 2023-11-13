import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';

class TodoModelInheritedNotifier extends InheritedNotifier<TodoModel> {
  const TodoModelInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static TodoModel watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TodoModelInheritedNotifier>()!
        .notifier!;
  }

  static TodoModel read(BuildContext context) {
    return context
        .findAncestorWidgetOfExactType<TodoModelInheritedNotifier>()!
        .notifier!;
  }
}
