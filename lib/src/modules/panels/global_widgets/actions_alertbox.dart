
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import 'animated_alert_dialog.dart';

Future actionsAlertBox(
    {required BuildContext context,
    required Widget icon,
    required Widget buttonWidget,
    required String title,
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
          buttonWidget: buttonWidget,
        );
      });
}
