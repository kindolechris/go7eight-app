import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/app_export.dart';
import '../../../data/dummy_dataset/trainer_name_data.dart';
import '../../../data/dummy_dataset/user_image_data.dart';

class RatingContainerWidget extends StatelessWidget {
  final int ratingIndex;

  const RatingContainerWidget({super.key, required this.ratingIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: AppContainerWidget(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppNetworkImage(
                    width: AppRatioSize.getRatioWidth() / 10,
                    height: AppRatioSize.getRatioWidth() / 10,
                    showBoarder: true,
                    imagePath: userImageGet(id: ratingIndex)),
                AppRatioSpaces.horizontalSectionSpaceXXS(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trainerNameGet(id: ratingIndex).tr,
                        textAlign: TextAlign.left,
                        style: TextStyleX.subHeading2BlueGrey(context),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            maxRating: 5,
                            itemSize: AppRatioSize.getRatioWidth() / 24,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          Text(
                            "4.5".tr,
                            textAlign: TextAlign.left,
                            style: TextStyleX.subHeading2BlueGrey(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "2hr ago".tr,
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading6(context).copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.textBlueGrey.withOpacity(0.4)
                        : AppColor.creamColor.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            Text(
              "I have used this app for several months. I quickly upgraded to the paid version because I was enjoying the free version - which I didn't notice limitations with."
                  .tr,
              textAlign: TextAlign.left,
              style: TextStyleX.body4Medium(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.textBlueGrey.withOpacity(0.8)
                      : AppColor.creamColor.withOpacity(0.8),
                  fontSize: AppTextSizes.headerText3() / 1.1),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
