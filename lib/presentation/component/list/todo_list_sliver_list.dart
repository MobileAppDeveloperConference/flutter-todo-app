import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_item.dart';

class TodoListSliverList extends StatelessWidget {
  final CompleteState completeState;
  final ImportantState importantState;
  const TodoListSliverList({
    super.key,
    required this.completeState,
    required this.importantState,
  });

  @override
  Widget build(BuildContext context) {
    var todoList = TodoModelInheritedNotifier.watch(context).get(
      completeState: completeState,
      importantState: importantState,
    );
    return SliverList.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) => TodoItem(
        todo: todoList.elementAt(index),
      ),
    );
  }
}
