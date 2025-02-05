

import '../../../../../../core/app_export.dart';
import '../../controllers/trainer_add_recipe_controller.dart';

class RecipeAddSpiceBottomsheet extends GetView<TrainerAddRecipeController>{
  const RecipeAddSpiceBottomsheet({super.key});

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
          color: Theme
              .of(context)
              .brightness == Brightness.light
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
                color: Theme
                    .of(context)
                    .brightness == Brightness.light
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
                        "add_spices_lbl".tr,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading1(context).copyWith(
                          fontSize: AppTextSizes
                              .titleText5(),),
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
                          color: Theme
                              .of(context)
                              .brightness ==
                              Brightness.light
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
              margin: EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth()/24),
              child: Column(
                children: [
                  _textEditField(context,
                      label: "${"spice_name_lbl".tr}*",
                      hint: "Ex: Chicken/Apple/Mayo",
                      textEditingController: controller
                          .ingredientSpiceNameTextController,
                      showError: controller.showIngredientSpiceNameError.value,
                      showSuffix: false),
                  AppRatioSpaces.verticalSectionSpaceXXS(),
                  _textEditField(context,
                      label: "${"quantity_lbl".tr}*",
                      hint: "quantity_hint",
                      textEditingController: controller
                          .ingredientSpiceQuantityValueTextController,
                      showError: controller.showIngredientSpiceQuantityError.value,
                      showSuffix: true,
                      suffixWidget:
                      Obx(() {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth()/66),
                          height: AppRatioSize.getRatioHeight()/25,
                          width: AppRatioSize.getRatioWidth()/4,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme
                                .of(context)
                                .brightness == Brightness.light
                                ? AppColor.white: AppColor.blackShade,
                          ),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(8),
                            underline: Container(),
                            padding: EdgeInsets.zero,
                            style: TextStyleX.subHeading2BlueGrey(context)..copyWith(
                              fontSize: AppTextSizes.headerText4(),),
                            dropdownColor: Theme
                                .of(context)
                                .brightness == Brightness.light
                                ? AppColor.white
                                : AppColor.blackShade,
                            value: "${controller.spiceUnitValue}",
                            items: <String>[
                              'Tps',
                              'Piece',
                              'ML',
                              'Cups'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              
                              controller.spiceUnitValue.value = value!;
                            },
                          ),
                        );
                      })
                  ),
                  AppRatioSpaces.verticalSectionSpaceXXS(),
                  _textEditField(context,
                      label: "${"brand_name_lbl".tr}*",
                      hint: "brand_name_hint",
                      textEditingController: controller
                          .ingredientSpiceBrandNameTextController,
                      showError: controller.showIngredientSpiceBrandNameError.value,
                      showSuffix: false),
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
          color: Theme
              .of(context)
              .brightness == Brightness.light
              ? AppColor.white : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1) : AppColor.white
                  .withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarSaveChangesButtons(context)
    );
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
              )
          ),
          AppRatioSpaces.horizontalSectionSpaceXS(),
          Expanded(
              child:
              AppButton(
                action: () {
                  controller.addIngredient(isSpice: true);
                  Navigator.pop(context);

                },
                text: "save_btn_lbl",
                fontSize: AppTextSizes.headerText1(),
                buttonWidth: double.infinity,
                boarderRadius: 8,
                txtColor: AppColor.white,
              )
          ),
        ],
      ),
    );
  }

  Widget _textEditField(BuildContext context, {
    required String label, required String hint,
    required TextEditingController textEditingController,
    required bool showError,
    required bool showSuffix,
    Widget? suffixWidget
  }) {
    return AppTextField(
      labelText: label.tr,
      hintText: hint.tr,
      controller: textEditingController,
      showBoarder: true,
      shadowOpacity: 0,
      boarderColor: AppColor.boarderBlueGrey,
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showSuffixIcon: showSuffix,
      suffixWidget: suffixWidget,
    );
  }
}