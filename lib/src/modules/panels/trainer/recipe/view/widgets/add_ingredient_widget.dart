import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_add_recipe_controller.dart';
import 'add_ingredients_bottomsheet.dart';

class AddIngredientWidget extends GetView<TrainerAddRecipeController> {
  const AddIngredientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      padding: EdgeInsets.all(AppRatioSize.getRatioWidth() / 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.boarderBlueGrey),
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.textFieldBackground
            : AppColor.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "add_ingredients_lbl".tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading4(context).copyWith(
              fontWeight: FontWeight.w800,
              fontSize: AppTextSizes.headerText2(),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primary.withOpacity(0.15),
            ),
            child: AppButton(
              action: () {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const RecipeAddIngredientBottomsheet());
                  },
                );
              },
              text: "add_lbl",
              primary: false,
              txtColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade
                  : AppColor.creamColor,
            ),
          ),
          Obx(() {
            return controller.ingredientList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppRatioSpaces.verticalSectionSpaceXXXS(),
                      Text("ingredients_lbl".tr,
                          textAlign: TextAlign.left,
                          style: TextStyleX.subHeading2BlueGrey(context)),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: controller.ingredientList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColor.boarderBlueGrey),
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.textFieldBackground
                                    : AppColor.black,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.ingredientList[index].name}"
                                            .tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyleX.subHeading2BlueGrey(
                                            context),
                                      ),
                                      Text(
                                        "${controller.ingredientList[index].brand}"
                                            .tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyleX.subHeading2BlueGrey(
                                                context)
                                            .copyWith(
                                                color: AppColor.primary,
                                                fontSize:
                                                    AppTextSizes.headerText4()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "${controller.ingredientList[index].quantity} ${controller.ingredientList[index].unit}"
                                              .tr,
                                          textAlign: TextAlign.left,
                                          style: TextStyleX.subHeading2BlueGrey(
                                              context)),
                                      AppRatioSpaces
                                          .horizontalSectionSpaceXXS(),
                                      GestureDetector(
                                        onTap: () {
                                          controller.editIngredient(
                                              controller.ingredientList[index]);
                                          showModalBottomSheet(
                                            context: context,
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                            ),
                                            builder: (context) {
                                              return Container(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child:
                                                      const RecipeAddIngredientBottomsheet());
                                            },
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: AppColor.primary
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Image.asset(AppIcon.edit2Icon),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ],
                  )
                : Container();
          })
        ],
      ),
    );
  }
}
