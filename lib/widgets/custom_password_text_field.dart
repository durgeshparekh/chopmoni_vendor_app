import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String label;
  final Function(String) validator;
  final TextInputType inputType;
  final int maxLength;

  const CustomPasswordTextField({
    super.key,
    required this.label,
    required this.validator,
    required this.inputType,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    var obscureText = true.obs;
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Obx(
        () => TextFormField(
          keyboardType: inputType,
          maxLength: maxLength,
          obscureText: obscureText.value,
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
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              icon: Icon(
                obscureText.isTrue ? Icons.visibility_off : Icons.visibility,
                color: Get.theme.colorScheme.onPrimary,
              ),
              onPressed: () => obscureText.toggle(),
            ),
          ),
          validator: (value) => validator(value!),
        ),
      ),
    );
  }
}
