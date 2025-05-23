import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../widget/app_button.dart';

class OtpVerifyEmailSignUp extends StatelessWidget {
  const OtpVerifyEmailSignUp({super.key});

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
              const Text(
                'Enter the 4-digit code we just sent to your email\nnumber ending in inn•••••gmail.com.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
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
                    side: BorderSide(
                        color: themedColor(Get.context!, (c) => c.borderColor)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "I didn't receive the code",
                    style: TextStyle(
                        color:
                            themedColor(Get.context!, (c) => c.secondaryColor)),
                  ),
                ),
              ),
              const Spacer(),
              AppButton(
                onPressed: () {
                  // Get.toNamed(AppRoutes.resetPasswordView);
                  _showConfirmationBottomSheet(context);
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

  void _showConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: themedColor(Get.context!, (c) => c.cardBackgroundColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Save your sign in info?',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontSize: AppSize.appSize15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.appSize16),
              Text(
                'We will save your sign Christian’s sign in info so you won’t need to\nenter it the next time you sign in.',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontSize: AppSize.appSize13),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: AppSize.appSize16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themedColor(
                            Get.context!, (c) => c.cardBackgroundColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.toNamed(AppRoutes.loginView);
                      },
                      child: const Text('Deny',
                          style: TextStyle(color: AppColor.supportColor)),
                    ),
                  ),
                  const SizedBox(width: AppSize.appSize12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.supportColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.offAllNamed(AppRoutes.buyerHomeView);
                      },
                      child: const Text('Allow',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
