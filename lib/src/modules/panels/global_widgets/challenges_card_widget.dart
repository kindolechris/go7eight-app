
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';
import '../../../models/challenge_model.dart';
import 'bookmark_widget.dart';
import 'challenge_card_drawer.dart';

class ChallengesCardWidget extends StatelessWidget {
  final ChallengeModel challenge;
  final double width;
  const ChallengesCardWidget(
      {super.key, required this.challenge, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 66, vertical: 4),
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
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            children: [
              _challengesImageWidget(),
              AppRatioSpaces.verticalSectionSpaceXS(),
              Expanded(child: _challengesTextSection(context)),
            ],
          ),
          ChallengeCardDrawer(
            parentWidth: width,
            challenge: challenge,
          ),
          Container(
              padding: const EdgeInsets.only(right: 6, top: 6),
              alignment: Alignment.topRight,
              child: BookmarkWidget(id: challenge.id!))
        ],
      ),
    );
  }

  Widget _challengesImageWidget() {
    return Container(
      width: width,
      height: AppRatioSize.getRatioHeight() / 4.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.grey,
      ),
      child: AppNetworkImage(
        width: width,
        height: AppRatioSize.getRatioHeight() / 4.2,
        imagePath: "${challenge.imagePath}",
        borderRadius: 12,
      ),
    );
  }

  Widget _challengesTextSection(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _challengesTrainerSection(context),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          _challengesTextTitleSection(context),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          const Spacer(),
          _challengesTextInfoSection(context),
          AppRatioSpaces.verticalSectionSpaceXS(),
        ],
      ),
    );
  }

  Widget _challengesTrainerSection(BuildContext context) {
    return Row(
      children: [
        AppNetworkImage(
            width: AppRatioSize.getRatioWidth() / 12,
            height: AppRatioSize.getRatioWidth() / 12,
            showBoarder: true,
            imagePath:
                "${challenge.trainer != null ? challenge.trainer!.imagePath : ""}"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${challenge.trainer != null ? challenge.trainer!.name : ""}"
                    .tr,
                textAlign: TextAlign.left,
                style: TextStyleX.subHeading2BlueGrey(context),
              ),
              Text(
                "${challenge.trainer != null ? challenge.trainer!.type : ""}"
                    .tr,
                textAlign: TextAlign.left,
                style: TextStyleX.subHeading6(context).copyWith(
                  color: AppColor.lightBlueGrey,
                ),
              ),
            ],
          ),
        ),
        _challengesTextPriceSection(context)
      ],
    );
  }

  Widget _challengesTextTitleSection(BuildContext context) {
    return Text(
      "${challenge.title}".tr,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyleX.subHeading3(context),
    );
  }

  Widget _challengesTextInfoSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              iconPath: AppIcon.challengesMemberIcon,
              value: "${challenge.totalMembers}",
              unit: ""),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              iconPath: AppIcon.challengesRatingIcon,
              value: "${challenge.rating!.rating}",
              unit: "(${challenge.rating!.totalCount})+"),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              iconPath: AppIcon.challengesTimeIcon,
              value: "${challenge.timeRange}",
              unit: "min"),
        ),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            width: AppTextSizes.titleText8(),
            height: AppTextSizes.titleText8(),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text.rich(
            textAlign: TextAlign.center,
            style: TextStyleX.subHeading2BlueGrey(context),
            maxLines: 1,
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                ),
                TextSpan(
                    text: ' $unit'.tr, style: TextStyleX.subHeading2(context))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _challengesTextPriceSection(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$${challenge.price}".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.header1(context).copyWith(
            color: AppColor.primary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
