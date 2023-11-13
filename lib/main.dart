import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_app/domain/todo_list_change_notifier.dart';
import 'package:flutter_todo_app/presentation/component/inherited/todo_list_inherited_notifier.dart';
import 'package:flutter_todo_app/presentation/screen/todo_list_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 763),
      child: TodoListInheritedNotifier(
        notifier: TodoListChangeNotifier(),
        child: MaterialApp(
          title: 'Todo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Pretendard',
            useMaterial3: true,
          ),
          home: const TodoListScreen(),
        ),
      ),
    );
  }
}
