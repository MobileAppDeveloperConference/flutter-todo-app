import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class Config {
  final Important important;
  final bool isHiddenFinish;

  bool get isImportant => important.isImportant;

  Config({
    required this.important,
    required this.isHiddenFinish,
  });

  Config copyWith({
    Important? important,
    bool? isHiddenFinish,
  }) {
    return Config(
      important: important ?? this.important,
      isHiddenFinish: isHiddenFinish ?? this.isHiddenFinish,
    );
  }

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        important: Important.values[json['important'] as int],
        isHiddenFinish: json['isHiddenFinish'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'important': important.index,
        'isHiddenFinish': isHiddenFinish,
      };
}
