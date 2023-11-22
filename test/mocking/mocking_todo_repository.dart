import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/data/todo_repository.dart';

class MockingTodoRepository implements TodoRepository {
  factory MockingTodoRepository.empty() =>
      MockingTodoRepository._(initialTodoList: List.empty());
  factory MockingTodoRepository.withTodoList(List<Todo> todoList) =>
      MockingTodoRepository._(initialTodoList: todoList);

  List<Todo> initialTodoList;

  MockingTodoRepository._({required this.initialTodoList});
  @override
  List<Todo> load() {
    return initialTodoList;
  }

  @override
  void save({required List<Todo> todoList}) {
    initialTodoList = todoList;
  }
}
