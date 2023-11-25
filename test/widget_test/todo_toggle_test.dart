import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_toggle.dart';

import '../helper/widget_tester_extension.dart';

void main() {
  testWidgets('TodoToggle 위젯은 사용자의 터치 입력 이벤트를 콜백으로 전달해야한다.', (tester) async {
    bool didTap = false;
    await tester.pumpWidgetInScaffold(
      TodoToggle(
        completed: Completed.completed,
        onTap: (_) => didTap = true,
      ),
    );
    final inkWellWidget = find.byType(InkWell);
    expect(inkWellWidget, findsOneWidget);
    await tester.tap(inkWellWidget);
    expect(didTap, true);
  });
}
