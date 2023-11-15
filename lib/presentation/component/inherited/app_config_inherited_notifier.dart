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
    final appConfigModel = context
        .dependOnInheritedWidgetOfExactType<AppConfigModelInheritedNotifier>()
        ?.notifier;
    assert(appConfigModel != null,
        'Cannot find AppConfigModelInheritedNotifier in context.');
    return appConfigModel!;
  }

  static AppConfigModel read(BuildContext context) {
    final appConfigModel = context
        .findAncestorWidgetOfExactType<AppConfigModelInheritedNotifier>()
        ?.notifier;
    assert(appConfigModel != null,
        'Cannot find AppConfigModelInheritedNotifier in context.');
    return appConfigModel!;
  }
}
