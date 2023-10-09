import 'package:chopmoni_app/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var businessNameController = TextEditingController();
  var businessAddressController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();

  void createAccount() {
    if (registerFormKey.currentState!.validate()) {
      // Perform registration logic here
      // You can access the field values using _firstNameController.text, etc.
      Get.to(() => const DashboardScreen());
    }
  }

  void signInToAccount() {
    if (signInFormKey.currentState!.validate()) {
      // Perform registration logic here
      // You can access the field values using _firstNameController.text, etc.
      Get.to(() => const DashboardScreen());
    }
  }
}
