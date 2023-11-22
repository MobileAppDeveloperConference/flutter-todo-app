import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class Config {
  final ImportantState importantState;
  final bool isHiddenFinish;

  bool get isImportant => importantState.isImportant;

  Config({
    required this.importantState,
    required this.isHiddenFinish,
  });

  Config copyWith({
    ImportantState? importantState,
    bool? isHiddenFinish,
  }) {
    return Config(
      importantState: importantState ?? this.importantState,
      isHiddenFinish: isHiddenFinish ?? this.isHiddenFinish,
    );
  }

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        importantState: ImportantState.values[json['importantState'] as int],
        isHiddenFinish: json['isHiddenFinish'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'importantState': importantState.index,
        'isHiddenFinish': isHiddenFinish,
      };
}
