import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final int maxLength;
  final int maxLines;
  final String hintText;
  final bool usingSuffix;
  final Function(String text)? onChangedText;
  const CustomTextFormField({
    super.key,
    required this.maxLength,
    required this.maxLines,
    required this.hintText,
    required this.usingSuffix,
    this.onChangedText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final TextEditingController textEditingController = TextEditingController();

  bool get isDisplaySuffix =>
      widget.usingSuffix && textEditingController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_onChangedText);
  }

  @override
  void dispose() {
    textEditingController.removeListener(_onChangedText);
    super.dispose();
  }

  void _onChangedText() {
    setState(() {
      var callback = widget.onChangedText;
      if (callback != null) {
        callback(textEditingController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      cursorColor: const Color.fromRGBO(255, 52, 52, 1),
      cursorHeight: 16,
      cursorWidth: 1,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hintText,
        counterText: '',
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color.fromRGBO(171, 171, 171, 1),
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        fillColor: const Color.fromRGBO(246, 246, 246, 1),
        suffixIconConstraints: isDisplaySuffix
            ? const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              )
            : null,
        suffixIcon: isDisplaySuffix
            ? _TextFormFieldSuffix(
                onTap: textEditingController.clear,
              )
            : null,
      ),
    );
  }
}

class _TextFormFieldSuffix extends StatelessWidget {
  final Function() onTap;
  const _TextFormFieldSuffix({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(153, 153, 153, 1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Image.asset(
            'assets/images/icon_x_2x.png',
            scale: 2,
          ),
        ),
      ),
    );
  }
}
