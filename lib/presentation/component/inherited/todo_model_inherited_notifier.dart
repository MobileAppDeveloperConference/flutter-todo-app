import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';

class TodoModelInheritedNotifier extends InheritedNotifier<TodoModel> {
  const TodoModelInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static TodoModel watch(BuildContext context) {
    final todoModel = context
        .dependOnInheritedWidgetOfExactType<TodoModelInheritedNotifier>()
        ?.notifier;
    assert(todoModel != null,
        'Cannot find TodoModelInheritedNotifier in context.');
    return todoModel!;
  }

  static TodoModel read(BuildContext context) {
    final todoModel = context
        .findAncestorWidgetOfExactType<TodoModelInheritedNotifier>()
        ?.notifier;
    assert(todoModel != null,
        'Cannot find TodoModelInheritedNotifier in context.');
    return todoModel!;
  }
}
