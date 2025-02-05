
import 'package:go7eight/main.dart';
import 'package:go7eight/src/core/reusableComponents/app_date_picker.dart';
import 'package:go7eight/src/core/reusableComponents/app_progress_indicator.dart';
import 'package:go7eight/src/models/user.dart';
import 'package:go7eight/src/modules/auth/views/widget/auth_bottom_option_section_terms.dart';

import '../../../../core/app_export.dart';
import '../../../../core/reusableComponents/app_drop_down_text.dart';
import '../../controllers/registration_controller.dart';
import '../widget/auth_title_section.dart';

class RegistrationNicknamePasssowrdView extends GetView<RegistrationController> {
  RegistrationNicknamePasssowrdView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light ? AppColor.offWhite : AppColor
          .blackShade,
      appBar: appBarWithBackButton(

      ),
      body: Obx((){
        return SafeArea(
          child: !controller.isLoading.value ? SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppRatioSpaces.appbarToTitle(),
                      const AuthTitleSection(
                        titleText: "Almost done!",
                        subtitleText: "Fill in your nickname and credentials",
                      ),
                      AppRatioSpaces.titleToNext(),
                      _formSectionTwo(context),
                      AppRatioSpaces.verticalSectionSpaceXXL(),
                    ],
                  ),
                ),
              ),
            ),
          ) :  const Center(child: AppProgressIndicator()),
        );
      }),
      bottomNavigationBar: _bottomNavBarButton(),
    );
  }

  _formSectionTwo(BuildContext context){
    return Column(
      children: [
        _nickNameField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _passwordField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _confirmPasswordField(context),
        AppRatioSpaces.verticalSectionSpaceMF(),
      ],
    );
  }

  Widget _nickNameField(BuildContext context) {
    return AppTextField(
      labelText: "Nickname",
      hintText: "Enter your nickname",
      showHintFormat: false,
      textInputType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nick name field is required';
        }
        return null;
      },
      controller: controller.nickNameTextController,
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

  Widget _passwordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.passwordTextController,
        hintText: "password_hint_text".tr,
        labelText: "password_text".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.passwordObscure.value,
        suffixIcon: controller.passwordObscure.value?Icons.visibility_off_rounded:Icons.visibility_rounded,
        showSuffixIcon: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password field is required';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
        suffixAction: controller.changePasswordObscure,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  Widget _confirmPasswordField(BuildContext context) {
    return Obx(() {
      return AppTextField(
        controller: controller.confirmPasswordTextController,
        hintText: "confirm_password_hint_text".tr,
        labelText: "confirm_password_text".tr,
        textInputType: TextInputType.visiblePassword,
        obscureText: controller.confirmPasswordObscure.value,
        suffixIcon: controller.confirmPasswordObscure.value? Icons.visibility_off_rounded:Icons.visibility_rounded,
        showSuffixIcon: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Confirm password field is required';
          } else if (value != controller.passwordTextController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        suffixAction: controller.changeConfirmPasswordObscure,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  _bottomNavBarButton(){
    return SafeArea(
      child: Container(
        margin: AppPaddings.bottomBarButton(),
        child: Hero(
            tag: "auth_button",
            child: Obx((){
              return Visibility(
                visible: !controller.isLoading.value,
                child: AppButton(
                  action: (){
                    if (formKey.currentState!.validate()) {
                      controller.registerUser();
                    }
                  },
                  text: "Finish",
                  fontSize: AppTextSizes.headerText(),
                  buttonWidth: double.infinity,
                  boarderRadius: 8,
                  enabled: controller.isForm2Valid.value,
                ),
              );
            })
        ),
      ),
    );
  }
}