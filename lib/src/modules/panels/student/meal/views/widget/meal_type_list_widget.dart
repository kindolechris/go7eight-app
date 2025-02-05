import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/animated_alert_dialog.dart';
import 'package:go7eight/src/modules/panels/global_widgets/recipe_widget.dart';

import '../../controllers/meal_controller.dart';
import 'food_item_widget.dart';
import 'meal_type_widget.dart';

class MealTypeListWidget extends GetView<MealController> {
  const MealTypeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.meals.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return MealTypeWidget(
              onMealClick: () {
                controller.gotoAddMealView(
                    mealType: controller.meals[index].mealType);
              },
              meal: controller.meals[index],
              mealItemWidget: controller.meals[index].foodList!.isNotEmpty ||
                      controller.meals[index].recipeList!.isNotEmpty
                  ? Column(
                      children: [
                        AppRatioSpaces.verticalSectionSpaceXS(),
                        Divider(
                          thickness: 1.5,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.primary.withOpacity(0.2)
                                  : AppColor.primary.withOpacity(0.8),
                        ),
                        _foodListWidget(context, index: index),
                        _recipeListWidget(context, index: index),
                      ],
                    )
                  : Container(),
            );
          });
        });
  }

  Widget _recipeListWidget(BuildContext context, {required int index}) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.meals[index].recipeList?.length ?? 0,
        itemBuilder: (context, recipeIndex) {
          return RecipeWidget(
            addAction: () {
              _openMealRemoverAlertBox(context, confirmationAction: () {
                controller.meals[index].recipeList!.remove(
                    controller.meals[index].recipeList![recipeIndex]);
                Navigator.pop(context);
              });
            },
            isAdded: true,
            width: Get.width,
            recipe: controller.meals[index].recipeList![recipeIndex],
          );
        });
  }

  Widget _foodListWidget(BuildContext context, {required int index}) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.meals[index].foodList?.length ?? 0,
        itemBuilder: (context, foodIndex) {
          return FoodItemWidget(
            addAction: () {
              _openMealRemoverAlertBox(context, confirmationAction: () {
                controller.meals[index].foodList!
                    .remove(controller.meals[index].foodList![foodIndex]);
                Navigator.pop(context);
              });
            },
            isAdded: true,
            food: controller.meals[index].foodList![foodIndex],
            width: Get.width,
          );
        });
  }

  Future _openMealRemoverAlertBox(BuildContext context,
      {required Function() confirmationAction}) {
    return _openAlertBox(
        context: context,
        title: "remove_meal_message",
        description: "",
        icon: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  AppIcon.deleteAlertIcon,
                  scale: 2.5,
                )),
          ],
        ),
        buttonWidget: SizedBox(
          height: AppRatioSize.getRatioHeight() / 18,
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  action: () {
                    Navigator.pop(context);
                  },
                  text: "cancel_lbl",
                  btnColor: Theme.of(context).brightness == Brightness.light
                      ? AppColor.textBlueGrey
                      : AppColor.grey,
                  primary: false,
                  txtColor: Theme.of(context).brightness == Brightness.light
                      ? AppColor.textBlueGrey
                      : AppColor.grey,
                ),
              ),
              AppRatioSpaces.horizontalSectionSpaceS(),
              Expanded(
                child: AppButton(
                  action: confirmationAction,
                  text: "lbl_btn_confirm",
                ),
              ),
            ],
          ),
        ));
  }

  Future _openAlertBox(
      {required BuildContext context,
      required Widget icon,
      required Widget buttonWidget,
      required String title,
      required String description}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: AppColor.black.withOpacity(0.7),
        builder: (_) {
          return AnimatedAlertDialog(
            title: title,
            description: description,
            icon: icon,
            titleColor: AppColor.primary,
            buttonWidget: buttonWidget,
          );
        });
  }
}
