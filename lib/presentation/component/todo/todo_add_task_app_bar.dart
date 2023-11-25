import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/common/todo_app_bar_star_toggle.dart';

class TodoAddTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool canAdd;
  final Important initialImportant;
  final Function(Important important) onFinished;
  const TodoAddTaskAppBar({
    super.key,
    required this.canAdd,
    required this.initialImportant,
    required this.onFinished,
  });

  @override
  State<TodoAddTaskAppBar> createState() => _TodoAddTaskAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 46);
}

class _TodoAddTaskAppBarState extends State<TodoAddTaskAppBar> {
  Important? important;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    important ??= widget.initialImportant;
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
                important: important!,
                onTap: (nextImportant) {
                  setState(() {
                    important = nextImportant;
                  });
                },
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  '취소',
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorPalette.rgb153.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 26),
              InkWell(
                onTap:
                    widget.canAdd ? () => widget.onFinished(important!) : null,
                child: Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.canAdd
                        ? ColorPalette.primary.color
                        : ColorPalette.rgb153.color,
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
