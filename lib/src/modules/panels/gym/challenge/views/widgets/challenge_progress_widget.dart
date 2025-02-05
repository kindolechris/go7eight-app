import 'package:go7eight/src/core/app_export.dart';

class ChallengeProgressWidget extends StatelessWidget {
  const ChallengeProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 10,
      width: Get.width,
      padding: EdgeInsets.symmetric(
          vertical: AppRatioSize.getRatioHeight() / 55,
          horizontal: AppRatioSize.getRatioWidth() / 24),
      decoration: BoxDecoration(
        color: AppColor.appBrown,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(AppImage.challengeProgressImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Weekly Workout".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context).copyWith(
                  fontSize: AppTextSizes.headerText2(),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Day 11/20".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.blackShade
                          : AppColor.creamColor,
                      fontSize: AppTextSizes.headerText2(),
                    ),
                  ),
                  Text(
                    "(40)".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.blackShade
                          : AppColor.creamColor,
                      fontSize: AppTextSizes.headerText2(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: Get.width,
            height: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: AppColor.white),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: Get.width,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.white),
                ),
                Container(
                  width: Get.width / 2.1,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
