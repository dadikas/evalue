import 'package:evalue/sence/UI/theme/color_util.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isBold;
  final bool isItalic;
  final bool isCenter;
  final double size;
  final bool isOverflow;
  final Color textColor;
  const CustomText(
      {super.key,
      required this.text,
      this.isBold = false,
      this.isItalic = false,
      this.isCenter = false,
      this.isOverflow = false,
      this.size = 16,
      this.textColor = ColorUtil.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: isOverflow ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: size,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        color: textColor,
        decoration: TextDecoration.none,
      ),
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
    );
  }
}