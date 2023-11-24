import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/list/todo_item.dart';

import '../helper/widget_tester_extension.dart';

void main() {
  testWidgets('TodoItem은 투두의 텍스트를 표시해야한다.', (tester) async {
    await tester.pumpWidgetInScaffold(
      TodoItem(
        todo: Todo(
          completed: Completed.completed,
          important: Important.important,
          title: 'title',
          description: 'description',
          createdAt: DateTime.now(),
        ),
      ),
    );
    expect(find.text('title'), findsOneWidget);
  });
}
