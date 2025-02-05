import 'dart:io';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/gym_advertisement_controller.dart';
import 'widgets/ad_item_filter_bottomsheet.dart';

class GYMAddAdvertisementView extends GetView<GYMAdvertisementController> {
  const GYMAddAdvertisementView({super.key});

  @override
  Widget build(BuildContext context) {
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
        appBar: fitnofyGeneralAppBar(
          context,
          showAddIcon: false,
          title: "post_ad_title",
          showLeading: true,
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
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: AppTextField(
                    showLabel: true,
                    labelText: "advertisement_title_lbl".tr,
                    hintText: "advertisement_title_hint".tr,
                    controller: controller.adBannerTitleController,
                    showBoarder: true,
                    shadowOpacity: 0,
                    boarderColor: AppColor.boarderBlueGrey,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? AppColor.lightBlueGrey.withOpacity(0.1)
                            : AppColor.black,
                    showSuffixIcon: false,
                    suffixWidget: Container(),
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  width: Get.width,
                  child: Text(
                    "ad_image_lbl".tr,
                    style: TextStyleX.header1(context).copyWith(
                        fontSize: AppTextSizes.headerText3(),
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.primary
                            : AppColor.primary,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                GestureDetector(
                  onTap: () {
                    controller.selectImage();
                  },
                  child: Obx(() {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppRatioSize.getRatioWidth() / 24),
                      height: AppRatioSize.getRatioHeight() / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.primary.withOpacity(0.15)
                                  : AppColor.primary.withOpacity(0.5),
                          border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.primary
                                    : AppColor.primary,
                          )),
                      child: controller.selectedAdImagePath.value != ""
                          ? Stack(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      File(
                                          controller.selectedAdImagePath.value),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                _editProfileImageIconButton(context)
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  width: AppRatioSize.getRatioWidth() / 8,
                                  height: AppRatioSize.getRatioWidth() / 8,
                                  child: Image.asset(
                                    AppIcon.addImageIcon,
                                    color: AppColor.primary,
                                  ),
                                ),
                                Text(
                                  "1280x480",
                                  style: TextStyleX.subHeading2BlueGrey(context)
                                      .copyWith(
                                    fontSize: AppTextSizes.headerText4(),
                                  ),
                                ),
                                Text(
                                  "upload_image_message".tr,
                                  style:
                                      TextStyleX.subHeading2(context).copyWith(
                                    fontSize: AppTextSizes.headerText3(),
                                  ),
                                ),
                              ],
                            ),
                    );
                  }),
                ),
                AppRatioSpaces.verticalSectionSpaceS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  width: Get.width,
                  child: Row(
                    children: [
                      Text(
                        "what_you_want_to_promote_lbl".tr,
                        style: TextStyleX.header1(context).copyWith(
                            fontSize: AppTextSizes.headerText3(),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.primary
                                    : AppColor.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " (${"option_lbl".tr})",
                        style: TextStyleX.subHeading2(context).copyWith(
                            fontSize: AppTextSizes.headerText3(),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 24),
                    height: AppRatioSize.getRatioHeight() / 12,
                    width: Get.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.typeOfAdvertisementList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            return GestureDetector(
                                onTap: () {
                                  controller
                                          .selectedTypeOfAdvertisement.value =
                                      controller
                                          .typeOfAdvertisementList[index];
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: index ==
                                              (controller
                                                      .typeOfAdvertisementList
                                                      .length -
                                                  1)
                                          ? Directionality.of(context) ==
                                                  TextDirection.rtl
                                              ? 0
                                              : 10
                                          : 0,
                                      top: 4,
                                      bottom: 4,
                                      left: index == 0
                                          ? Directionality.of(context) ==
                                                  TextDirection.rtl
                                              ? 8
                                              : 0
                                          : 8),
                                  height: AppRatioSize.getRatioHeight() / 9.5,
                                  width: AppRatioSize.getRatioWidth() / 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        color: controller
                                                    .selectedTypeOfAdvertisement
                                                    .value ==
                                                controller
                                                        .typeOfAdvertisementList[
                                                    index]
                                            ? AppColor.primary
                                            : Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? AppColor.primary
                                                    .withOpacity(0.15)
                                                : AppColor.primary
                                                    .withOpacity(0.5),
                                        border: Border.all(
                                          color:
                                              Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? AppColor.primary
                                                  : AppColor.primary,
                                        )),
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.typeOfAdvertisementList[index]
                                          .tr,
                                      style: TextStyleX.subHeading3(context),
                                    ),
                                  ),
                                ));
                          });
                        })),
                Obx(() {
                  return (controller.selectedAdItem.value.id != null &&
                          (controller.selectedTypeOfAdvertisement.value !=
                                  controller.typeOfAdvertisementList[0] &&
                              controller.selectedTypeOfAdvertisement.value !=
                                  controller.typeOfAdvertisementList[5] &&
                              controller.selectedTypeOfAdvertisement.value !=
                                  controller.typeOfAdvertisementList[6] &&
                              controller.selectedTypeOfAdvertisement.value !=
                                  controller.typeOfAdvertisementList[7]))
                      ? Column(
                          children: [
                            AppRatioSpaces.verticalSectionSpaceXXXS(),
                            Container(
                              padding: EdgeInsets.all(
                                AppRatioSize.getRatioWidth() / 44,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      AppRatioSize.getRatioWidth() / 25),
                              decoration: BoxDecoration(
                                  color: AppColor.primary.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: AppColor.primary)),
                              child: Row(
                                children: [
                                  AppNetworkImage(
                                      width:
                                          AppRatioSize.getRatioWidth() / 7.5,
                                      height:
                                          AppRatioSize.getRatioWidth() / 7.5,
                                      showBoarder: false,
                                      borderRadius: 8,
                                      imagePath:
                                          "${controller.selectedAdItem.value.iconPath}"),
                                  AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.selectedAdItem.value.name}"
                                              .tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyleX.subHeading3(context)
                                              .copyWith(
                                            fontSize:
                                                AppTextSizes.headerText3(),
                                          ),
                                        ),
                                        Text(
                                          "${controller.selectedAdItem.value.price}"
                                              .tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyleX.subHeading3(context)
                                              .copyWith(
                                            fontSize:
                                                AppTextSizes.headerText4(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container();
                }),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                Obx(() {
                  return (controller.selectedTypeOfAdvertisement.value ==
                              controller.typeOfAdvertisementList[0] ||
                          controller.selectedTypeOfAdvertisement.value ==
                              controller.typeOfAdvertisementList[5] ||
                          controller.selectedTypeOfAdvertisement.value ==
                              controller.typeOfAdvertisementList[6] ||
                          controller.selectedTypeOfAdvertisement.value ==
                              controller.typeOfAdvertisementList[7])
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppRatioSize.getRatioWidth() / 24),
                          child: AppTextField(
                            showLabel: true,
                            labelText: "specification_lbl".tr,
                            hintText: "specification_hint".tr,
                            controller: controller.specifyAdController,
                            showBoarder: true,
                            shadowOpacity: 0,
                            boarderColor: AppColor.boarderBlueGrey,
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.lightBlueGrey.withOpacity(0.1)
                                    : AppColor.black,
                            showSuffixIcon: false,
                            suffixWidget: Container(),
                          ),
                        )
                      : GestureDetector(
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
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: const AdItemFilterBottomSheet(),
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: AppRatioSize.getRatioWidth() / 24),
                            padding: EdgeInsets.symmetric(
                                vertical: AppRatioSize.getRatioHeight() / 88),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.primary.withOpacity(0.15)
                                    : AppColor.primary.withOpacity(0.5),
                                border: Border.all(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.primary
                                      : AppColor.primary,
                                )),
                            alignment: Alignment.center,
                            child: Text(
                                "${"select_lbl".tr} ${controller.selectedTypeOfAdvertisement.value
                                        .tr} ${"for_ad_lbl".tr}",
                                style: TextStyleX.subHeading3(context)),
                          ),
                        );
                }),
                AppRatioSpaces.verticalSectionSpaceMF(),
              ],
            )
            // PreferenceView(isEditMode: true,)
            ),
        bottomNavigationBar: _bottomNavBar(context),
      ),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 10,
      child: Column(
        children: [
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    action: () {
                      SnackBarX.showSuccess(
                          title: "advertisement_post_lbl",
                          message: "advertisement_post_message");
                      Navigator.pop(context);
                    },
                    text: "post_btn_lbl",
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

  Widget _editProfileImageIconButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(top: 8, right: 8),
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.offWhite
                      : AppColor.blackShade,
                  width: 2)),
          child: Icon(
            Icons.edit_calendar_rounded,
            color: AppColor.white,
            size: AppRatioSize.getRatioWidth() / 24,
          )),
    );
  }
}
