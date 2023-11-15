import 'package:flutter_todo_app/common/enums.dart';

extension KoreanDateTimeExtension on DateTime {
  String get toWeekdayString => switch (weekday) {
        1 => '월',
        2 => '화',
        3 => '수',
        4 => '목',
        5 => '금',
        6 => '토',
        7 => '일',
        _ => throw Exception('weekday는 1-7사이의 값을 사용합니다'),
      };
  String get toMonthString => '$month월';
  String get toDayString => '$day월';
}

extension ImportantStateExtension on ImportantState {
  bool get isImportant => this == ImportantState.important;
  bool get isNotImportant => this == ImportantState.not;

  ImportantState get nextState =>
      isNotImportant ? ImportantState.important : ImportantState.not;
}

extension CompleteStateExtension on CompleteState {
  bool get isCompleted => this == CompleteState.completed;
  bool get isNotCompleted => this == CompleteState.not;

  CompleteState get nextState =>
      isNotCompleted ? CompleteState.completed : CompleteState.not;
}
