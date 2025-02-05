import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_export.dart';

class AuthBottomOptionSectionTerms extends StatelessWidget {
  final Function() onTermsAndPrivacyTap;
  final String preText;

  const AuthBottomOptionSectionTerms({
    super.key,
    required this.onTermsAndPrivacyTap,
    required this.preText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "$preText".tr, // Dynamic preText
            style: TextStyleX.subHeading3(context).copyWith(
              color: AppColor.black,
              fontSize: 13
            ),
            children: [
              TextSpan(
                text: " terms of service & privacy policy", // Combined clickable text
                style: TextStyleX.subHeading3(context).copyWith(
                  color: AppColor.black,
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTermsAndPrivacyTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
