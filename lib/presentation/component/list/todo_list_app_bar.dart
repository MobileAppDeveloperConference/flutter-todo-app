import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/presentation/inherited/todo_model_inherited_notifier.dart';

class TodoListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoListAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 46);

  @override
  Widget build(BuildContext context) {
    final todoModel = TodoModelInheritedNotifier.watch(context);
    final important = todoModel.important;
    final isHiddenFinish = todoModel.isHiddenFinish;
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
                important.isImportant
                    ? 'assets/images/icon_title_star_2x.png'
                    : 'assets/images/icon_title_todo_2x.png',
                scale: 2,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: () {
                  todoModel.updateHiddenFinish(!isHiddenFinish);
                },
                child: Container(
                  width: 77,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: isHiddenFinish
                        ? ColorPalette.primary.color
                        : Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      isHiddenFinish ? '완료 보기' : '완료 숨기기',
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
