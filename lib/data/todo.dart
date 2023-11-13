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

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        isCompleted: json['isCompleted'] as bool,
        isFavorite: json['isFavorite'] as bool,
        title: json['title'] as String,
        description: json['description'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isCompleted': isCompleted,
        'isFavorite': isFavorite,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
      };
}
