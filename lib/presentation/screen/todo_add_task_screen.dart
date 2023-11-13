import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/component/common/custom_text_form_field.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_model_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/todo/todo_add_task_app_bar.dart';

class TodoAddTaskScreen extends StatefulWidget {
  const TodoAddTaskScreen({super.key});

  @override
  State<TodoAddTaskScreen> createState() => _TodoAddTaskScreenState();
}

class _TodoAddTaskScreenState extends State<TodoAddTaskScreen> {
  bool _canAdd = false;
  String _title = '';
  String _description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAddTaskAppBar(
        canAdd: _canAdd,
        isImportant: false,
        onFinished: (isImportant) {
          TodoModelInheritedNotifier.read(context).create(
            title: _title,
            description: _description,
            isImportant: isImportant,
          );
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                maxLength: 28,
                maxLines: 1,
                hintText: '투두를 입력해주세요.',
                usingSuffix: true,
                onChangedText: (text) {
                  _title = text;
                  var isTextNotEmpty = text.isNotEmpty;
                  if (_canAdd != isTextNotEmpty) {
                    setState(() {
                      _canAdd = isTextNotEmpty;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                maxLength: 362,
                maxLines: 12,
                hintText: '원한다면 투두에 설명도 추가할 수 있어요.',
                usingSuffix: false,
                onChangedText: (text) {
                  _description = text;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
