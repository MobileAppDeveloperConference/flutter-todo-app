import 'dart:async';

import 'package:flutter/material.dart';

class CustomToast extends StatefulWidget {
  static Future show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 2),
    VoidCallback? onHide,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        return CustomToast._(
          message: message,
          duration: duration,
        );
      },
    );
  }

  final String message;
  final Duration duration;
  const CustomToast._({
    required this.message,
    required this.duration,
  });

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(widget.duration, () {
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: const Offset(0, -158),
          child: Container(
            width: screenWidth - 16 * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Text(
              widget.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
