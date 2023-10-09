import 'dart:io';

import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:chopmoni_app/register_screen/register_screen.dart';
import 'package:chopmoni_app/sign_in_screen/sign_in_screen.dart';
import 'package:chopmoni_app/widgets/circle_icon_button.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(splashScreenImage),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'The Fastest Payment for Restaurants, Bars, Lounges, & Cafés',
                style: TextStyle(color: appGreyColor),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtons(
                        text: 'Register',
                        buttonColor: blackTextColor,
                        textColor: greenTextColor,
                        onBtnPressed: () =>
                            Get.to(() => const RegisterScreen()),
                      ),
                      CustomButtons(
                        text: 'Sign In',
                        buttonColor: Colors.white,
                        textColor: blackTextColor,
                        onBtnPressed: () => Get.to(() => const SignInScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text('or Continue with'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleIconButton(
                        icon: const Icon(FontAwesomeIcons.google),
                        onPressed: () {
                          // google login
                        },
                      ),
                      if (Platform.isIOS) const SizedBox(width: 30),
                      if (Platform.isIOS)
                        CircleIconButton(
                          icon: const Icon(FontAwesomeIcons.apple),
                          onPressed: () {
                            // apple login
                          },
                        ),
                    ],
                  ),
                ],
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
            )
          ],
        ),
      ),
    );
  }
}
