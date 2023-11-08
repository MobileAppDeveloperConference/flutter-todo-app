import 'package:flutter/material.dart';

class TodoAddTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAddTaskAppBar({
    super.key,
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
                'assets/images/icon_title_add_task_2x.png',
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
              GestureDetector(
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
              GestureDetector(
                child: const Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(153, 153, 153, 1),
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
