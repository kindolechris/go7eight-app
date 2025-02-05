import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/app_export.dart';

class RatingHeaderWidget extends StatelessWidget {
  const RatingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: AppContainerWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 44),
          child: Column(
            children: [
              Text(
                "4.8".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.titleText3(context),
              ),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ignoreGestures: true,
                maxRating: 5,
                itemSize: AppRatioSize.getRatioWidth() / 18,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "20032".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading2(context).copyWith(
                      fontSize: AppTextSizes.headerText2(),
                    ),
                  ),
                  AppRatioSpaces.horizontalSectionSpaceXXXS(),
                  Text(
                    "review_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading2(context).copyWith(
                      fontSize: AppTextSizes.headerText2(),
                    ),
                  ),
                ],
              ),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _ratingRowItem(context,
                        rating: "${5 - index}",
                        ratingAmount: (20032 / (index + 1)).round());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingRowItem(BuildContext context,
      {required String rating, required int ratingAmount}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: AppRatioSize.getRatioWidth() / 12,
            child: Row(
              children: [
                SizedBox(
                  width: AppRatioSize.getRatioWidth() / 30,
                  child: Text(
                    rating.tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading2BlueGrey(context),
                  ),
                ),
                Flexible(
                    child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: AppRatioSize.getRatioWidth() / 24,
                )),
              ],
            ),
          ),
          Container(
            width: AppRatioSize.getRatioWidth() / 1.72,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.lightGrey
                    : AppColor.grey,
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                Container(
                  width: AppRatioSize.getRatioWidth() / 1.72,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.lightGrey
                          : AppColor.grey,
                      borderRadius: BorderRadius.circular(12)),
                ),
                Container(
                  width: (AppRatioSize.getRatioWidth() / 1.72) /
                      (5.5 - int.parse(rating)),
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ],
            ),
          ),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          Text(
            "$ratingAmount".tr,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading2(context),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
