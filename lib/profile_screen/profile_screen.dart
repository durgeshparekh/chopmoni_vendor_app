import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:chopmoni_app/dashboard/widgets/menu_list.dart';
import 'package:chopmoni_app/profile_screen/business_information_screen.dart';
import 'package:chopmoni_app/profile_screen/personal_information_screen.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: blackTextColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GridView(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 150,
              ),
              children: [
                MenuList(
                  text: 'Personal Information',
                  icon: const Icon(Icons.person, size: 70),
                  onPressed: () => Get.to(
                    () => const PersonalInformationScreen(),
                  ),
                ),
                MenuList(
                  text: 'Business Information',
                  icon: SvgPicture.asset(
                    businessInfo,
                    width: 70,
                    height: 70,
                  ),
                  onPressed: () =>
                      Get.to(() => const BusinessInformationScreen()),
                ),
              ],
            ),
          ),
          CustomButtons(
            text: 'Delete Profile',
            buttonColor: blackTextColor,
            textColor: Colors.red,
            onBtnPressed: () {
              //delete profile
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
