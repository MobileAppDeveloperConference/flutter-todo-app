import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/inherited/app_config_inherited_notifier.dart';

class TodoListBottomNavigationBar extends StatelessWidget {
  const TodoListBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigModel = AppConfigModelInheritedNotifier.watch(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(235, 235, 235, 1),
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_tap_home_${appConfigModel.isImportants ? 'off' : 'on'}_2x.png',
              scale: 2,
            ),
            label: '기본',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_tap_star_${appConfigModel.isImportants ? 'on' : 'off'}_2x.png',
              scale: 2,
            ),
            label: '중요',
          ),
        ],
        currentIndex: appConfigModel.todoNavigationIndex,
        onTap: (index) {
          appConfigModel.setTodoNavigation(
            TodoNavigations.values.elementAt(index),
          );
        },
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromRGBO(171, 171, 171, 1),
      ),
    );
  }
}
