import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';

class TodoListSliverEmpty extends StatelessWidget {
  const TodoListSliverEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 128,
        width: double.infinity,
        color: ColorPalette.backgroundEmpty.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon_empty_todo_2x.png',
              scale: 2,
            ),
            const SizedBox(height: 21),
            Text(
              '투두를 추가해보세요.',
              style: TextStyle(
                color: ColorPalette.textEmpty.color,
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
