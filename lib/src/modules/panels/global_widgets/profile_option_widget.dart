
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/app_export.dart';
import '../../../models/profile_option_model.dart';

class ProfileOptionWidget extends StatelessWidget {
  final ProfileOptionModel option;
  final bool isLast;
  final Widget rightWidget;
  const ProfileOptionWidget(
      {super.key, required this.option, required this.isLast, required this.rightWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        option.action!();
      },
      child: Container(
        width: Get.width,
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 44,
                  vertical: AppRatioSize.getRatioHeight() / 250),
              child: Row(
                children: [
                  Image.asset(
                    option.iconPath!,
                    fit: BoxFit.contain,
                    scale: 1.8,
                  ),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Text(
                    "${option.name}".tr,
                    textAlign: TextAlign.start,
                    style: TextStyleX.subHeading2BlueGrey(context),
                  ),
                  option.notificationCount != null
                      ? Row(
                        children: [
                          AppRatioSpaces.horizontalSectionSpaceXXS(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              "${option.notificationCount}".tr,
                              textAlign: TextAlign.start,
                              style: TextStyleX.subHeading2BlueGrey(context)
                                  .copyWith(
                                color: AppColor.white,
                              ),
                            ),
                          )
                        ],
                      )
                      : Container(),
                  const Spacer(),
                  Container(child: rightWidget)
                ],
              ),
            ),
            isLast
                ? Container()
                : Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 88),
                    child: Divider(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.offWhite
                          : AppColor.blackShade,
                      thickness: 1,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
