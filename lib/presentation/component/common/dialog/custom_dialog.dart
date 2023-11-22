import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/enums.dart';
import 'package:flutter_todo_app/presentation/component/common/dialog/custom_dialog_button.dart';

class CustomDialog extends StatelessWidget {
  static Future show({
    required BuildContext context,
    required String title,
    required String description,
    required List<CustomDialogButton> customDialogButtons,
  }) {
    return showDialog(
      context: context,
      builder: (context) => CustomDialog._(
        title: title,
        description: description,
        customDialogButtons: customDialogButtons,
      ),
    );
  }

  final String title;
  final String description;
  final List<CustomDialogButton> customDialogButtons;

  const CustomDialog._({
    required this.title,
    required this.description,
    required this.customDialogButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
          ),
          Center(
            child: Container(
              width: 328,
              height: 240,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        color: ColorPalette.rgb153.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: customDialogButtons,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
