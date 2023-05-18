import 'package:flutter/material.dart';

class TextItemWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TextItemWidget(
      {Key? key,
      required this.title,
      this.fontSize,
      this.textColor,
      this.textAlign,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
