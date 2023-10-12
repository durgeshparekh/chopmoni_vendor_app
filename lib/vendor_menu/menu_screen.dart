import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:chopmoni_app/vendor_menu/create_menu_screen.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // if no menu found then display empty screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(menuImage),
            const SizedBox(height: 20),
            const Text(
              'Oops! You have no menu presently',
              style: TextStyle(color: blackTextColor),
            ),
            const SizedBox(height: 50),
            CustomButtons(
              text: 'Create Menu',
              buttonColor: blackTextColor,
              textColor: greenTextColor,
              onBtnPressed: () => Get.to(() => const CreateMenuScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
