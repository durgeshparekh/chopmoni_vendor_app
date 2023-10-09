import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:chopmoni_app/controllers/auth_controller.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:chopmoni_app/widgets/custom_password_text_field.dart';
import 'package:chopmoni_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    const sizedBox20 = SizedBox(height: 20);
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              appLogo,
              height: 200,
            ),
            sizedBox20,
            Expanded(
              child: Form(
                key: controller.signInFormKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      label: 'Username',
                      inputType: TextInputType.emailAddress,
                      maxLength: 100,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your username.';
                        }
                        controller.usernameController.text = value;
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
                    const SizedBox(height: 40),
                    CustomButtons(
                      text: 'Continue',
                      buttonColor: blackTextColor,
                      textColor: greenTextColor,
                      onBtnPressed: controller.signInToAccount,
                      horizontalPadding: 100,
                    )
                  ],
                ),
              ),
            ),
            const Text(
              'CHOPMONI',
              style: TextStyle(
                color: blackTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Terms and Privacy Policy notice.',
              style: TextStyle(
                color: appGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
