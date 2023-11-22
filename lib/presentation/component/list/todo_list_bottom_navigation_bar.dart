import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';

class TodoListBottomNavigationBar extends StatelessWidget {
  const TodoListBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final todoModel = TodoModelInheritedNotifier.watch(context);
    final importantState = todoModel.importantState;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorPalette.rgb235.color,
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_tap_home_${importantState.isImportant ? 'off' : 'on'}_2x.png',
              scale: 2,
            ),
            label: '기본',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_tap_star_${importantState.isImportant ? 'on' : 'off'}_2x.png',
              scale: 2,
            ),
            label: '중요',
          ),
        ],
        currentIndex: ImportantState.values.indexOf(
          todoModel.importantState,
        ),
        onTap: (index) {
          todoModel.updateImportantFilter(
            ImportantState.values.elementAt(index),
          );
        },
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: ColorPalette.rgb153.color,
      ),
    );
  }
}
