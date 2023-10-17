import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/controllers/profile_controller.dart';
import 'package:chopmoni_app/widgets/custom_border_text_field.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
        title: const Text(
          'Personal Information',
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: controller.personalInfoFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
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
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
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
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
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
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
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
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
                          label: 'Sex (optional)',
                          inputType: TextInputType.name,
                          maxLength: 10,
                          validator: (value) {
                            controller.businessNameController.text = value;
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
                          label: 'Residential Address (optional)',
                          inputType: TextInputType.streetAddress,
                          maxLength: 100,
                          validator: (value) {
                            controller.businessAddressController.text = value;
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButtons(
                  text: 'Update',
                  buttonColor: blackTextColor,
                  textColor: Colors.white,
                  onBtnPressed: controller.updatePersonalInfo,
                  horizontalPadding: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
