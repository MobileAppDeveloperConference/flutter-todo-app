import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class Todo {
  final CompleteState completeState;
  final ImportantState importantState;
  final String title;
  final String description;
  final DateTime createdAt;

  Todo({
    required this.completeState,
    required this.importantState,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  bool get isNotCompleted => completeState.isNotCompleted;
  bool get isImportant => importantState.isImportant;

  bool isEqualStates({
    required CompleteState completeState,
    required ImportantState importantState,
  }) {
    return this.completeState == completeState &&
        this.importantState == importantState;
  }

  Todo copyWith({
    CompleteState? completeState,
    ImportantState? importantState,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return Todo(
      completeState: completeState ?? this.completeState,
      importantState: importantState ?? this.importantState,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        completeState: CompleteState.values[json['completeState'] as int],
        importantState: ImportantState.values[json['importantState'] as int],
        title: json['title'] as String,
        description: json['description'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'completeState': completeState.index,
        'importantState': importantState.index,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
      };
}
