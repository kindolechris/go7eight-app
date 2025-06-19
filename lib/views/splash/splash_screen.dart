import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_image.dart';

import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../controller/splash_controller.dart';
import '../../helpers/theme_helper.dart'; // Your appBackgroundColor

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor), 
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                AppImage.appLogo,
                width: AppSize.appSize150,
                height: AppSize.appSize150,
              ),
              const SizedBox(height: 24),

              // App Name
              // const Text(
              //   AppString.primeSocialMedia,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 1.2,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
