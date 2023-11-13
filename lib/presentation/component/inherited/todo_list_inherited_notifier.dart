import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/todo_list_change_notifier.dart';

class TodoListInheritedNotifier
    extends InheritedNotifier<TodoListChangeNotifier> {
  const TodoListInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static TodoListChangeNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TodoListInheritedNotifier>()!
        .notifier!;
  }
}
