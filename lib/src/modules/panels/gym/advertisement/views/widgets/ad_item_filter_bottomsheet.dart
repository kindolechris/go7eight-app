import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/gym/advertisement/controllers/gym_advertisement_controller.dart';

import '../ad_item_list_view.dart';

class AdItemFilterBottomSheet extends GetView<GYMAdvertisementController> {
  const AdItemFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Text(
                "${"filter_lbl".tr} ${controller.selectedTypeOfAdvertisement.value.tr}",
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context).copyWith(
                  fontSize: AppTextSizes.titleText5(),
                ),
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            padding: EdgeInsets.all(
              AppRatioSize.getRatioWidth() / 32,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primary, width: 1.5),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.primary.withOpacity(0.15)
                  : AppColor.primary.withOpacity(0.55),
            ),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.typeOfFilterSessionItem.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedFilterSessionItem.value =
                          controller.typeOfFilterSessionItem[index];
                    },
                    child: Container(
                        height: AppRatioSize.getRatioHeight() / 18,
                        width: Get.width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppRatioSize.getRatioWidth() / 24),
                        margin: EdgeInsets.only(bottom: index == 0 ? 8 : 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.primary.withOpacity(0.15)
                                  : AppColor.primary.withOpacity(0.55),
                        ),
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.typeOfFilterSessionItem[index]
                                    .tr,
                                style: TextStyleX.subHeading1(context).copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.blackShade
                                      : AppColor.creamColor,
                                  fontSize: AppTextSizes.headerText3(),
                                ),
                              ),
                              controller.selectedFilterSessionItem.value ==
                                      controller.typeOfFilterSessionItem[index]
                                  ? Container(
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Get.width),
                                          color: AppColor.primary),
                                      child: Icon(
                                        Icons.check,
                                        color: AppColor.white,
                                        size: AppRatioSize.getRatioWidth() / 24,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Get.width),
                                      ),
                                      child: Icon(
                                        Icons.fiber_manual_record_outlined,
                                        color: AppColor.grey,
                                        size: AppRatioSize.getRatioWidth() / 16,
                                      ),
                                    )
                            ],
                          );
                        })),
                  );
                }),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: AppTextField(
              showLabel: false,
              hintText: "key_word_lbl".tr,
              controller: controller.keyWordController,
              showBoarder: true,
              shadowOpacity: 0,
              boarderColor: AppColor.primary,
              boarderWeight: 1,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.primary.withOpacity(0.15)
                  : AppColor.primary.withOpacity(0.5),
              showSuffixIcon: false,
              suffixWidget: Container(),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "sort_by_lbl".tr + ": ".tr,
                    maxLines: 1,
                    style: TextStyleX.subHeading1(context).copyWith(
                      fontSize: AppTextSizes.headerText3(),
                    ),
                  ),
                ),
                Obx(() {
                  return Container(
                    height: AppRatioSize.getRatioHeight() / 25,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.primary, width: 1),
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.primary.withOpacity(0.15)
                          : AppColor.primary.withOpacity(0.55),
                    ),
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(12),
                      underline: Container(),
                      padding: EdgeInsets.zero,
                      style: TextStyleX.subHeading2BlueGrey(context).copyWith(
                        fontSize: AppTextSizes.headerText4(),
                      ),
                      dropdownColor:
                          Theme.of(context).brightness == Brightness.light
                              ? AppColor.white
                              : AppColor.blackShade,
                      value: controller.selectedSortValue.value,
                      items: <String>[
                        'Date',
                        'Price',
                        'Rating',
                        'Views',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedSortValue.value = value!;
                      },
                    ),
                  );
                })
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          controller.selectedTypeOfAdvertisement.value ==
                      controller.typeOfAdvertisementList[3] ||
                  controller.selectedTypeOfAdvertisement.value ==
                      controller.typeOfAdvertisementList[4]
              ? Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          "Price Range: ".tr,
                          maxLines: 1,
                          style: TextStyleX.subHeading1(context).copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.black
                                    : AppColor.black,
                            fontSize: AppTextSizes.headerText3(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2,
                        child: Row(
                          children: [
                            Flexible(
                              child: AppTextField(
                                showLabel: false,
                                hintText: "min".tr,
                                controller: controller.minPriceController,
                                showBoarder: true,
                                shadowOpacity: 0,
                                boarderColor: AppColor.primary,
                                boarderWeight: 1,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.primary.withOpacity(0.15)
                                    : AppColor.primary.withOpacity(0.5),
                                showSuffixIcon: false,
                                suffixWidget: Container(),
                              ),
                            ),
                            AppRatioSpaces.horizontalSectionSpaceXXXS(),
                            Flexible(
                              child: AppTextField(
                                showLabel: false,
                                hintText: "max".tr,
                                controller: controller.maxPriceController,
                                showBoarder: true,
                                shadowOpacity: 0,
                                boarderColor: AppColor.primary,
                                boarderWeight: 1,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.primary.withOpacity(0.15)
                                    : AppColor.primary.withOpacity(0.5),
                                showSuffixIcon: false,
                                suffixWidget: Container(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          AppRatioSpaces.verticalSectionSpaceMF(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    action: () {
                      Navigator.pop(context);
                    },
                    text: "Close",
                    primary: false,
                    txtColor: AppColor.primary,
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceS(),
                Expanded(
                  child: AppButton(
                    action: () {
                      Navigator.pop(context);

                      controller.adItemListGet(
                          controller.selectedTypeOfAdvertisement.value);
                      Get.to(() => const GYMAdItemListView(),
                          duration: const Duration(milliseconds: 500),
                          transition: Transition.fadeIn);
                    },
                    text: "Find",
                    btnColor: AppColor.primary,
                    txtColor: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
    );
  }
}
