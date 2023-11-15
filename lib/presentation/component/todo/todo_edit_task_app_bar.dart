import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_app_bar_star_toggle.dart';

class TodoEditTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ImportantState initialImportantState;
  final VoidCallback onClose;
  final Function(ImportantState importantState) onChangedImportant;
  const TodoEditTaskAppBar({
    super.key,
    required this.initialImportantState,
    required this.onClose,
    required this.onChangedImportant,
  });

  @override
  State<TodoEditTaskAppBar> createState() => _TodoEditTaskAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 46);
}

class _TodoEditTaskAppBarState extends State<TodoEditTaskAppBar> {
  ImportantState? importantState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    importantState ??= widget.initialImportantState;
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
                'assets/images/icon_title_task_2x.png',
                scale: 2,
              ),
              const SizedBox(width: 8),
              TodoAppBarStarToggle(
                importantState: importantState!,
                onTap: () {
                  setState(() {
                    importantState = importantState!.nextState;
                    widget.onChangedImportant(importantState!);
                  });
                },
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                onTap: () => widget.onClose(),
                child: const Text(
                  '닫기',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
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
