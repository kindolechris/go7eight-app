import 'package:go7eight/main.dart';
import 'package:go7eight/src/modules/auth/controllers/registration_controller.dart';

import '../../../../core/app_export.dart';
import '../../../../core/reusableComponents/app_progress_indicator.dart';
import '../../controllers/login_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widget/auth_bottom_option_section.dart';


class RegistrationEmailOtpVerification extends GetView<RegistrationController> {
  const RegistrationEmailOtpVerification({super.key});

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
        body: Obx((){
          return SafeArea(
            child: !controller.isLoading.value ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                  child: Column(
                    children: [
                      AppRatioSpaces.appbarToTitle(),
                      Hero(
                        tag: "auth_title",
                        child: Text("Email Verification",
                            style: TextStyleX.header2(context)
                        ),
                      ),
                      AppRatioSpaces.verticalSectionSpaceXS(),
                      Hero(
                          tag: "auth_sub_title",
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyleX.subHeading2(context).copyWith(
                                    color: Theme
                                        .of(context)
                                        .brightness == Brightness.light
                                        ? AppColor.lightBlueGrey
                                        : AppColor.creamColor,
                                    fontSize: AppTextSizes.headerText3()
                                ),
                                children: [
                                  TextSpan(
                                    text: "verification_code_subtitle".tr,
                                  ),
                                  TextSpan(
                                      style: TextStyleX.subHeading2(context).copyWith(
                                          color: AppColor.primary,
                                          fontSize: AppTextSizes.headerText3()
                                      ),
                                      text: storageInstance.read("email")
                                  )
                                ]
                            ),
                          )
                      ),
                      AppRatioSpaces.verticalSectionSpaceMF(),
                      _verificationPinField(context),
                      AppRatioSpaces.verticalSectionSpaceXXL(),
                    ],
                  ),
                ),
              ),
            ) : const Center(child: AppProgressIndicator()),
          );
        }),
        bottomNavigationBar: _bottomNavBarButton(),
      ),
    );
  }

  _bottomNavBarButton(){
    return Obx((){
      return Visibility(
        visible: !controller.isLoading.value,
        child: Container(
          margin: AppPaddings.bottomBarButton(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthBottomOptionSection(
                preText: "dont_rev_otp",
                actionText: "resent_otp",
                action: controller.onClickResend,
              ),
              AppRatioSpaces.verticalSectionSpaceM(),
            ],
          ),
        ),
      );
    });
  }

  Widget _verificationPinField(BuildContext context) {
    return SizedBox(
      width: AppRatioSize.getRatioWidth()/1.7,
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: AppColor.lightBlueGrey.withOpacity(0.1),
          activeColor: AppColor.textBlueGrey.withOpacity(0.1),
          selectedFillColor: AppColor.primary.withOpacity(0.1),
          selectedColor: AppColor.primary,
          inactiveColor: AppColor.textBlueGrey.withOpacity(0.1),
          inactiveFillColor: AppColor.lightBlueGrey.withOpacity(0.1),

        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light ? AppColor.offWhite : AppColor
            .blackShade,
        enableActiveFill: true,
        onCompleted: (v) {
          storageInstance.write("otp", v);
          controller.onVerifyEmailOtpClick(v);
        },
        onChanged: (value) {
        },
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}