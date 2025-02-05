import 'package:go7eight/src/core/enums/meal_process_type_enum.dart';

import '../../../../../../core/app_export.dart';
import '../../controllers/trainer_add_recipe_controller.dart';

class RecipeAddProcessBottomsheet extends GetView<TrainerAddRecipeController> {
  final MealProcessType mealProcessType;

  const RecipeAddProcessBottomsheet({super.key, required this.mealProcessType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 60,
              width: Get.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                height: 60,
                width: Get.width,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Text(
                        (mealProcessType == MealProcessType.prepare ? "how_to_prepare_title" : mealProcessType == MealProcessType.cook ? "how_to_cook_title" : "how_to_assembly_title")
                            .tr,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading1(context).copyWith(
                          fontSize: AppTextSizes.titleText5(),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(
                            right: AppRatioSize.getRatioWidth() / 44),
                        child: Image.asset(
                          AppIcon.closeIcon,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.blackShade
                                  : AppColor.creamColor,
                          scale: 1.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSectionTitle(
                    title:
                        (mealProcessType == MealProcessType.prepare ? "preparation_lbl" : mealProcessType == MealProcessType.cook ? "cooking_lbl" : "assembling_lbl")
                            .tr,
                    showViewAll: true,
                    disableDefaultHPadding: true,
                    titleColor: AppColor.primary,
                    fontSize: 16,
                    secondaryOptionText: "add_lbl",
                    onTapViewAll: () {
                      final workoutTypeController = TextEditingController();
                      controller.processListController
                          .add(workoutTypeController);
                    },
                  ),
                  Obx(() {
                    return ListView.builder(
                        itemCount: controller.processListController.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "step_lbl".tr + "${index + 1}:".tr,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleX.subHeading1(context)
                                      .copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColor.blackShade
                                        : AppColor.creamColor,
                                    fontSize: AppTextSizes.headerText2(),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 5,
                                      child: AppTextField(
                                        maxLine: 5,
                                        controller: controller
                                            .processListController[index],
                                        hintText: "step_description_hint",
                                        showLabel: false,
                                        showBoarder: true,
                                        boarderColor:
                                            AppColor.boarderBlueGrey,
                                        shadowOpacity: 0,
                                        backgroundColor:
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? AppColor.textFieldBackground
                                                : AppColor.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.processListController
                                            .removeAt(index);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(
                                              AppRatioSize.getRatioWidth() /
                                                  48),
                                          decoration: BoxDecoration(
                                              color: AppColor.red
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width:
                                              AppRatioSize.getRatioWidth() /
                                                  11,
                                          height:
                                              AppRatioSize.getRatioWidth() /
                                                  11,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            AppIcon.closeIcon,
                                            color:
                                                AppColor.red.withOpacity(0.7),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  }),
                  AppRatioSpaces.verticalSectionSpaceXXS(),
                ],
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceM(),
            _bottomNavBarButtons(context)
          ],
        ),
      ),
    );
  }

  _bottomNavBarButtons(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
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
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarSaveChangesButtons(context));
  }

  Widget _bottomNavBarSaveChangesButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: () {
              controller.cancelIngredient();
              Navigator.pop(context);
            },
            text: "cancel_lbl",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.primary,
            primary: false,
          )),
          AppRatioSpaces.horizontalSectionSpaceXS(),
          Expanded(
              child: AppButton(
            action: () {
              controller.addProcess(mealProcessType);
              Navigator.pop(context);
            },
            text: "save_btn_lbl",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }
}
