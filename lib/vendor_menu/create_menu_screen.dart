import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:chopmoni_app/controllers/menu_item_controller.dart';
import 'package:chopmoni_app/widgets/custom_border_text_field.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:chopmoni_app/widgets/custom_text_field.dart';
import 'package:chopmoni_app/widgets/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateMenuScreen extends StatelessWidget {
  const CreateMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MenuItemController());
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Create Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            // height: 250,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: controller.createMenuFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  CustomBorderTextField(
                    label: 'Name of Item',
                    inputType: TextInputType.emailAddress,
                    maxLength: 100,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name of item.';
                      }
                      controller.itemNameController.text = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomBorderTextField(
                    label: 'Price',
                    inputType: TextInputType.emailAddress,
                    maxLength: 100,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter price of item.';
                      }
                      controller.itemPriceController.text = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          uploadPhoto,
                          width: 70,
                          height: 70,
                        ),
                        const Text('Upload Photo')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomButtons(
            text: 'Add Item',
            buttonColor: blackTextColor,
            textColor: Colors.white,
            horizontalPadding: 150,
            onBtnPressed: () {},
          ),
        ],
      ),
    );
  }
}
