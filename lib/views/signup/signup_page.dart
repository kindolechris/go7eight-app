import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_font.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../widget/app_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome Back! or Sign Up',
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontSize: AppSize.appSize28,
                  fontFamily: AppFont.appFontBold,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Log in or Signup to enjoy all services',
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                  fontSize: 16,
                  fontFamily: AppFont.appFontRegular,
                ),
              ),
              const SizedBox(height: 32),

              // ----------- Phone Number Field ----------
              IntlPhoneField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                      color: themedColor(Get.context!, (c) => c.text2Color)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: themedColor(Get.context!, (c) => c.borderColor)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.supportColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: themedColor(Get.context!, (c) => c.borderColor)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor:
                      themedColor(Get.context!, (c) => c.backgroundColor),
                ),
                initialCountryCode: 'TZ',
                keyboardType: TextInputType.phone,
                dropdownIcon: Icon(
                  Icons.arrow_drop_down,
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
                dropdownTextStyle: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),

              // ------------------------------------------
              const SizedBox(height: 24),

              AppButton(
                onPressed: () {
                  // Get.toNamed(AppRoutes.loginView);

                  Get.toNamed(AppRoutes.otpVerifyPhoneSignUp);
                },
                text: AppString.buttonTextNext,
                backgroundColor: AppColor.supportColor,
                margin: const EdgeInsets.only(top: AppSize.appSize32),
              ),

              const SizedBox(height: 24),

              Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.text2Color),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              _buildSocialButton(
                icon: Icons.g_mobiledata,
                text: 'Continue with Google',
                onTap: () {
                  Get.toNamed(AppRoutes.loginView);

                  // Get.toNamed(AppRoutes.otpVerifyPhoneSignUp);
                },
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.alternate_email,
                text: 'Continue with email',
                onTap: () {
                  Get.toNamed(AppRoutes.loginView);
                },
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.facebook,
                text: 'Continue with facebook',
                onTap: () {
                  Get.toNamed(AppRoutes.otpVerifyPhoneSignUp);
                },
              ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.apple,
                text: 'Continue with Apple',
                onTap: () {
                  Get.toNamed(AppRoutes.otpVerifyPhoneSignUp);
                },
              ),
              const SizedBox(height: 32),

              Center(
                child: Text.rich(
                  TextSpan(
                    text:
                        'By signing up or continuing, you agree to Go7eight’s ',
                    style: TextStyle(
                        fontSize: AppSize.appSize14,
                        fontWeight: FontWeight.bold,
                        color: themedColor(Get.context!, (c) => c.text2Color),
                       ),
                    children: [
                      TextSpan(
                        text: '[Terms of Service]',
                        style: const TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: '[Privacy Policy]',
                        style: const TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: themedColor(Get.context!, (c) => c.backgroundColor),
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon,
                color: themedColor(Get.context!, (c) => c.text2Color),
                size: AppSize.appSize28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.bold,
                    fontFamily: AppFont.appFontBold,
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: themedColor(Get.context!, (c) => c.text2Color),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
