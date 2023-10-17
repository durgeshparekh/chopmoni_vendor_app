import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final personalInfoFormKey = GlobalKey<FormState>();
  final businessInfoFormKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var businessNameController = TextEditingController();
  var businessAddressController = TextEditingController();
  var residentialAddressController = TextEditingController();
  var sexController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var cacNumber = TextEditingController();
  var bankNameController = TextEditingController();
  var bankAccountNumberController = TextEditingController();

  updatePersonalInfo() {
    // update personal info
  }

  updateBusinessInfo() {
    // update business info
  }
}
