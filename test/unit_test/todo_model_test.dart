import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/config.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:test/test.dart';

import '../mocking/mocking_config_repository.dart';
import '../mocking/mocking_todo_repository.dart';

void main() {
  final defaultConfig = Config(
    important: Important.not,
    isHiddenFinish: false,
  );

  final notCompletedTodoList = [
    Todo(
      completed: Completed.not,
      important: Important.not,
      title: 'title',
      description: 'description',
      createdAt: DateTime.now(),
    ),
  ];

  final completedTodoList = [
    Todo(
      completed: Completed.completed,
      important: Important.not,
      title: 'title',
      description: 'description',
      createdAt: DateTime.now(),
    ),
  ];
  test('투두 아이템 존재 여부에 따라 isEmpty는 적절한 값을 반환해야 한다.', () {
    final emptyTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.empty(),
      configRepository: MockingConfigRepository.withConfig(
        defaultConfig,
      ),
    );

    expect(emptyTodoModel.isEmpty, true);

    final existTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.withTodoList(notCompletedTodoList),
      configRepository: MockingConfigRepository.withConfig(
        defaultConfig,
      ),
    );
    expect(existTodoModel.isEmpty, false);
  });

  test('투두 아이템의 완료 여부에 따라 isExistCompleted는 적절한 값을 반환해야 한다.', () {
    final emptyTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.empty(),
      configRepository: MockingConfigRepository.withConfig(
        defaultConfig,
      ),
    );

    expect(emptyTodoModel.isExistCompleted, false);

    final existTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.withTodoList(
        notCompletedTodoList,
      ),
      configRepository: MockingConfigRepository.withConfig(
        defaultConfig,
      ),
    );
    expect(existTodoModel.isExistCompleted, false);

    final existTodoButExistCompletedModel = TodoModel(
      todoRepository: MockingTodoRepository.withTodoList(
        completedTodoList,
      ),
      configRepository: MockingConfigRepository.withConfig(
        defaultConfig,
      ),
    );
    expect(existTodoButExistCompletedModel.isExistCompleted, true);
  });

  test('투두 아이템을 추가 했을 때 isEmpty는 false를 반환해야 한다.', () {
    final emptyTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.empty(),
      configRepository: MockingConfigRepository.withConfig(defaultConfig),
    );
    emptyTodoModel.create(title: 'title', important: Important.not);
    expect(emptyTodoModel.isEmpty, false);
  });

  test('투두 아이템을 삭제 했을 때 isEmpty는 true를 반환해야 한다.', () {
    final existTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.withTodoList(notCompletedTodoList),
      configRepository: MockingConfigRepository.withConfig(defaultConfig),
    );
    existTodoModel.delete(todo: notCompletedTodoList.first);
    expect(existTodoModel.isEmpty, true);
  });

  test('투두 아이템을 완료 했을 때 isExistCompleted는 true를 반환해야 한다.', () {
    final existTodoModel = TodoModel(
      todoRepository: MockingTodoRepository.withTodoList(notCompletedTodoList),
      configRepository: MockingConfigRepository.withConfig(defaultConfig),
    );
    existTodoModel.update(
      todo: notCompletedTodoList.first.copyWith(
        completed: Completed.completed,
      ),
    );
    expect(existTodoModel.isExistCompleted, true);
  });
}
