import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_app_bar_star_toggle.dart';

class TodoAddTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool canAdd;
  final bool isImportant;
  final Function(bool isImportant) onFinished;
  const TodoAddTaskAppBar({
    super.key,
    required this.canAdd,
    required this.isImportant,
    required this.onFinished,
  });

  @override
  State<TodoAddTaskAppBar> createState() => _TodoAddTaskAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 46);
}

class _TodoAddTaskAppBarState extends State<TodoAddTaskAppBar> {
  bool? isImportant;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isImportant ??= widget.isImportant;
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
                'assets/images/icon_title_add_task_2x.png',
                scale: 2,
              ),
              const SizedBox(width: 8),
              TodoAppBarStarToggle(
                isImportant: isImportant!,
                onTap: () {
                  setState(() {
                    isImportant = !isImportant!;
                  });
                },
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  '취소',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(153, 153, 153, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 26),
              InkWell(
                onTap: widget.canAdd
                    ? () => widget.onFinished(isImportant!)
                    : null,
                child: Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.canAdd
                        ? const Color.fromRGBO(255, 52, 52, 1)
                        : const Color.fromRGBO(153, 153, 153, 1),
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
