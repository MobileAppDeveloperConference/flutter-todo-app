import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/dialog/custom_dialog.dart';
import 'package:flutter_todo_app/presentation/component/common/dialog/custom_dialog_button.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';

mixin TodoDeleteDialogCreator {
  void showDeleteDialog({
    required BuildContext context,
    required Todo todo,
  }) {
    CustomDialog.show(
      context: context,
      title: '투두를 삭제할까요?',
      description: '삭제하면 되돌릴 수 없어요.',
      customDialogButtons: [
        CustomDialogButton(
          title: '취소',
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          onTap: (context) {
            Navigator.of(context).pop();
          },
        ),
        CustomDialogButton(
          title: '삭제하기',
          textStyle: TextStyle(
            color: ColorPalette.primary.color,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          onTap: (context) {
            TodoModelInheritedNotifier.read(context).delete(todo: todo);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
