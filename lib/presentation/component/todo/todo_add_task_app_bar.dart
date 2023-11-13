import 'package:flutter/material.dart';

class TodoAddTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool canAdd;
  final bool isFavorite;
  final Function({required bool isFavorite}) onFinished;
  const TodoAddTaskAppBar({
    super.key,
    required this.canAdd,
    required this.isFavorite,
    required this.onFinished,
  });

  @override
  State<TodoAddTaskAppBar> createState() => _TodoAddTaskAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 46);
}

class _TodoAddTaskAppBarState extends State<TodoAddTaskAppBar> {
  bool? _isFavorite;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isFavorite ??= widget.isFavorite;
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
              InkWell(
                onTap: () {
                  setState(() {
                    _isFavorite = !_isFavorite!;
                  });
                },
                child: Image.asset(
                  _isFavorite!
                      ? 'assets/images/icon_star_on_2x.png'
                      : 'assets/images/icon_star_off_2x.png',
                  scale: 2,
                ),
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
                    ? () => widget.onFinished(isFavorite: _isFavorite!)
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
