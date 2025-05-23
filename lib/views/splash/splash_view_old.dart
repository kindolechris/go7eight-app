// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_font.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_image.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_string.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/splash_controller.dart';

import '../../helpers/theme_helper.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: _body(),
    );
  }

  //Splash content
  _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppSize.appSize24),
            child: Image.asset(
              AppImage.appLogo,
              width: AppSize.appSize150,
              height: AppSize.appSize150,
            ),
          ),
           Text(
            AppString.primeSocialMedia,
            style: TextStyle(
              fontSize: AppSize.appSize28,
              fontWeight: FontWeight.w400,
              fontFamily: AppFont.appFontSevillanaRegular,
              color: themedColor(Get.context!, (c) => c.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
