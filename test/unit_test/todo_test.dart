import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:test/test.dart';

void main() {
  test(
    '${Completed.not}/${Important.not} 투두는 completed 조건 단독 검사 시 completed 조건에 따라 true 혹은 false를 반환해야 한다.',
    () {
      final notCompletedAndNotImportantTodo = Todo(
        completed: Completed.not,
        important: Important.not,
        title: 'title',
        description: 'description',
        createdAt: DateTime.now(),
      );
      expect(
        notCompletedAndNotImportantTodo.isInCondition(
          completed: Completed.not,
        ),
        true,
      );

      expect(
        notCompletedAndNotImportantTodo.isInCondition(
          completed: Completed.completed,
        ),
        false,
      );
    },
  );
  test(
    '${Completed.completed}/${Important.not} 투두는 completed 조건 단독 검사 시 completed 조건에 따라 true 혹은 false를 반환해야 한다.',
    () {
      final completedAndNotImportantTodo = Todo(
        completed: Completed.completed,
        important: Important.not,
        title: 'title',
        description: 'description',
        createdAt: DateTime.now(),
      );
      expect(
        completedAndNotImportantTodo.isInCondition(
          completed: Completed.completed,
        ),
        true,
      );

      expect(
        completedAndNotImportantTodo.isInCondition(
          completed: Completed.not,
        ),
        false,
      );
    },
  );

  test(
    '${Completed.not}/${Important.important} 투두는 completed 조건 단독 검사 시 completed 조건에 따라 true 혹은 false를 반환해야 한다.',
    () {
      final notCompletedAndImportantTodo = Todo(
        completed: Completed.not,
        important: Important.important,
        title: 'title',
        description: 'description',
        createdAt: DateTime.now(),
      );
      expect(
        notCompletedAndImportantTodo.isInCondition(
          completed: Completed.not,
        ),
        true,
      );

      expect(
        notCompletedAndImportantTodo.isInCondition(
          completed: Completed.completed,
        ),
        false,
      );
    },
  );

  test(
    '${Completed.not}/${Important.important} 투두는 completed 조건과 important 조건 검사 시 completed와 important 조건에 따라 true 혹은 false를 반환해야 한다.',
    () {
      final notCompletedAndImportantTodo = Todo(
        completed: Completed.not,
        important: Important.important,
        title: 'title',
        description: 'description',
        createdAt: DateTime.now(),
      );
      expect(
        notCompletedAndImportantTodo.isInCondition(
          completed: Completed.not,
          important: Important.important,
        ),
        true,
      );

      expect(
        notCompletedAndImportantTodo.isInCondition(
          completed: Completed.completed,
          important: Important.important,
        ),
        false,
      );
    },
  );
}
