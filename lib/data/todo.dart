import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class Todo {
  final Completed completed;
  final Important important;
  final String title;
  final String description;
  final DateTime createdAt;

  Todo({
    required this.completed,
    required this.important,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  bool get isNotCompleted => completed.isNotCompleted;
  bool get isImportant => important.isImportant;

  Completed get nextCompleted => completed.next;
  Important get nextImportant => important.next;

  bool isInCondition({
    required Completed completed,
    Important? important,
  }) {
    return important == null
        ? this.completed == completed
        : (this.completed == completed && this.important == important);
  }

  Todo copyWith({
    Completed? completed,
    Important? important,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Todo(
      completed: completed ?? this.completed,
      important: important ?? this.important,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        completed: Completed.values[json['completed'] as int],
        important: Important.values[json['important'] as int],
        title: json['title'] as String,
        description: json['description'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'completed': completed.index,
        'important': important.index,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
      };
}
