import 'package:flutter/material.dart';

class TodoAppBarStarToggle extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  const TodoAppBarStarToggle({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        isFavorite
            ? 'assets/images/icon_star_on_2x.png'
            : 'assets/images/icon_star_off_2x.png',
        scale: 2,
      ),
    );
  }
}
