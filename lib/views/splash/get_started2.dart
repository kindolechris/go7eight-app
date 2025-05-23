import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class GetStarted2Page extends StatelessWidget {
  const GetStarted2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_wave.png',
              width: AppSize.appSize400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.appSize20, vertical: AppSize.appSize40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                const Text(
                  'Scroll,\nTap, It’s Yours',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSize.appSize40),
                gradientText(
                  'If It’s Not\nDelivered,\nYou Get Full\nRefund',
                  AppSize.appSize46,
                ),
                const Spacer(flex: 3),
                Center(
                  child: AppButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.signUpView);
                    },
                    text: AppString.buttonTextGetStarted,
                    backgroundColor: AppColor.supportColor,
                    margin: const EdgeInsets.only(top: AppSize.appSize32),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gradientText(String text, double fontSize) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.purple, Colors.red, Colors.blue],
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1.2,
        ),
      ),
    );
  }
}
