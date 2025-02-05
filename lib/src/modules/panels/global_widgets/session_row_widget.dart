import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_export.dart';
import '../../../models/session_model.dart';
import 'bookmark_widget.dart';

class SessionRowCardWidget extends StatelessWidget {
  final SessionModel session;
  final double width;
  const SessionRowCardWidget(
      {super.key, required this.session, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppRatioSize.getRatioHeight() / 8,
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
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              _sessionImageWidget(context),
              AppRatioSpaces.horizontalSectionSpaceXXS(),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppRatioSize.getRatioHeight() / 88),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _sessionTextSection(context),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sessionTextPriceSection(context),
                        _sessionTextRatingSection(context),
                      ],
                    ),
                  ],
                ),
              )),
              AppRatioSpaces.horizontalSectionSpaceXXSS(),
            ],
          ),
          BookmarkWidget(
            id: session.id!,
          )
        ],
      ),
    );
  }

  Widget _sessionImageWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: SizedBox(
        width: AppRatioSize.getRatioWidth() / 4.5,
        height: AppRatioSize.getRatioWidth() / 4.5,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: AppRatioSize.getRatioWidth() / 4.5,
              height: AppRatioSize.getRatioWidth() / 4.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColor.grey,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: "${session.imagePath}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColor.grey.withOpacity(0.2),
                    highlightColor: AppColor.lightGrey.withOpacity(0.4),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image_not_supported_rounded,
                    color: AppColor.grey.withOpacity(0.5),
                    size: AppRatioSize.getRatioWidth() / 8,
                  ),
                ),
              ),
            ),
            Container(
              width: AppRatioSize.getRatioWidth() / 4.5,
              height: AppRatioSize.getRatioWidth() / 14,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                color: AppColor.textBlueGrey,
              ),
              child: Text(
                "${session.recipeCount! - 1}+ ${"nutrition_recipe_lbl".tr}",
                textAlign: TextAlign.left,
                style: TextStyleX.subHeading2(context).copyWith(
                  color: AppColor.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sessionTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sessionTextTitleSection(context),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                _sessionTextInfoSection(context),
              ],
            )),
            Container(
              width: AppRatioSize.getRatioWidth() / 10,
            )
          ],
        ),
      ],
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
        Flexible(
          child: _textInfoWidget(context,
              iconPath: AppIcon.breIcon, value: "${session.bre}", unit: ""),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXXS(),
        Flexible(
          child: _textInfoWidget(context,
              iconPath: AppIcon.caloriesIcon,
              value: "${session.caloriesToBurn}",
              unit: "Cal"),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Flexible(
          child: _textInfoWidget(context,
              iconPath: AppIcon.clockIcon,
              value: "${session.duration}",
              unit: "Min"),
        ),
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
        Flexible(
          child: Text(
            "$value $unit".tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading2(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _sessionTextPriceSection(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$${session.price}".tr,
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
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
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
