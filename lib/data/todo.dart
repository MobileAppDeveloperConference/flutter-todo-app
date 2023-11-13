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
