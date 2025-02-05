import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/core/constants/ratio_size.dart';

class AppBackButton extends StatelessWidget {
  final Function()? action;
  const AppBackButton({super.key, this.action});

  void _hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () async {
          final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

          if (isKeyboardVisible) {
            _hideKeyboard(context);
            await Future.delayed(const Duration(milliseconds: 500));
          }

          if (action != null) {
            action!();
          } else {
            Get.back(closeOverlays: true);
          }
        },
        child: Container(
          padding: EdgeInsets.only(left: AppRatioSize.getRatioWidth()/44),
          width: AppRatioSize.getRatioWidth()/8,
          height: AppRatioSize.getRatioWidth()/8,
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.blackShade
                : AppColor.creamColor,
          ),
        ),
      ),
    );
  }
}