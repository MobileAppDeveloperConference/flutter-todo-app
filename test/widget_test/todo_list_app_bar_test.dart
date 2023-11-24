import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/config.dart';
import 'package:flutter_todo_app/domain/todo_model.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_list_app_bar.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';

import '../helper/widget_tester_extension.dart';
import '../mocking/mocking_config_repository.dart';
import '../mocking/mocking_todo_repository.dart';

void main() {
  testWidgets('TodoListAppBar는 isHiddenFinish 상태에 따라 적절한 텍스트가 표시되야한다.',
      (tester) async {
    final todoModel = TodoModel(
      todoRepository: MockingTodoRepository.empty(),
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
        child: const TodoListAppBar(),
      ),
    );
    expect(find.text('완료 숨기기'), findsOneWidget);
  });
}
