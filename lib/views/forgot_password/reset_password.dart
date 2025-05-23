import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Title
              Text(
                'Reset your password',
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Subtitle
              Text(
                'To reset your password, it should comprise 8 characters, '
                'with at least one special character and one uppercase letter.',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.text2Color),
                    fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Password field
              _buildPasswordField(
                controller: _passwordController,
                label: 'Password',
                visible: passwordVisible,
                onToggle: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Confirm Password field
              _buildPasswordField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                visible: confirmPasswordVisible,
                onToggle: () {
                  setState(() {
                    confirmPasswordVisible = !confirmPasswordVisible;
                  });
                },
              ),
              const Spacer(),

              AppButton(
                onPressed: () {
                  _resetPasswordConfirmationBottomSheet(context);
                  // Get.toNamed(AppRoutes.loginView);
                },
                text: 'Reset password',
                backgroundColor: AppColor.supportColor,
                margin: const EdgeInsets.only(top: AppSize.appSize32),
              ),

              // Reset Password Button
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool visible,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !visible,
      style: TextStyle(
        color: themedColor(Get.context!, (c) => c.secondaryColor),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            TextStyle(color: themedColor(Get.context!, (c) => c.text2Color)),
        filled: true,
        fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
        suffixIcon: IconButton(
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            color: themedColor(Get.context!, (c) => c.text2Color),
          ),
          onPressed: onToggle,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themedColor(Get.context!, (c) => c.borderColor),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.supportColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _resetPasswordConfirmationBottomSheet(BuildContext context) {
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
                      child:
                          Text('Allow', style: TextStyle(color: Colors.white)),
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
