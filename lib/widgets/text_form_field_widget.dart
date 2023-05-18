import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Widget? prefixWidget;
  final String hintText;
  final TextEditingController controller;
  final Color borderColor;
  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.prefixWidget,
    required this.borderColor,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          prefixIcon: prefixWidget),
    );
  }
}
