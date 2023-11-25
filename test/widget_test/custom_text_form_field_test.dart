import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/presentation/component/common/custom_text_form_field.dart';

import '../helper/widget_tester_extension.dart';

void main() {
  testWidgets('CustomTextFormField는 전달한 인자에 따라 기대대로 동작해야한다.', (tester) async {
    String resultText = '';
    await tester.pumpWidgetInScaffold(
      CustomTextFormField(
        maxLength: 10,
        maxLines: 1,
        hintText: 'hintText',
        usingSuffix: false,
        onChangedText: (text) => resultText = text,
      ),
    );
    await tester.enterText(find.byType(CustomTextFormField), '일이삼사오육칠팔구십일');
    expect(resultText, '일이삼사오육칠팔구십');
    expect(find.text('일이삼사오육칠팔구십'), findsOneWidget);
  });
}
