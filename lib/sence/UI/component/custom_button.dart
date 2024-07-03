import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text, 
    required this.onPressed, 
    required this.color, 
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: null, child: 
      Text(text, style: TextStyle(color: textColor),)
    );
  }
}