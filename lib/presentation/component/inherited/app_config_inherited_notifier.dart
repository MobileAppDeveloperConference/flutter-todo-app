import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/app_config_model.dart';

class AppConfigModelInheritedNotifier
    extends InheritedNotifier<AppConfigModel> {
  const AppConfigModelInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static AppConfigModel watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppConfigModelInheritedNotifier>()!
        .notifier!;
  }

  static AppConfigModel read(BuildContext context) {
    return context
        .findAncestorWidgetOfExactType<AppConfigModelInheritedNotifier>()!
        .notifier!;
  }
}
