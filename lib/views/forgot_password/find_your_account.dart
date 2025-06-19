import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_font.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class FindYourAccount extends StatelessWidget {
  const FindYourAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    // Title
                    Text(
                      "Let's find your account",
                      style: TextStyle(
                        color:
                            themedColor(Get.context!, (c) => c.secondaryColor),
                        fontSize: AppSize.appSize26,
                        fontFamily: AppFont.appFontBold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      'Select verification method, and we will send you confirmation code.',
                      style: TextStyle(
                          color: themedColor(Get.context!, (c) => c.text2Color),
                          fontSize: 16),
                    ),
                    const SizedBox(height: 32),

                    // Email input field
                    _buildInputField(
                      label: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),

                    // OR
                    Center(
                      child: Text('OR',
                          style: TextStyle(
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          )),
                    ),
                    const SizedBox(height: 24),

                    // Phone input field
                    _buildInputField(
                      label: 'Phone',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 24),

                    // Next Button
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.otpVerifyEmail);
                  },
                  text: AppString.buttonTextNext,
                  backgroundColor: AppColor.supportColor,
                  margin: const EdgeInsets.only(top: AppSize.appSize32),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: themedColor(Get.context!, (c) => c.secondaryColor),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: themedColor(Get.context!, (c) => c.text2Color),
        ),
        filled: true,
        fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themedColor(Get.context!, (c) => c.borderColor),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.supportColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
