import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_item.dart';

class TodoListSliverList extends StatelessWidget {
  final TodoFilters filter;
  final bool isShowOnlyFavorite;
  const TodoListSliverList({
    super.key,
    required this.filter,
    required this.isShowOnlyFavorite,
  });

  @override
  Widget build(BuildContext context) {
    var todoList = TodoModelInheritedNotifier.watch(context).get(
      filter: filter,
    );
    if (isShowOnlyFavorite) {
      todoList = todoList.where((element) => element.isFavorite).toList();
    }
    return SliverList.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) => TodoItem(
        todo: todoList.elementAt(index),
      ),
    );
  }
}
