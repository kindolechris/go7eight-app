import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:local_auth/local_auth.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_font.dart';

import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appBackgroundColor,
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 40),
                Text(
                AppString.titleTextSignIn,
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontSize: 28,
                  fontFamily: AppFont.appFontRegular  ,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
                Text(
                'Log in or Signup to enjoy all services',
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                  fontSize: 16,fontFamily: AppFont.appFontRegular  ,
                ),
              ),
              const SizedBox(height: 32),

              // Mobile Number Field
              _buildTextField(),
              const SizedBox(height: 16),

              // Password Field
              _buildPasswordField(),

              const SizedBox(height: 8),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.yourAccountView);
                  },
                  child:   Text(
                    AppString.forgotPassword,
                    style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color)),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sign In Button
              AppButton(
                onPressed: () {
                  // Get.toNamed(AppRoutes.welcomeView);
                  Get.offAllNamed(AppRoutes.buyerHomeView);
                },
                text: AppString.buttonTextLogIn,
                backgroundColor: AppColor.supportColor,
                margin: const EdgeInsets.only(top: AppSize.appSize32),
              ),

              const SizedBox(height: 24),
               Center(
                child: Text(
                  'OR',
                  style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
                ),
              ),
              const SizedBox(height: 24),

              // Fingerprint Icon
              Center(
                child: IconButton(
                  onPressed: () async {
                    final LocalAuthentication auth = LocalAuthentication();

                    final bool canAuthenticate =
                        await auth.canCheckBiometrics ||
                            await auth.isDeviceSupported();

                    if (canAuthenticate) {
                      try {
                        final bool didAuthenticate = await auth.authenticate(
                          localizedReason: 'Please authenticate to log in',
                          options: const AuthenticationOptions(
                            biometricOnly: true,
                            stickyAuth: true,
                          ),
                        );

                        if (didAuthenticate) {
                          // Proceed to home or dashboard
                          Get.offAllNamed(AppRoutes.buyerHomeView);
                        }
                      } catch (e) {
                        print('Error using biometric auth: $e');
                      }
                    } else {
                      Get.snackbar('Unavailable',
                          'Biometric authentication not supported on this device',
                          backgroundColor: AppColor.supportColor, colorText: themedColor(Get.context!, (c) => c.secondaryColor));
                    }
                  },
                  icon:   Icon(Icons.fingerprint,
                      size: 64, color: themedColor(Get.context!, (c) => c.secondaryColor)),
                ),
              ),
              const SizedBox(height: 24),

              // Terms of Service
              Center(
                child: Text.rich(
                  TextSpan(
                    text:
                        'By signing up or continuing, you agree to Go7eight’s ',
                    style: TextStyle(
                        fontSize: AppSize.appSize14,
                        fontFamily: AppFont.appFontRegular  ,
                        color: themedColor(Get.context!, (c) => c.text2Color),
                       ),
                    children: [
                      TextSpan(
                        text: '[Terms of Service]',
                        style: const TextStyle(
                            fontSize: AppSize.appSize13,
                            color: AppColor.primaryColor,fontFamily: AppFont.appFontRegular  ,
                            decoration: TextDecoration.underline),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: '[Privacy Policy]',
                        style: const TextStyle(
                            fontSize: AppSize.appSize13,
                            color: AppColor.primaryColor,fontFamily: AppFont.appFontRegular  ,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return IntlPhoneField(
      style:
          TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle:
            TextStyle(color: themedColor(Get.context!, (c) => c.text2Color)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themedColor(Get.context!, (c) => c.borderColor)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.supportColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: themedColor(Get.context!, (c) => c.borderColor)),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
      ),
      initialCountryCode: 'TZ', // Tanzania
      controller: _mobileController,
      keyboardType: TextInputType.phone,
      dropdownIcon: Icon(
        Icons.arrow_drop_down,
        color: themedColor(Get.context!, (c) => c.text2Color),
      ),
      dropdownTextStyle: TextStyle(
        color: themedColor(Get.context!, (c) => c.text2Color),
      ),
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: !passwordVisible,
      style:
          TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle:
            TextStyle(color: themedColor(Get.context!, (c) => c.text2Color)),
        filled: true,
        fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: themedColor(Get.context!, (c) => c.text2Color)),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themedColor(Get.context!, (c) => c.borderColor)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.supportColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: themedColor(Get.context!, (c) => c.borderColor)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
