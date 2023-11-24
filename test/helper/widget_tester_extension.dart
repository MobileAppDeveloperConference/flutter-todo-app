import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetExtensionTester on WidgetTester {
  Future<void> pumpWidgetInScaffold(
    Widget widget, [
    Duration? duration,
    Size simulateScreenSize = const Size(320, 480),
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
  ]) {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: simulateScreenSize.width,
            height: simulateScreenSize.height,
            child: widget,
          ),
        ),
      ),
      duration,
      phase,
    );
  }
}
