
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import 'animated_alert_dialog.dart';

Future openAlertBox(
    {required BuildContext context,
    required Widget icon,
    required String buttonText,
    required String title,
    required void Function() buttonAction,
    required String description}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: AppColor.black.withOpacity(0.7),
      builder: (_) {
        return AnimatedAlertDialog(
          title: title,
          description: description,
          icon: icon,
          titleColor: AppColor.primary,
          buttonText: buttonText,
          buttonAction: buttonAction,
        );
      });
}

Future openAlertBoxDualButton(
    {required BuildContext context,
    required Widget icon,
    required String buttonText,
    required String button2Text,
    required String title,
    required void Function() buttonAction,
    required void Function() button2Action,
    required String description}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: AppColor.black.withOpacity(0.7),
      builder: (_) {
        return AnimatedAlertDialog(
          title: title,
          description: description,
          icon: icon,
          titleColor: AppColor.primary,
          buttonWidget: Row(
            children: [
              Expanded(
                child: AppButton(
                  action: buttonAction,
                  text: buttonText,
                  btnColor: Theme.of(context).brightness == Brightness.light
                      ? AppColor.textBlueGrey
                      : AppColor.grey,
                  primary: false,
                  txtColor: Theme.of(context).brightness == Brightness.light
                      ? AppColor.textBlueGrey
                      : AppColor.grey,
                ),
              ),
              AppRatioSpaces.horizontalSectionSpaceS(),
              Expanded(
                child: AppButton(
                  action: button2Action,
                  text: button2Text,
                ),
              ),
            ],
          ),
        );
      });
}
