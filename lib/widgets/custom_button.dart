import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function() onBtnPressed;

  const CustomButtons({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onBtnPressed,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 50, vertical: verticalPadding ?? 20),
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: onBtnPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
