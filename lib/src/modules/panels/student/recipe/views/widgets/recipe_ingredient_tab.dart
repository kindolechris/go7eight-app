import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/recipe/controllers/recipe_controller.dart';

import 'show_recipe_option_item.dart';

class RecipeIngredientTab extends GetView<RecipeController> {
  const RecipeIngredientTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "person_lbl".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading1(context),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                  color: AppColor.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.personCount.value--;
                    },
                    child: const Icon(
                      Icons.remove,
                      color: AppColor.primary,
                    ),
                  ),
                  Obx(() {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "${controller.personCount.value}".tr,
                        style: TextStyleX.subHeading2(context).copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      controller.personCount.value++;
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        AppRatioSpaces.verticalSectionSpaceXS(),
        Obx(() {
          return ShowRecipeOptionItem(
              action: () {
                controller.showBrandSelected.value =
                    !controller.showBrandSelected.value;
              },
              optionTitle: "show_brands_lbl",
              isChecked: controller.showBrandSelected.value);
        }),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        Obx(() {
          return ShowRecipeOptionItem(
              action: () {
                controller.showSpicesSelected.value =
                    !controller.showSpicesSelected.value;
              },
              optionTitle: "show_spices_lbl",
              isChecked: controller.showSpicesSelected.value);
        }),
        AppRatioSpaces.verticalSectionSpaceS(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: AppContainerWidget(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "products_lbl".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context),
              ),
              _productItemWidget(context),
              _productItemWidget(context),
              _productItemWidget(context),
              _productItemWidget(context),
              _productItemWidget(context),
            ],
          )),
        ),
        AppRatioSpaces.verticalSectionSpaceS(),
        Obx(() {
          return controller.showSpicesSelected.value == true
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: AppContainerWidget(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "spices_lbl".tr,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading1(context),
                      ),
                      _productItemWidget(context),
                      _productItemWidget(context),
                    ],
                  )),
                )
              : Container();
        }),
      ],
    );
  }

  Widget _productItemWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Column(
        children: [
          Divider(
            color: AppColor.primary.withOpacity(0.6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chicken".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.header3(context),
                  ),
                  Obx(() {
                    return controller.showBrandSelected.value == true
                        ? Text(
                            "Brand Name".tr,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleX.subHeading2(context)
                                .copyWith(color: AppColor.primary),
                          )
                        : Container();
                  }),
                ],
              ),
              Text("5 Ounce".tr,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleX.subHeading1(context)),
            ],
          ),
        ],
      ),
    );
  }
}
