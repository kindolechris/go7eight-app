import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../widget/app_button.dart';

class OtpVerifyEmail extends StatelessWidget {
  const OtpVerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
                Text(
                'Verify your email address',
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
                Text(
                'Enter the 4-digit code we just sent to your email number ending in inn•••••gmail.com.',
                style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color),fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // 4 Digit OTP
             PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: themedColor(Get.context!, (c) => c.secondaryColor),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeFillColor:
                      themedColor(Get.context!, (c) => c.backgroundColor),
                  inactiveFillColor:
                      themedColor(Get.context!, (c) => c.backgroundColor),
                  selectedFillColor:
                      themedColor(Get.context!, (c) => c.backgroundColor),
                  activeColor: Colors.green,
                  selectedColor:
                      themedColor(Get.context!, (c) => c.secondaryColor),
                  inactiveColor: AppColor.supportColor,
                ),
                backgroundColor:
                    themedColor(Get.context!, (c) => c.backgroundColor),
                enableActiveFill: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              const SizedBox(height: 24),

              // Didn't receive code button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side:   BorderSide(color: themedColor(Get.context!, (c) => c.borderColor),),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child:   Text(
                    "I didn't receive the code",
                    style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor),),
                  ),
                ),
              ),
              const Spacer(),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.resetPasswordView);
                },
                text: 'Submit & Sign in',
                backgroundColor: AppColor.supportColor,
                margin: const EdgeInsets.only(top: AppSize.appSize32),
              ),
              // Submit & Sign in button

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }


}
