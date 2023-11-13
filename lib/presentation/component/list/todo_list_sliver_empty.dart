import 'package:flutter/material.dart';

class TodoListSliverEmpty extends StatelessWidget {
  const TodoListSliverEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 128,
        width: double.infinity,
        color: const Color.fromRGBO(226, 239, 255, 0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_empty_todo_2x.png',
              scale: 2,
            ),
            const SizedBox(height: 21),
            const Text(
              '투두를 추가해보세요.',
              style: TextStyle(
                color: Color.fromRGBO(201, 219, 240, 1),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
