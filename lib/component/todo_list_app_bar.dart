import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';

class TodoListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TodoTab selectedTodoTab;
  final bool isHideFinished;
  final Function() onToggleHideFinished;
  const TodoListAppBar({
    super.key,
    required this.selectedTodoTab,
    required this.onToggleHideFinished,
    required this.isHideFinished,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 46);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 46,
          child: Row(
            children: [
              const SizedBox(width: 16),
              Image.asset(
                selectedTodoTab.isAll
                    ? 'assets/images/icon_title_todo_2x.png'
                    : 'assets/images/icon_title_star_2x.png',
                scale: 2,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: onToggleHideFinished,
                child: Container(
                  width: 77,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: isHideFinished
                        ? const Color.fromRGBO(255, 52, 52, 1)
                        : Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      isHideFinished ? '완료 보기' : '완료 숨기기',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
