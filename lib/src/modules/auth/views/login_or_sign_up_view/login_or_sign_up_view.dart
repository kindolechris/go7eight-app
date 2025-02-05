import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go7eight/src/core/reusableComponents/app_full_screen_loader.dart';
import 'package:go7eight/src/core/reusableComponents/app_progress_indicator.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import '../../../../core/app_export.dart';
import '../../../../core/reusableComponents/app_country_code_picker.dart';
import '../../../../core/reusableComponents/app_status_bar.dart';
import '../../controllers/login_controller.dart';
import '../widget/auth_bottom_option_section_terms.dart';
import '../widget/auth_option_widget.dart';
import '../widget/auth_or_section.dart';
import '../widget/auth_title_section.dart';

class LoginOrSignUpView extends GetView<LoginController> {
  const LoginOrSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AppStatusBar(
      statusBarColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.offWhite
          : AppColor.blackShade,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      systemNavigationBarColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.offWhite
          : AppColor.blackShade,
      systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        body: Obx((){
          return SafeArea(
            child: !controller.isLoading.value ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AppRatioSpaces.verticalSectionSpaceL(),
                        const AuthTitleSection(
                          titleText: "login_or_sign_up_title",
                          subtitleText: "login_or_sign_up_sub_title",
                        ),
                        Obx(() {
                          return AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: _buildInputFields(context),
                            ),
                          );
                        }),
                        AppRatioSpaces.verticalSectionSpaceM(),
                        Obx(() {
                          return AppButton(
                            isLoading: controller.isLoading.value,
                            action: () async {
                              if (_formKey.currentState!.validate()) {
                                if(controller.inputType == LoginInputType.phone){
                                  final formattedPhone = PhoneNumber.parse("${controller.selectedDialCode}${controller.phoneTextController.value.text.startsWith("0") ? controller.phoneTextController.value.text.substring(1) : controller.phoneTextController.value.text}");
                                  final valid = formattedPhone.isValid();
                                  if(valid){
                                    controller.signUpClick();
                                  }
                                }else{
                                  controller.signUpClick();
                                }
                              }
                            },
                            text: "lbl_btn_continue",
                            fontSize: AppTextSizes.headerText(),
                            buttonWidth: double.infinity,
                            boarderRadius: 8,
                          );
                        }),
                        const AuthOrSection(),
                        Obx((){
                          return _buildSwitchButton();
                        }),
                        AppRatioSpaces.verticalSectionSpaceMF(),
                        buildGoogleAuthWidget(context),
                        buildAppleAuthWidget(context),
                        AppRatioSpaces.verticalSectionSpaceMF(),
                        AuthOptionWidget(
                          action: () {},
                          text: "continue_with_facebook",
                          iconPath: AppIcon.facebookIcon,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ) : const Center(
              child: AppProgressIndicator(
                message: "Please wait..",
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildGoogleAuthWidget(BuildContext context) {
    if (Platform.isAndroid) {
      return AuthOptionWidget(
        action: () async {
          await controller.authenticateWithGoogle();
        },
        text: "continue_with_google",
        iconPath: AppIcon.googleIcon,
      );
    }
    return const SizedBox.shrink();
  }

  Widget buildAppleAuthWidget(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return AuthOptionWidget(
        action: () {
          // Your sign in logic
        },
        text: "continue_with_apple",
        iconPath: AppIcon.appleIcon,
        iconColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.blackShade
            : AppColor.creamColor,
      );
    }
    return const SizedBox.shrink(); // Returns empty widget for non-Apple platforms
  }

  Widget _buildInputFields(BuildContext context) {
    if (controller.inputType.value == LoginInputType.email) {
      return Column(
        key: const ValueKey("email"), // Key for AnimatedSwitcher
        children: [
          _emailField(context),
        ],
      );
    } else if (controller.inputType.value == LoginInputType.phone) {
      return Row(
        key: const ValueKey("phone"), // Key for AnimatedSwitcher
        children: [
           Flexible(
             flex: 1,
             child: CountryCodePicker(
               onCountryCodeSelected: (countryCode) {
                 controller.setDialCode(countryCode);
                 controller.phoneTextController.value.clear();
               },
             ),
           ),
          const SizedBox(width: 10,),
          Flexible(
            flex: 2,
            child: Obx((){
              return _phoneField(context);
            }),
          )
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildSwitchButton() {
    if (controller.inputType.value == LoginInputType.phone) {
      return AuthOptionWidget(
        action: controller.switchToEmail,
        text: "continue_with_email",
        iconPath: AppIcon.emailIcon,
      );
    } else if (controller.inputType.value == LoginInputType.email) {
      return AuthOptionWidget(
        action: controller.switchToPhone,
        text: "continue_with_phone",
        iconPath: AppIcon.phoneIcon,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _emailField(BuildContext context) {
    return AppTextField(
      labelText: "email_text".tr,
      hintText: "email_hint_text".tr,
      controller: controller.emailTextController.value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email field is required';
        }

        if (!GetUtils.isEmail(value)) {
          return 'Please enter a valid email';
        }

        return null;
      },
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

  Widget _phoneField(BuildContext context) {
    return AppTextField(
      boxHeight: 15,
      labelText: "Phone",
      showLabel: false,
      hintText: "Enter your phone",
      showHintFormat: false,
      textInputType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone field is required';
        }
        return null;
      },
      controller: controller.phoneTextController.value,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

}
