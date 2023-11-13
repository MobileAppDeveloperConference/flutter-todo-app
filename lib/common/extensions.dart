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

extension TodoNavigationExtension on TodoNavigations {
  bool get isAll => this == TodoNavigations.all;
  bool get isImportants => this == TodoNavigations.importants;
}
