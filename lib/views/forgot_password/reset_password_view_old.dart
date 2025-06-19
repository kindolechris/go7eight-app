// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/forgot_password/reset_password_controller.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';
import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_icon.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../widget/app_button.dart';
import '../../widget/app_textfield.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);

  ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  //Reset password content
  _appBar() {
    return AppBar(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSize.appSize20),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(AppIcon.back),
        ),
      ),
      leadingWidth: AppSize.appSize44,
    );
  }

  _body() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: AppSize.appSize20,
        right: AppSize.appSize20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
            padding: EdgeInsets.only(top: AppSize.appSize24),
            child: Text(
              AppString.resetYourPassword,
              style: TextStyle(
                fontSize: AppSize.appSize24,
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.appFontBold,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: AppSize.appSize8),
            child: Text(
              AppString.resetYourPasswordString,
              style: TextStyle(
                fontSize: AppSize.appSize16,
                fontWeight: FontWeight.w400,
                fontFamily: AppFont.appFontRegular,
                color: themedColor(Get.context!, (c) => c.text2Color),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.appSize24),
            child: Obx(() => AppTextField(
              controller: resetPasswordController.passwordController,
              labelText: AppString.password,
              keyboardType: TextInputType.text,
              cursorColor: themedColor(Get.context!, (c) => c.secondaryColor),
              fillColor: themedColor(Get.context!, (c) => c.cardBackgroundColor),
              obscureText: resetPasswordController.isPasswordVisible.value,
              textInputAction: TextInputAction.next,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: AppSize.appSize16),
                child: GestureDetector(
                  onTap: () {
                    resetPasswordController.togglePasswordVisibility();
                  },
                  child: Image.asset(
                    resetPasswordController.isPasswordVisible.value
                        ? AppIcon.eyeClose : AppIcon.eyeOpen,
                  ),
                ),
              ),
              suffixIconColor: themedColor(Get.context!, (c) => c.text2Color),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: AppSize.appSize38,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.appSize24),
            child: Obx(() => AppTextField(
              controller: resetPasswordController.confirmPasswordController,
              labelText: AppString.confirmPassword,
              keyboardType: TextInputType.text,
              cursorColor: themedColor(Get.context!, (c) => c.secondaryColor),
              fillColor: themedColor(Get.context!, (c) => c.cardBackgroundColor),
              obscureText: resetPasswordController.isConfirmPasswordVisible.value,
              textInputAction: TextInputAction.done,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: AppSize.appSize16),
                child: GestureDetector(
                  onTap: () {
                    resetPasswordController.toggleConfirmPasswordVisibility();
                  },
                  child: Image.asset(
                    resetPasswordController.isConfirmPasswordVisible.value
                        ? AppIcon.eyeClose : AppIcon.eyeOpen,
                  ),
                ),
              ),
              suffixIconColor: themedColor(Get.context!, (c) => c.text2Color),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: AppSize.appSize38,
              ),
            )),
          ),
          AppButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.loginView);
            },
            text: AppString.buttonTextResetPassword,
            backgroundColor: AppColor.primaryColor,
            margin: const EdgeInsets.only(top: AppSize.appSize32),
          ),
        ],
      ),
    );
  }
}
