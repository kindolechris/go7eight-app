
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../models/challenge_model.dart';

class TrainerContainer extends StatelessWidget {
  final TrainerModel trainer;
  final Function()? onClickAction;
  final bool isHorizontal;
  final bool isVerified;
  final bool showActionButton;
  final double? imageBorderRadius;
  final double? imageSize;
  final IconData? icon;
  final Color? iconBgColor;
  final Color? iconColor;
  final double? iconSize;

  const TrainerContainer({super.key,
    required this.trainer,
    this.onClickAction,
    this.isHorizontal = false,
    this.isVerified = true,
    this.showActionButton = false,
    this.imageBorderRadius,
    this.imageSize,
    this.icon = Icons.arrow_forward_ios_rounded,
    this.iconBgColor = AppColor.primary,
    this.iconColor = AppColor.white,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppRatioSize.getRatioWidth() / 24,
          right: isHorizontal
              ? AppRatioSize.getRatioWidth() / 88
              : AppRatioSize.getRatioWidth() / 24,
          bottom: AppRatioSize.getRatioHeight() / 66),
      child: GestureDetector(
        onTap: onClickAction,
        child: AppContainerWidget(
            child: Row(
          children: [
            AppNetworkImage(
                width: imageSize ?? AppRatioSize.getRatioWidth() / 6,
                height: imageSize ?? AppRatioSize.getRatioWidth() / 6,
                showBoarder: false,
                borderRadius: imageBorderRadius ?? 8,
                imagePath: "${trainer.imagePath}"),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: isHorizontal
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${trainer.name}".tr,
                        textAlign: TextAlign.left,
                        style: TextStyleX.subHeading3(context),
                      ),
                      isVerified
                          ? Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: Image.asset(AppIcon.verifiedIcon),
                            )
                          : Container()
                    ],
                  ),
                  Text(
                    "${trainer.type}".tr,
                    textAlign: TextAlign.left,
                    style: TextStyleX.subHeading2(context),
                  ),
                ],
              ),
            ),
            showActionButton
                ? GestureDetector(
                    onTap: onClickAction,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width),
                          color: iconBgColor),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: iconSize ?? AppRatioSize.getRatioWidth() / 32,
                      ),
                    ),
                  )
                : Container()
          ],
        )),
      ),
    );
  }
}
