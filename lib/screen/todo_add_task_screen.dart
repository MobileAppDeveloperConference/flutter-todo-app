import 'package:flutter/material.dart';
import 'package:flutter_todo_app/component/common/custom_text_form_field.dart';
import 'package:flutter_todo_app/component/todo/todo_add_task_app_bar.dart';

class TodoAddTaskScreen extends StatelessWidget {
  const TodoAddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TodoAddTaskAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                maxLength: 28,
                maxLines: 1,
                hintText: '투두를 입력해주세요.',
                usingSuffix: true,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                maxLength: 362,
                maxLines: 12,
                hintText: '원한다면 투두에 설명도 추가할 수 있어요.',
                usingSuffix: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
