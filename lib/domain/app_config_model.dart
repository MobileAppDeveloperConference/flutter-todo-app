import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/app_config.dart';
import 'package:flutter_todo_app/data/app_config_repository.dart';

class AppConfigModel extends ChangeNotifier {
  final AppConfigRepository repository;
  AppConfig appConfig;

  bool get isHiddenFinish => appConfig.isHiddenFinish;
  bool get isShowFinish => !isHiddenFinish;
  bool get isImportant => appConfig.isImportant;
  ImportantState get importantFilter => appConfig.importantState;
  int get todoNavigationIndex => ImportantState.values.indexOf(
        appConfig.importantState,
      );

  AppConfigModel({required this.repository}) : appConfig = repository.load();

  void _saveAndNotify() {
    repository.save(appConfig: appConfig);
    notifyListeners();
  }

  void toggleHideFinish() {
    appConfig = appConfig.copyWith(
      isHiddenFinish: !isHiddenFinish,
    );
    _saveAndNotify();
  }

  void setImportantFilter(ImportantState importantFilter) {
    appConfig = appConfig.copyWith(
      importantState: importantFilter,
    );
    _saveAndNotify();
  }
}
