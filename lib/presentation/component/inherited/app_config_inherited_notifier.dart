import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/config_model.dart';

class AppConfigModelInheritedNotifier extends InheritedNotifier<ConfigModel> {
  const AppConfigModelInheritedNotifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ConfigModel watch(BuildContext context) {
    final appConfigModel = context
        .dependOnInheritedWidgetOfExactType<AppConfigModelInheritedNotifier>()
        ?.notifier;
    assert(appConfigModel != null,
        'Cannot find AppConfigModelInheritedNotifier in context.');
    return appConfigModel!;
  }

  static ConfigModel read(BuildContext context) {
    final appConfigModel = context
        .findAncestorWidgetOfExactType<AppConfigModelInheritedNotifier>()
        ?.notifier;
    assert(appConfigModel != null,
        'Cannot find AppConfigModelInheritedNotifier in context.');
    return appConfigModel!;
  }
}
