import 'package:flutter/material.dart';

class TodoTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isReadOnly;
  const TodoTaskAppBar({
    super.key,
    required this.isReadOnly,
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
                'assets/images/icon_title_task_2x.png',
                scale: 2,
              ),
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/icon_star_off_2x.png',
                scale: 2,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
