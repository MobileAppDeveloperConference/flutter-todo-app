import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';

class TodoListBottomNavigationBar extends StatelessWidget {
  final TodoTab selectedTodoTab;
  final Function(TodoTab tappedTab) onTap;
  const TodoListBottomNavigationBar({
    super.key,
    required this.selectedTodoTab,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
              'assets/images/icon_tap_home_${selectedTodoTab.isAll ? 'on' : 'off'}_2x.png',
              scale: 2,
            ),
            label: '기본',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_tap_star_${selectedTodoTab.isImportants ? 'on' : 'off'}_2x.png',
              scale: 2,
            ),
            label: '중요',
          ),
        ],
        currentIndex: TodoTab.values.indexOf(selectedTodoTab),
        onTap: (index) => onTap(TodoTab.values.elementAt(index)),
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromRGBO(171, 171, 171, 1),
      ),
    );
  }
}
