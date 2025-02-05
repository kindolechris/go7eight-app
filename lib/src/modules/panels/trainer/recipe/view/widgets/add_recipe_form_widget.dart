import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_add_recipe_controller.dart';

class AddRecipeFormWidget extends GetView<TrainerAddRecipeController> {
  const AddRecipeFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textEditField(context,
              label: "${"recipe_add_title".tr}*",
              hint: "|Ex: Chicken Salad & Waffles",
              textEditingController: controller.recipetitleTextController,
              showError: controller.showRecipeTitleError.value,
              showSuffix: false),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          _textEditField(context,
              label: "calories_lbl",
              hint: "general_input_hint",
              textEditingController: controller.caloriesTextController,
              showError: controller.showCaloriesError.value,
              showSuffix: false),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          _textEditField(context,
              label: "recipe_cooking_time_lbl",
              hint: "general_input_hint",
              textEditingController: controller.prepTimeTextController,
              showError: controller.showPrepTimeError.value,
              showSuffix: false),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          _textEditField(context,
              label: "recipe_macro_protein",
              hint: "general_input_hint",
              textEditingController: controller.prepTimeTextController,
              showError: controller.showPrepTimeError.value,
              showSuffix: false),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          _textEditField(context,
              label: "recipe_macro_fat",
              hint: "general_input_hint",
              textEditingController: controller.prepTimeTextController,
              showError: controller.showPrepTimeError.value,
              showSuffix: false),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          _textEditField(context,
              label: "recipe_macro_carbs",
              hint: "general_input_hint",
              textEditingController: controller.prepTimeTextController,
              showError: controller.showPrepTimeError.value,
              showSuffix: false),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          const AppSectionTitle(
            title: "recipe_meal_type",
            showViewAll: false,
            disableDefaultHPadding: true,
            titleColor: AppColor.primary,
            fontSize: 14,
          ),
          Obx(() {
            return Container(
              height: AppRatioSize.getRatioHeight() / 17,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.boarderBlueGrey),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.textFieldBackground
                    : AppColor.black,
              ),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(8),
                underline: Container(),
                isExpanded: true,
                style: TextStyleX.subHeading1(context),
                dropdownColor: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.blackShade,
                value: "${controller.mealTypeValue}",
                items: <String>[
                  'Breakfast',
                  'Lunch',
                  'Dinner',
                  'Snacks',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  
                  controller.mealTypeValue.value = value!;
                },
              ),
            );
          }),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          AppSectionTitle(
            title: "recipe_tags_lbl",
            showViewAll: true,
            disableDefaultHPadding: true,
            titleColor: AppColor.primary,
            fontSize: 14,
            secondaryOptionText: "add_lbl",
            onTapViewAll: () {
              final workoutTypeController = TextEditingController();
              controller.recipeTagListController.add(workoutTypeController);
            },
          ),
          Obx(() {
            return ListView.builder(
                itemCount: controller.recipeTagListController.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: AppTextField(
                            controller:
                                controller.recipeTagListController[index],
                            hintText: "Ex: Fresh/10min/Homemade",
                            showLabel: false,
                            showBoarder: true,
                            boarderColor: AppColor.boarderBlueGrey,
                            shadowOpacity: 0,
                            backgroundColor: Theme.of(context).brightness ==
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
                            controller.recipeTagListController
                                .removeAt(index);
                          },
                          child: Container(
                              padding: EdgeInsets.all(
                                  AppRatioSize.getRatioWidth() / 48),
                              decoration: BoxDecoration(
                                  color: AppColor.red.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12)),
                              width: AppRatioSize.getRatioWidth() / 11,
                              height: AppRatioSize.getRatioWidth() / 11,
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppIcon.closeIcon,
                                color: AppColor.red.withOpacity(0.7),
                              )),
                        ),
                      ],
                    ),
                  );
                });
          }),
        ],
      ),
    );
  }

  Widget _textEditField(BuildContext context,
      {required String label,
      required String hint,
      required TextEditingController textEditingController,
      required bool showError,
      required bool showSuffix,
      Widget? suffixWidget}) {
    return AppTextField(
      labelText: label.tr,
      hintText: hint.tr,
      controller: textEditingController,
      showBoarder: true,
      shadowOpacity: 0,
      boarderColor: AppColor.boarderBlueGrey,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showSuffixIcon: showSuffix,
      suffixWidget: suffixWidget,
    );
  }
}
