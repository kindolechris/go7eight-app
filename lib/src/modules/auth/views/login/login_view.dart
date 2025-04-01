import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go7eight/main.dart';
import 'package:go7eight/src/core/reusableComponents/app_progress_indicator.dart';
import 'package:go7eight/src/modules/panels/student/root/bindings/root_binding.dart';
import '../../../../core/app_export.dart';
import '../../../../core/reusableComponents/app_country_code_picker.dart';
import '../../../../core/reusableComponents/app_status_bar.dart';
import '../../../panels/student/root/views/root_view.dart';
import '../../controllers/login_controller.dart';
import '../widget/auth_or_section.dart';
import '../widget/auth_title_section.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    print(storageInstance.read("accessToken"));
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
        body: SafeArea(
          child: Obx((){
            return !controller.isLoading.value ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AppBackButton(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppRatioSpaces.verticalSectionSpaceL(),
                            const AuthTitleSection(
                              titleText: "login_title",
                              subtitleText: "login_sub_title",
                            ),
                            Obx(() {
                              return _buildInputFields(context);
                            }),
                            AppRatioSpaces.verticalSectionSpaceM(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: controller.forgotPasswordClick,
                                  child: Text(
                                    "forget_password".tr,
                                    style: TextStyleX.subHeading2(context).copyWith(
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppRatioSpaces.verticalSectionSpaceM(),
                            Obx(() {
                              return AppButton(
                                isLoading: controller.isLoading.value,
                                action: () async {
                                  if (_formKey.currentState!.validate()) {
                                    var username = "";
                                    if(controller.inputType.value == LoginInputType.phone){
                                      username =  controller.selectedDialCode+ controller.phoneTextController.value.text;
                                    }else{
                                      username = controller.emailTextController.value.text;
                                    }
                                    var success =  await controller.loginClick(username,controller.passwordTextController.value.text);
                                    if(success){
                                      Get.off(()=>StudentRootView(),binding: RootBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
                                    }
                                  }
                                },
                                text: "lbl_btn_login",
                                fontSize: AppTextSizes.headerText(),
                                buttonWidth: double.infinity,
                                boarderRadius: 8,
                              );
                            }),
                            Obx((){
                              return  Visibility(
                                  visible: controller.canUseBiometric.value  && storageInstance.hasData("didSetFingerPrint"),
                                  child: Visibility(
                                      visible: storageInstance.read("didSetFingerPrint") == true,
                                      child: const AuthOrSection())
                              );
                            }),
                            AppRatioSpaces.verticalSectionSpaceM(),
                            _fingerPrint(context),
                            AppRatioSpaces.verticalSectionSpaceMF(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) : const Center(child: AppProgressIndicator());
          })
        ),
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Column(
      children: [
         AppRatioSpaces.verticalSectionSpaceM(),
         Visibility(
           visible: controller.inputType.value == LoginInputType.phone,
           child: Row(
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
                   ),
         ),
         Visibility(
            visible: controller.inputType.value == LoginInputType.email,
            child: _emailField(context)
        ),
        AppRatioSpaces.verticalSectionSpaceM(),
        _passwordField(context),
      ],
    );
  }

  Widget _passwordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.passwordTextController.value,
        hintText: "password_hint_text".tr,
        labelText: "password_text".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.passwordObscure.value,
        suffixIcon: controller.passwordObscure.value ? Icons
            .visibility_off_rounded : Icons.visibility_rounded,
        showSuffixIcon: true,
        suffixAction: controller.changeObscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password field is required';
          }
          return null;
        },
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
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
      hintText: "Enter Your Phone",
      showHintFormat: false,
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
  
  Widget _fingerPrint(BuildContext context){
    return Obx((){
      return Visibility(
        visible: controller.canUseBiometric.value && storageInstance.hasData("didSetFingerPrint"),
        child: Visibility(
          visible: storageInstance.read("didSetFingerPrint") == true,
          child: InkWell(
            radius: 100, // Sets the ripple radius
            onTap: () async {
              await controller.authenticateWithBiometric();
            },
            customBorder: const CircleBorder(), // Ensures the ripple follows a circular area
            child: Container(
              padding: const EdgeInsets.all(20), // Add padding to increase tappable area
              child: const Image(
                width: 60,
                height: 60,
                image: AssetImage(AppIcon.fingerPrint),
              ),
            ),
          ),
        ),
      );
    });
  }
}
