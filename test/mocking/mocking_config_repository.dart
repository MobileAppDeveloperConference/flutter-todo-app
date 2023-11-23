import 'package:flutter_todo_app/data/config.dart';
import 'package:flutter_todo_app/data/config_repository.dart';

class MockingConfigRepository implements ConfigRepository {
  // factory
  factory MockingConfigRepository.withConfig(Config config) =>
      MockingConfigRepository._(initialConfig: config);

  final Config initialConfig;
  MockingConfigRepository._({required this.initialConfig});

  @override
  Config load() {
    return initialConfig;
  }

  @override
  void save({required Config config}) {
    // nothing to do
  }
}
