import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository {
  final SharedPreferences sharedPreferences;

  TodoRepository({
    required this.sharedPreferences,
  });
}
