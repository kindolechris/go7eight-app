import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class ChallengeDrawerItem extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String label;
  final String value;
  final String unit;
  final bool? noPadding;

  const ChallengeDrawerItem(
      {super.key,
      required this.iconPath,
      required this.iconColor,
      required this.label,
      required this.value,
      required this.unit,
      this.noPadding});

  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      disableDefaultVPadding: true,
      disableDefaultHPadding: true,
      shadowOpacity: 0.06,
      borderRadius: noPadding == true ? 5 : 12,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical:
                noPadding == true ? 4 : AppRatioSize.getRatioHeight() / 240,
            horizontal: noPadding == true
                ? AppRatioSize.getRatioWidth() / 88
                : AppRatioSize.getRatioWidth() / 44),
        child: noPadding == true
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _itemIconImageSection(),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Flexible(flex: 4, child: _itemTextSection(context)),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(child: _itemIconImageSection()),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Flexible(flex: 4, child: _itemTextSection(context)),
                ],
              ),
      ),
    );
  }

  Widget _itemIconImageSection() {
    return noPadding == true
        ? Container(
            width: 46,
            height: 50,
            padding: const EdgeInsets.all(1.2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: iconColor.withOpacity(0.15)),
            child: Image.asset(
              iconPath,
              scale: 0.7,
            ),
          )
        : Container(
            padding: const EdgeInsets.all(1.2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: iconColor.withOpacity(0.15)),
            child: Image.asset(
              iconPath,
              width: AppRatioSize.getRatioHeight() / 34,
            ),
          );
  }

  Widget _itemTextSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(child: _itemTextSectionLabel(context)),
        Flexible(child: _itemTextSectionValue(context)),
      ],
    );
  }

  Widget _itemTextSectionLabel(BuildContext context) {
    return Text(
      label.tr,
      maxLines: 1,
      style: TextStyleX.body3(context).copyWith(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.lightBlueGrey
            : AppColor.lightBlueGrey,
      ),
    );
  }

  Widget _itemTextSectionValue(BuildContext context) {
    return Text.rich(
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyleX.subHeading3(context),
      TextSpan(
        children: [
          TextSpan(
            text: value.tr,
          ),
          TextSpan(
              text: ' $unit',
              style: TextStyle(fontSize: AppTextSizes.headerText3()))
        ],
      ),
    );
  }
}
