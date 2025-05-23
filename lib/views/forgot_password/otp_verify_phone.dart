import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class OtpVerifyPhone extends StatelessWidget {
  const OtpVerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Verify your phone number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Enter the 4-digit code we just sent to your phone\nnumber ending in +2557••••517.',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    PinCodeTextField(
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      cursorColor:
                          themedColor(Get.context!, (c) => c.secondaryColor),
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
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: const BorderSide(color: Colors.white30),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "I didn't receive the code",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.resetPasswordView);
                  },
                  text: 'Verify',
                  backgroundColor: AppColor.supportColor,
                  margin: const EdgeInsets.only(top: AppSize.appSize32),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
