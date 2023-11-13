import 'package:flutter_todo_app/common/enums.dart';

class AppConfig {
  final TodoNavigations todoNavigation;
  final bool isHiddenFinish;

  AppConfig({
    required this.todoNavigation,
    required this.isHiddenFinish,
  });

  AppConfig copyWith({
    TodoNavigations? todoNavigation,
    bool? isHiddenFinish,
  }) {
    return AppConfig(
      todoNavigation: todoNavigation ?? this.todoNavigation,
      isHiddenFinish: isHiddenFinish ?? this.isHiddenFinish,
    );
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        todoNavigation: TodoNavigations.values[json['todoNavigation'] as int],
        isHiddenFinish: json['isHiddenFinish'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'todoNavigation': todoNavigation.index,
        'isHiddenFinish': isHiddenFinish,
      };
}
