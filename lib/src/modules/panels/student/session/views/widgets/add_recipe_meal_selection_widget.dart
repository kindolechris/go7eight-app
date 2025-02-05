import 'package:go7eight/src/core/app_export.dart';
import '../../controllers/session_controllers.dart';

class AddRecipeMealSelectionWidget extends GetView<SessionController> {
  const AddRecipeMealSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: Text(
            "selected_meal_time_lbl".tr,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading1(context),
          ),
        ),
        AppRatioSpaces.verticalSectionSpaceXS(),
        Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.meals.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.mealSelection(controller.meals[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 12,
                          left: AppRatioSize.getRatioWidth() / 24,
                          right: AppRatioSize.getRatioWidth() / 24),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.white
                                  : AppColor.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1.5,
                              color: controller.meals[index].isSelected == false
                                  ? Colors.transparent
                                  : AppColor.primary)),
                      child: AppContainerWidget(
                        disableDefaultHPadding: true,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      AppRatioSize.getRatioHeight() / 400),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                      controller.meals[index].iconPath,
                                      scale: 1.5),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.meals[index].name.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? AppColor.black
                                                    : AppColor.creamColor,
                                                fontSize: AppTextSizes
                                                    .headerText1()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              });
        }),
      ],
    );
  }
}
