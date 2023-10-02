import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:flutter/material.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _customButton(
                    text: 'Register',
                    buttonColor: blackTextColor,
                    textColor: greenTextColor,
                    onBtnPressed: () {},
                  ),
                  _customButton(
                    text: 'Sign In',
                    buttonColor: Colors.white,
                    textColor: blackTextColor,
                    onBtnPressed: () {},
                  )
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

  _customButton({
    required String text,
    required Color buttonColor,
    required Color textColor,
    required Function() onBtnPressed,
  }) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
