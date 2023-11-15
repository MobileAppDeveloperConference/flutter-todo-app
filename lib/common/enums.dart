import 'package:flutter/material.dart';

enum CompleteState {
  not,
  completed,
}

enum ImportantState {
  not,
  important,
}

enum ColorPalette {
  backgroundList(Color.fromRGBO(248, 251, 255, 1)),
  backgroundEmpty(Color.fromRGBO(226, 239, 255, 0.3)),

  primary(Color.fromRGBO(255, 52, 52, 1)),
  secondary(Color.fromRGBO(81, 130, 255, 1)),

  textEmpty(Color.fromRGBO(201, 219, 240, 1)),

  rgb153(Color.fromRGBO(153, 153, 153, 1)),
  rgb171(Color.fromRGBO(171, 171, 171, 1)),
  rgb204(Color.fromRGBO(204, 204, 204, 1)),
  rgb235(Color.fromRGBO(235, 235, 235, 1)),
  rgb246(Color.fromRGBO(246, 246, 246, 1));

  const ColorPalette(this.color);

  final Color color;
}
