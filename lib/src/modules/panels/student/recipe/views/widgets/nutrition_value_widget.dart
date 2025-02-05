import 'package:go7eight/src/core/app_export.dart';

class NutritionValueWidget extends StatelessWidget {
  final String nutritionIconPath;
  final String nutritionName;
  final int nutritionValue;
  final int totalNutritionCount;
  final Color progressColor;

  const NutritionValueWidget(
      {super.key,
      required this.nutritionIconPath,
      required this.nutritionName,
      required this.nutritionValue,
      required this.totalNutritionCount,
      required this.progressColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppRatioSize.getRatioHeight() / 120),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                nutritionIconPath,
                scale: 1.0,
              )),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nutritionName.tr,
                      textAlign: TextAlign.left,
                      style: TextStyleX.subHeading3(context),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "$nutritionValue".tr,
                      textAlign: TextAlign.left,
                      style: TextStyleX.subHeading3(context),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                LinearProgressIndicator(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColor.offWhite
                          : AppColor.blackShade,
                  color: progressColor,
                  minHeight: 5,
                  value: nutritionValue / totalNutritionCount,
                  semanticsLabel: nutritionName,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
