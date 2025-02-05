import 'package:go7eight/src/core/reusableComponents/app_html_view.dart';
import 'package:go7eight/src/modules/panels/global_widgets/open_alert_box.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/student/recipe/views/widgets/nutrition_value_widget.dart';
import 'package:go7eight/src/modules/panels/student/recipe/views/widgets/recipe_ingredient_tab.dart';
import 'package:go7eight/src/modules/panels/student/recipe/views/widgets/recipe_instruction_tab.dart';
import '../../../../../core/app_export.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/recipe_controller.dart';

class RecipeView extends GetView<RecipeController> {
  final String recipeThumbnail;
  const RecipeView({super.key, required this.recipeThumbnail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(
        context,
        showSaveIcon: false,
        title: "nutrition_recipe_lbl",
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        margin:
            EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            AppRatioSpaces.verticalSectionSpaceM(),
            AspectRatio(
                aspectRatio: 16 / 9,
                child: AppNetworkImage(
                  width: Get.width,
                  height: Get.height / 3,
                  borderRadius: 12,
                  imagePath: recipeThumbnail,
                  showBoarder: false,
                )),
            AppRatioSpaces.verticalSectionSpaceS(),
            const TagListWidget(
              disableDefaultHPadding: true,
              tags: [],
            ),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _recipeTitleSection(context),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            _recipeInfoSection(context),
            AppRatioSpaces.verticalSectionSpaceS(),
            const NutritionValueWidget(
                nutritionIconPath: AppIcon.proteinsIcon,
                nutritionName: "recipe_macro_protein",
                nutritionValue: 124,
                totalNutritionCount: 150,
                progressColor: Colors.amber),
            const NutritionValueWidget(
                nutritionIconPath: AppIcon.fatsIcon,
                nutritionName: "recipe_macro_fat",
                nutritionValue: 64,
                totalNutritionCount: 150,
                progressColor: Colors.red),
            const NutritionValueWidget(
                nutritionIconPath: AppIcon.carbsIcon,
                nutritionName: "recipe_macro_carbs",
                nutritionValue: 92,
                totalNutritionCount: 150,
                progressColor: Colors.green),
            Text(
              "preference_qh_overview".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading1(context).copyWith(
                color: AppColor.primary,
              ),
            ),
            _recipeOverviewDetails(context),
            Obx(() {
              return AppTabBar(
                onChange: (value) {
                  controller.isIngredientsSelected.value = value;
                },
                isFirstOptionSelected: controller.isIngredientsSelected.value,
                horizontalMargin: 0,
                optionOneText: "ingredients_lbl",
                optionTwoText: "instruction_lbl",
              );
            }),
            AppRatioSpaces.verticalSectionSpaceXS(),
            Obx(() {
              return controller.isIngredientsSelected.value
                  ? const RecipeIngredientTab()
                  : const RecipeInstructionTab();
            }),
            AppRatioSpaces.verticalSectionSpaceM()
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBarButtons(context),
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
        child: _bottomNavBarPurchaseButtons(context));
  }

  Widget _bottomNavBarPurchaseButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: () {
              openAlertBox(
                  context: context,
                  title: "recipe_added_lbl",
                  description: "",
                  icon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.green),
                        child: Icon(Icons.check,
                            color: AppColor.white,
                            size: AppRatioSize.getRatioHeight() / 24),
                      ),
                    ],
                  ),
                  buttonText: "back_lbl",
                  buttonAction: Get.back);
            },
            text: "add_recipe_lbl",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }

  Widget _recipeTitleSection(BuildContext context) {
    return Text(
      "Chicken & Waffles".tr,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyleX.subHeading1(context),
    );
  }

  Widget _recipeInfoSection(BuildContext context) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.caloriesIcon,
            value: "150",
            unit: "calories_lbl"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        _textInfoWidget(context,
            iconPath: AppIcon.clockIcon, value: "15", unit: "minutes_lbl"),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: AppTextSizes.headerText(),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "$value ${unit.tr}",
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context)
              .copyWith(fontSize: AppTextSizes.bodyText2()),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  _recipeOverviewDetails(BuildContext context) {
    return Container(
      child: AppHtmlView.applyHtml(context,
          text: """
              <p><strong>How to perform one repetition :</strong></p>
<ul>
    <li style="font-size: 12px;">Stand upright with your legs slightly a part and your arms at your sides.</li>
    <li style="font-size: 12px;">With a little jump widen your legs and at the same time quickly bring the hands over your head, until their almost touch.</li>
</ul>""",
          style: const TextStyle(),
          textAlign: TextAlign.left),
    );
  }
}
