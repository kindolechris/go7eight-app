
import 'package:go7eight/src/core/reusableComponents/app_status_bar.dart';

import '../../../../core/app_export.dart';
import '../../controllers/login_controller.dart';
import '../widget/auth_title_section.dart';

class ForgotPasswordView extends GetView<LoginController> {
  const ForgotPasswordView({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light ? AppColor.offWhite : AppColor
            .blackShade,
        appBar: appBarWithBackButton(),
        body: SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                child: Column(
                  children: [
                    AppRatioSpaces.appbarToTitle(),
                    const AuthTitleSection(
                      titleText: "forget_password_title",
                      subtitleText: "forget_password_subtitle"
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                controller.setResetToEmail();
                              },
                              child: Obx((){
                                return Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.5, // Increase the size of the radio button
                                      child: Radio<PasswordResetMethod>(
                                        value: PasswordResetMethod.email,
                                        groupValue: controller.passwordResetMethod.value,
                                        onChanged: (value) {
                                          controller.setResetToEmail();
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8), // Space between the radio and text
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Send OTP to Email',
                                            style: TextStyleX.header5(context)
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                          controller.emailTextController.value.text,
                                          style: TextStyleX.subHeading2(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              })
                          ),
                          const SizedBox(height: 20,),
                          InkWell(
                            onTap: () {
                              controller.setResetToPhone();
                            },
                            child: Obx((){
                              return Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.5, // Increase the size of the radio button
                                    child: Radio<PasswordResetMethod>(
                                      value: PasswordResetMethod.phone,
                                      groupValue: controller.passwordResetMethod.value,
                                      onChanged: (value) {
                                        controller.setResetToPhone();
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 8), // Space between the radio and text
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Send OTP to Phone',
                                          style: TextStyleX.header5(context)
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        '+255689252757',
                                        style: TextStyleX.subHeading2(context),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _bottomNavBarButton(),
      ),
    );
  }


  Widget _emailField(BuildContext context) {
    return AppTextField(
      labelText: "email_text".tr,
      hintText: "email_hint_text".tr,
      controller: controller.emailTextController.value,
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }
  _bottomNavBarButton(){
    return Container(
      margin: AppPaddings.bottomBarButton(),
      child: Hero(
        tag: "auth_button",
        child: AppButton(
          action: controller.sendCodeClick,
          text: "lbl_btn_send_code",
          fontSize: AppTextSizes.headerText(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
        ),
      ),
    );
  }
}