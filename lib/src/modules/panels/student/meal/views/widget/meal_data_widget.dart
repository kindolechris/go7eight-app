import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/meal_controller.dart';
import 'macro_progress_widget.dart';

class MealDataWidget extends GetView<MealController> {
  const MealDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.5,
      height: Get.height / 2.2,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(18),
      ),
      child: AppContainerWidget(
        child: Column(
          children: [
            SizedBox(
              height: AppRatioSize.getRatioHeight() / 36,
            ),
            Container(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                padding: const EdgeInsets.all(2),
                child: CircularPercentIndicator(
                  radius: AppRatioSize.getRatioWidth() / 4,
                  lineWidth: AppRatioSize.getRatioWidth() / 36,
                  percent: 105 / 155,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColor.offWhite
                          : AppColor.blackShade,
                  progressColor: AppColor.primary,
                  fillColor: Theme.of(context).brightness == Brightness.light
                      ? AppColor.white
                      : AppColor.black,
                  center: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (105 / 155).toStringAsFixed(2).tr,
                        textAlign: TextAlign.left,
                        style: TextStyleX.subHeading1(context).copyWith(
                          fontSize: AppTextSizes.titleText3(),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "105/1581".tr,
                        textAlign: TextAlign.left,
                        style: TextStyleX.subHeading2(context),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: AppRatioSize.getRatioHeight() / 44,
                      ),
                      Text(
                        "recipe_macro_cals".tr,
                        textAlign: TextAlign.left,
                        style: TextStyleX.subHeading2(context).copyWith(
                          fontSize: AppTextSizes.headerText1(),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )),
            AppRatioSpaces.verticalSectionSpaceS(),
            const Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: MacroProgressWidget(
                      completedCount: 120,
                      totalCount: 150,
                      macroName: "recipe_macro_protein",
                      progressColor: Colors.amber,
                    )),
                    Expanded(
                        child: MacroProgressWidget(
                      completedCount: 14,
                      totalCount: 47,
                      macroName: "recipe_macro_fat",
                      progressColor: Colors.red,
                    )),
                    Expanded(
                        child: MacroProgressWidget(
                      completedCount: 143,
                      totalCount: 200,
                      macroName: "recipe_macro_carbs",
                      progressColor: Colors.green,
                    )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
