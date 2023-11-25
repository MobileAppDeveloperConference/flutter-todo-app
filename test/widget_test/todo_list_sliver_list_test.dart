import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/config.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_item.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_sliver_list.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';
import '../helper/widget_tester_extension.dart';
import '../mocking/mocking_config_repository.dart';
import '../mocking/mocking_todo_repository.dart';

void main() {
  testWidgets(
      'TodoListSliverList 위젯은 투두 목록과 important와 completed 상태에 따라 다른 목록이 표시되야한다.',
      (tester) async {
    final todoModel = TodoModel(
      todoRepository: MockingTodoRepository.withTodoList(
        [
          Todo(
            completed: Completed.not,
            important: Important.not,
            title: 'not completed todo',
            description: 'description',
            createdAt: DateTime.now(),
          ),
          Todo(
            completed: Completed.completed,
            important: Important.not,
            title: 'completed todo',
            description: 'description',
            createdAt: DateTime.now(),
          ),
        ],
      ),
      configRepository: MockingConfigRepository.withConfig(
        Config(
          important: Important.not,
          isHiddenFinish: false,
        ),
      ),
    );
    await tester.pumpWidgetInScaffold(
      TodoModelInheritedNotifier(
        notifier: todoModel,
        child: const CustomScrollView(
          slivers: [
            TodoListSliverList(
              completed: Completed.not,
              important: Important.not,
            ),
          ],
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(TodoItem), findsNWidgets(1));
  });
}
