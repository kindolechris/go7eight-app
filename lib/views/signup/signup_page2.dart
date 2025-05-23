import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_string.dart';

import '../../config/app_image.dart';
import '../../config/app_size.dart';
import '../../controller/theme_controller.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? selectedGender;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickDateOfBirth() async {

    DateTime tempPickedDate = DateTime(2000, 1, 1);
    DateTime? finalPickedDate;

    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          color: themedColor(Get.context!, (c) => c.backgroundColor),
          child: Column(
            children: [
              // Wrap the picker inside CupertinoTheme
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                      brightness:
                          Theme.of(context).brightness == Brightness.dark
                              ? Brightness.dark
                              : Brightness.light),
                  child: CupertinoDatePicker(
                    backgroundColor:
                        themedColor(Get.context!, (c) => c.backgroundColor),
                    initialDateTime: tempPickedDate,
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime newDate) {
                      tempPickedDate = newDate;
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        color: themedColor(Get.context!, (c) => c.text2Color),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      finalPickedDate = tempPickedDate;
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'SET',
                      style: TextStyle(color: AppColor.supportColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (finalPickedDate != null) {
      setState(() {
        _dobController.text =
            DateFormat('dd MMMM yyyy').format(finalPickedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    AppImage.appLogo, // Your app logo
                    height: AppSize.appSize150,
                    width: AppSize.appSize150,
                  ),
                  const SizedBox(height: 12),
                  // const Text(
                  //   AppString.primeSocialMedia,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 28,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            _buildTextField(
                controller: _firstNameController, label: 'First Name'),
            const SizedBox(height: 12),
            _buildTextField(
                controller: _lastNameController, label: 'Last Name'),
            const SizedBox(height: 12),

            // Gender dropdown
            _buildDropdown(),

            const SizedBox(height: 12),
            _buildTextField(controller: _usernameController, label: 'Username'),
            const SizedBox(height: 12),

            // Date of Birth picker
            _buildDatePicker(),

            const SizedBox(height: 12),
            _buildTextField(
                controller: _emailController,
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),

            _buildPasswordField(
                controller: _passwordController,
                label: 'Password',
                isVisible: passwordVisible,
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                }),
            const SizedBox(height: 12),

            _buildPasswordField(
                controller: _confirmPasswordController,
                label: 'Confirm password',
                isVisible: confirmPasswordVisible,
                onTap: () {
                  setState(() {
                    confirmPasswordVisible = !confirmPasswordVisible;
                  });
                }),

            const SizedBox(height: 12),
            AppButton(
              onPressed: () {
                // Get.toNamed(AppRoutes.otpVerifyPhoneSignUp);
                Get.toNamed(AppRoutes.otpVerifyEmailSignUp);
              },
              text: AppString.buttonTextSignUp,
              backgroundColor: AppColor.supportColor,
              margin: const EdgeInsets.only(top: AppSize.appSize32),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      style:
          TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: themedColor(Get.context!, (c) => c.text2Color),
        ),
        filled: true,
        fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themedColor(Get.context!, (c) => c.borderColor)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.supportColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.backgroundColor),
        border:
            Border.all(color: themedColor(Get.context!, (c) => c.borderColor)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: themedColor(Get.context!, (c) => c.backgroundColor),
        value: selectedGender,
        hint: Text(
          'Select gender',
          style: TextStyle(
            color: themedColor(Get.context!, (c) => c.text2Color),
          ),
        ),
        style: TextStyle(
          color: themedColor(Get.context!, (c) => c.secondaryColor),
        ),
        iconEnabledColor: themedColor(Get.context!, (c) => c.secondaryColor),
        items: ['Male', 'Female'].map((gender) {
          return DropdownMenuItem(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedGender = value;
          });
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: _pickDateOfBirth,
      child: AbsorbPointer(
        child: TextField(
          controller: _dobController,
          style: TextStyle(
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
          decoration: InputDecoration(
            labelText: 'Date of birth',
            labelStyle: TextStyle(
              color: themedColor(Get.context!, (c) => c.text2Color),
            ),
            filled: true,
            fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
            suffixIcon: Icon(
              Icons.calendar_today,
              color: themedColor(Get.context!, (c) => c.text2Color),
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
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      {required TextEditingController controller,
      required String label,
      required bool isVisible,
      required VoidCallback onTap}) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      style: TextStyle(
        color: themedColor(Get.context!, (c) => c.secondaryColor),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: themedColor(Get.context!, (c) => c.text2Color),
        ),
        filled: true,
        fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: themedColor(Get.context!, (c) => c.text2Color),
          ),
          onPressed: onTap,
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
}
