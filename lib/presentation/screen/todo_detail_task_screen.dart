import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/presentation/component/common/custom_text_form_field.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_list_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/component/todo/todo_edit_header.dart';
import 'package:flutter_todo_app/presentation/component/todo/todo_edit_task_app_bar.dart';

class TodoDetailTaskScreen extends StatelessWidget {
  final Todo initialTodo;
  const TodoDetailTaskScreen({
    super.key,
    required this.initialTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoEditTaskAppBar(
        initialFavorite: initialTodo.isFavorite,
        onClose: () {
          Navigator.of(context).pop();
        },
        onChangedFavorite: (isFavorite) {
          TodoListInheritedNotifier.of(context).setFavorite(
            todo: initialTodo,
            isFavorite: isFavorite,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 42),
              TodoEditHeader(initialTodo: initialTodo),
              CustomTextFormField(
                initialText: initialTodo.title,
                maxLength: 28,
                maxLines: 1,
                hintText: '투두를 입력해주세요.',
                usingSuffix: true,
                onChangedText: (text) {
                  TodoListInheritedNotifier.of(context).setTitle(
                    todo: initialTodo,
                    title: text,
                  );
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                initialText: initialTodo.description,
                maxLength: 362,
                maxLines: 12,
                hintText: '원한다면 투두에 설명도 추가할 수 있어요.',
                usingSuffix: false,
                onChangedText: (text) {
                  TodoListInheritedNotifier.of(context).setDescription(
                    todo: initialTodo,
                    description: text,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
