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
}
