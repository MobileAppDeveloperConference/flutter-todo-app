import 'dart:convert';

import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/data/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ConfigRepository {
  Config load();
  void save({required Config config});
}

class ConfigRepositoryImpl implements ConfigRepository {
  static const String key = 'configKey';
  final SharedPreferences sharedPreferences;

  ConfigRepositoryImpl({
    required this.sharedPreferences,
  });

  @override
  Config load() {
    final configString = sharedPreferences.getString(key);
    if (configString != null) {
      return Config.fromJson(jsonDecode(configString));
    } else {
      return Config(
        importantState: ImportantState.not,
        isHiddenFinish: false,
      );
    }
  }

  @override
  void save({required Config config}) {
    sharedPreferences.setString(
      key,
      jsonEncode(config.toJson()),
    );
  }
}
