

import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';
import '../../../models/session_model.dart';
import 'bookmark_widget.dart';
import 'tag_list_horizontal_widget.dart';

class SessionColumnCardWidget extends StatelessWidget {
  final SessionModel session;
  final double width;
  const SessionColumnCardWidget(
      {super.key, required this.session, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                : AppColor.white.withOpacity(0.07),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          _sessionImageWidget(),
          AppRatioSpaces.verticalSectionSpaceXS(),
          Expanded(child: _sessionTextSection(context)),
        ],
      ),
    );
  }

  Widget _sessionImageWidget() {
    return Container(
      width: width,
      height: AppRatioSize.getRatioHeight() / 4.7,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.grey,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          AppNetworkImage(
            width: width,
            height: AppRatioSize.getRatioHeight() / 4.7,
            imagePath: "${session.imagePath}",
            borderRadius: 12,
          ),
          BookmarkWidget(id: session.id!)
        ],
      ),
    );
  }

  Widget _sessionTextSection(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _sessionTextTagsSection(context),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          _sessionTextTitleSection(context),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          _sessionTextInfoSection(context),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sessionTextPriceSection(context),
              _sessionTextRatingSection(context),
            ],
          ),
          AppRatioSpaces.verticalSectionSpaceXS(),
        ],
      ),
    );
  }

  Widget _sessionTextTagsSection(BuildContext context) {
    return TagListWidget(
      tags: session.tags!,
      disableDefaultHPadding: true,
    );
  }

  Widget _sessionTextTitleSection(BuildContext context) {
    return Text(
      "${session.title}".tr,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyleX.subHeading3(context),
    );
  }

  Widget _sessionTextInfoSection(BuildContext context) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.caloriesIcon,
            value: "${session.caloriesToBurn}",
            unit: "On sale"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        _textInfoWidget(context,
            iconPath: AppIcon.likeRed,
            value: "${session.duration}",
            unit: "200K"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        _textInfoWidget(context,
            iconPath: AppIcon.comment,
            value: "${session.duration}",
            unit: "1000K"),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: AppTextSizes.headerText(),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          unit,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _sessionTextPriceSection(BuildContext context) {
    return Row(
      children: [
        Text(
          "\TZS 50,000",
          textAlign: TextAlign.left,
          style:
              TextStyleX.header6(context).copyWith(color: AppColor.primary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _sessionTextRatingSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: AppColor.yellow,
          size: AppTextSizes.titleText6(),
        ),
        AppRatioSpaces.horizontalSectionSpaceS1(),
        Text(
          session.rating!.rating!.tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2BlueGrey(context)
              .copyWith(fontWeight: FontWeight.normal),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "(${session.rating!.totalCount!}+)".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context).copyWith(
              fontWeight: FontWeight.normal,
              fontSize: AppTextSizes.headerText4()),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
