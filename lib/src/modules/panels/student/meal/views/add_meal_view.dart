import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/meal_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/recipe_widget.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/widget/food_detail_bottomsheet.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/widget/food_item_widget.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/widget/meal_search_widget.dart';
import '../../../global_widgets/option_widget.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/meal_controller.dart';

class AddMealView extends GetView<MealController> {
  final MealType mealType;

  const AddMealView({super.key, required this.mealType});

  @override
  Widget build(BuildContext context) {
    controller.isFoodSelected.value = true;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          appBar: sessionAppBar(
            context,
            showSaveIcon: false,
            title: "add_meal_recipe_title",
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                AppRatioSpaces.verticalSectionSpaceM(),
                Obx(() {
                  return AppTabBar(
                      onChange: (value) {
                        controller.isFoodSelected.value = value;
                      },
                      isFirstOptionSelected: controller.isFoodSelected.value,
                      horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                      optionOneText: "food_lbl",
                      optionTwoText: "recipe_lbl");
                }),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                const MealSearchWidget(),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                OptionWidget(title: "", filterOptions: controller.filerOptions),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 32),
                  child: Obx(() {
                    return controller.isFoodSelected.value
                        ? _foodListWidget()
                        : _recipeListWidget();
                  }),
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
              ],
            ),
          )),
    );
  }

  Widget _foodListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.foods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return const FoodDetailsBottomSheet();
                },
              );
            },
            child: FoodItemWidget(
              addAction: () {
                controller.addFoodToMeal(mealType, controller.foods[index]);
              },
              food: controller.foods[index],
              width: Get.width,
            ),
          );
        });
  }

  Widget _recipeListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.gotoRecipeDetailsView(controller.recipes[index]);
            },
            child: RecipeWidget(
              addAction: () {
                controller.addRecipeToMeal(mealType, controller.recipes[index]);
              },
              recipe: controller.recipes[index],
              width: Get.width,
            ),
          );
        });
  }
}
