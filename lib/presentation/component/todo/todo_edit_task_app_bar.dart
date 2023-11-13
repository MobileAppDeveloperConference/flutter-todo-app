import 'package:flutter/material.dart';

class TodoEditTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool initialFavorite;
  final VoidCallback onClose;
  final Function(bool isFavorite) onChangedFavorite;
  const TodoEditTaskAppBar({
    super.key,
    required this.initialFavorite,
    required this.onClose,
    required this.onChangedFavorite,
  });

  @override
  State<TodoEditTaskAppBar> createState() => _TodoEditTaskAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 46);
}

class _TodoEditTaskAppBarState extends State<TodoEditTaskAppBar> {
  bool? isFavorite;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isFavorite ??= widget.initialFavorite;
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
              InkWell(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite!;
                    widget.onChangedFavorite(isFavorite!);
                  });
                },
                child: Image.asset(
                  isFavorite!
                      ? 'assets/images/icon_star_on_2x.png'
                      : 'assets/images/icon_star_off_2x.png',
                  scale: 2,
                ),
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
