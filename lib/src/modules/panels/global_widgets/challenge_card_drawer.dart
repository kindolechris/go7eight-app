import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../models/challenge_model.dart';
import 'challenge_drawer_item_widget.dart';

class ChallengeCardDrawer extends StatefulWidget {
  final double parentWidth;
  final ChallengeModel challenge;

  const ChallengeCardDrawer(
      {super.key, required this.parentWidth, required this.challenge});

  @override
  State<ChallengeCardDrawer> createState() => _ChallengeCardDrawerState();
}

class _ChallengeCardDrawerState extends State<ChallengeCardDrawer> {
  double widthC = 0;
  bool showBackButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.parentWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          widthC > 0 ? _blurBackgroundWidget() : Container(),
          widthC < 30 && showBackButton == false
              ? _expandDrawerButton()
              : Container(),
          _drawerBodyWidget()
        ],
      ),
    );
  }

  Widget _blurBackgroundWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          widthC = 0;
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              showBackButton = false;
            });
          });
        });
      },
      child: Container(
        width: widget.parentWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _expandDrawerButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          widthC = AppRatioSize.getRatioWidth() / 1.8;
          Future.delayed(const Duration(milliseconds: 250), () {
            setState(() {
              showBackButton = true;
            });
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: EdgeInsets.only(bottom: AppRatioSize.getRatioHeight() / 38),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width),
            color: AppColor.primary),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColor.white,
          size: AppRatioSize.getRatioHeight() / 48,
        ),
      ),
    );
  }

  Widget _drawerBodyWidget() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        _drawerBodyContainer(),
        showBackButton && widthC > AppRatioSize.getRatioWidth() / 2.2
            ? _collapseDrawerButton()
            : Container()
      ],
    );
  }

  Widget _drawerBodyContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: widthC,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.blackShade),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _challengesTextTagsSection(context),
            AppRatioSpaces.verticalSectionSpaceXS(),
            const Flexible(
              child: ChallengeDrawerItem(
                  iconPath: AppIcon.challengesDurationIcon,
                  iconColor: AppColor.lightBlueGrey,
                  label: "challenge_card_day",
                  value: "30",
                  unit: "days"),
            ),
            AppRatioSpaces.verticalSectionSpaceXS(),
            const Flexible(
              child: ChallengeDrawerItem(
                  iconPath: AppIcon.challengesFocusIcon,
                  iconColor: AppColor.appBrown,
                  label: "challenge_card_workout",
                  value: "Full Body",
                  unit: ""),
            ),
            AppRatioSpaces.verticalSectionSpaceXS(),
            const Flexible(
              child: ChallengeDrawerItem(
                  iconPath: AppIcon.challengesTypeIcon,
                  iconColor: AppColor.lightBlueGrey,
                  label: "challenge_card_workout_type",
                  value: "Gym",
                  unit: ""),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Widget _collapseDrawerButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          widthC = 0;
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              showBackButton = false;
            });
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: EdgeInsets.only(
            bottom: AppRatioSize.getRatioHeight() / 38,
            right: widthC > 20 ? widthC - 20 : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width),
            color: AppColor.primary),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColor.white,
          size: AppRatioSize.getRatioHeight() / 48,
        ),
      ),
    );
  }

  Widget _challengesTextTagsSection(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 48,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.primary.withOpacity(0.20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 88,
                ),
                margin:
                    EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 66),
                alignment: Alignment.center,
                child: Text(
                  "Type$index".tr,
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading6(context).copyWith(
                    color: AppColor.primary,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
    );
  }
}
