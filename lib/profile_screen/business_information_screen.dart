import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/controllers/profile_controller.dart';
import 'package:chopmoni_app/widgets/custom_border_text_field.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessInformationScreen extends StatelessWidget {
  const BusinessInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
        title: const Text(
          'Business Information',
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
                    key: controller.businessInfoFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
                          label: 'Business/Company Name',
                          inputType: TextInputType.name,
                          maxLength: 50,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your business/company name.';
                            }
                            controller.businessNameController.text = value;
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
                          label: 'Address',
                          inputType: TextInputType.streetAddress,
                          maxLength: 100,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your business/company address.';
                            }
                            controller.businessAddressController.text = value;
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        CustomBorderTextField(
                          label: 'CAC BN/RC Number',
                          inputType: TextInputType.emailAddress,
                          maxLength: 100,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your CAC BN/RC Number.';
                            }
                            controller.cacNumber.text = value;
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
                          label: 'Email (optional)',
                          inputType: TextInputType.name,
                          maxLength: 50,
                          validator: (value) {
                            controller.emailController.text = value;
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CustomBorderTextField(
                        label: 'Bank Name',
                        inputType: TextInputType.name,
                        maxLength: 50,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your bank name.';
                          }
                          controller.bankNameController.text = value;
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomBorderTextField(
                        label: 'Account Number',
                        inputType: TextInputType.number,
                        maxLength: 20,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your bank account number.';
                          }
                          controller.bankAccountNumberController.text = value;
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomButtons(
                  text: 'Update',
                  buttonColor: blackTextColor,
                  textColor: Colors.white,
                  onBtnPressed: controller.updateBusinessInfo,
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
