
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';

class BottomNavAction extends StatelessWidget {
  final Function() action;
  final String actionText;
  const BottomNavAction({super.key, required this.action, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1)
                  : AppColor.white.withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: AppButton(
                action: action,
                text: actionText,
                fontSize: AppTextSizes.headerText1(),
                buttonWidth: double.infinity,
                boarderRadius: 8,
                txtColor: AppColor.white,
              )),
            ],
          ),
        ));
  }
}
