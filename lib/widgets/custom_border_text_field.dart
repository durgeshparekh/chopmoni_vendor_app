import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:flutter/material.dart';

class CustomBorderTextField extends StatelessWidget {
  final String label;
  final Function(String) validator;
  final TextInputType inputType;
  final int maxLength;
  final Widget? suffixIcon;

  const CustomBorderTextField({
    super.key,
    required this.label,
    required this.validator,
    required this.inputType,
    required this.maxLength,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        keyboardType: inputType,
        maxLength: maxLength,
        buildCounter: (
          context, {
          currentLength = 0,
          isFocused = false,
          maxLength,
        }) {
          return const SizedBox();
        },
        cursorColor: greenTextColor,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: blackTextColor),
          border: InputBorder.none, // Remove the default border
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          suffixIcon: suffixIcon,
        ),
        validator: (value) => validator(value!),
      ),
    );
  }
}
