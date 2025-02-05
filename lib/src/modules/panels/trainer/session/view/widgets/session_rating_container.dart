import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_session_controller.dart';

class GYMSessionRatingContainer extends GetView<TrainerSessionController> {
  const GYMSessionRatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppRatioSize.getRatioHeight() / 88,
          horizontal: AppRatioSize.getRatioWidth() / 44),
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: AppTextSizes.titleText5(),
                height: AppTextSizes.titleText5(),
                child: Image.asset(
                  AppIcon.challengesRatingIcon,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                style: TextStyleX.subHeading2BlueGrey(context),
                maxLines: 1,
                TextSpan(
                  children: [
                    TextSpan(
                      text: "4.8".tr,
                    ),
                    TextSpan(
                      text: ' (200+)'.tr,
                      style: TextStyleX.subHeading2BlueGrey(context).copyWith(
                          color: AppColor.lightBlueGrey,
                          fontSize: AppTextSizes.headerText4()),
                    )
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: controller.gotoSessionRatingView,
            child: Row(
              children: [
                Text(
                  "see_rating_lbl".tr,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleX.subHeading3(context).copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.primary
                        : AppColor.primary,
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceXXSS(),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width),
                      color: AppColor.primary),
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColor.white,
                    size: AppRatioSize.getRatioWidth() / 24,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
