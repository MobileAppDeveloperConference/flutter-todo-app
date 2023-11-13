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

class Todo {
  final bool isCompleted;
  final bool isFavorite;
  final String title;
  final String description;
  final DateTime createdAt;

  Todo({
    required this.isCompleted,
    required this.isFavorite,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  bool get isNotCompleted => !isCompleted;

  Todo copyWith({
    bool? isCompleted,
    bool? isFavorite,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Todo(
      isCompleted: isCompleted ?? this.isCompleted,
      isFavorite: isFavorite ?? this.isFavorite,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
