import 'package:flutter/material.dart';
import 'package:flutter_todo_app/component/list/todo_item.dart';
import 'package:flutter_todo_app/data/todo.dart';

class TodoListSliverList extends StatelessWidget {
  const TodoListSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return TodoItem(
          todo: Todo(
            title: '투두두두두',
            isCompleted: false,
            isFavorite: true,
            description: '이거슨 설명',
            createdAt: DateTime.now(),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
