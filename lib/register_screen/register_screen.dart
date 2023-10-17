import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/controllers/auth_controller.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:chopmoni_app/widgets/custom_password_text_field.dart';
import 'package:chopmoni_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = AuthController();
    const sizedBox20 = SizedBox(height: 20.0);
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
        title: const Text(
          'Register',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Column(
              children: [
                Form(
                  key: controller.registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      sizedBox20,
                      CustomTextField(
                        label: 'First Name',
                        inputType: TextInputType.name,
                        maxLength: 50,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your first name.';
                          }
                          controller.firstNameController.text = value;
                          return null;
                        },
                      ),
                      sizedBox20,
                      CustomTextField(
                        label: 'Last Name',
                        inputType: TextInputType.name,
                        maxLength: 50,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your last name.';
                          }
                          controller.lastNameController.text = value;
                          return null;
                        },
                      ),
                      sizedBox20,
                      CustomTextField(
                        label: 'Email',
                        inputType: TextInputType.emailAddress,
                        maxLength: 100,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email.';
                          }
                          controller.emailController.text = value;
                          return null;
                        },
                      ),
                      sizedBox20,
                      CustomTextField(
                        label: 'Mobile Number',
                        inputType: TextInputType.phone,
                        maxLength: 15,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your mobile number.';
                          }
                          controller.mobileNumberController.text = value;
                          return null;
                        },
                      ),
                      sizedBox20,
                      CustomPasswordTextField(
                        label: 'Password',
                        inputType: TextInputType.visiblePassword,
                        maxLength: 15,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password.';
                          }
                          controller.passwordController.text = value;
                          return null;
                        },
                      ),
                      sizedBox20,
                      CustomTextField(
                        label: 'Busines/Company Name',
                        inputType: TextInputType.name,
                        maxLength: 100,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your business/company name.';
                          }
                          controller.businessNameController.text = value;
                          return null;
                        },
                      ),
                      sizedBox20,
                      CustomTextField(
                        label: 'Business Address',
                        inputType: TextInputType.streetAddress,
                        maxLength: 100,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your business address.';
                          }
                          controller.businessAddressController.text = value;
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomButtons(
                        text: 'Create My Account',
                        buttonColor: blackTextColor,
                        textColor: greenTextColor,
                        onBtnPressed: controller.createAccount,
                        horizontalPadding: 80,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
