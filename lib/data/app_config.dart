import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/common/extensions.dart';

class AppConfig {
  final ImportantState importantState;
  final bool isHiddenFinish;

  bool get isImportant => importantState.isImportant;

  AppConfig({
    required this.importantState,
    required this.isHiddenFinish,
  });

  AppConfig copyWith({
    ImportantState? importantState,
    bool? isHiddenFinish,
  }) {
    return AppConfig(
      importantState: importantState ?? this.importantState,
      isHiddenFinish: isHiddenFinish ?? this.isHiddenFinish,
    );
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        importantState: ImportantState.values[json['importantState'] as int],
        isHiddenFinish: json['isHiddenFinish'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'importantState': importantState.index,
        'isHiddenFinish': isHiddenFinish,
      };
}
