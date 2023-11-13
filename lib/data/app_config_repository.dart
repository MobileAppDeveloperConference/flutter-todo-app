import 'dart:convert';

import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppConfigRepository {
  AppConfig load();
  void save({required AppConfig appConfig});
}

class AppConfigRepositoryImpl implements AppConfigRepository {
  static const String key = 'appConfigKey';
  final SharedPreferences sharedPreferences;

  AppConfigRepositoryImpl({
    required this.sharedPreferences,
  });

  @override
  AppConfig load() {
    final appConfigString = sharedPreferences.getString(key);
    if (appConfigString != null) {
      return AppConfig.fromJson(jsonDecode(appConfigString));
    } else {
      return AppConfig(
        todoNavigation: TodoNavigations.all,
        isHiddenFinish: false,
      );
    }
  }

  @override
  void save({required AppConfig appConfig}) {
    sharedPreferences.setString(
      key,
      jsonEncode(appConfig.toJson()),
    );
  }
}
