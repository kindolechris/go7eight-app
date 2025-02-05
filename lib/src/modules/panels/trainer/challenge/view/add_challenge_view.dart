import 'dart:io';

import 'package:go7eight/src/core/app_export.dart';

import '../../../global_widgets/general_app_bar.dart';
import '../controllers/trainer_add_challenge_controller.dart';
import 'widgets/overview_bottomsheet.dart';

class TrainerAddChallengeView extends GetView<TrainerAddChallengeController> {
  final bool isCreate;
  const TrainerAddChallengeView({super.key, required this.isCreate});

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
          title: isCreate ? "create_challenge_title" : "edit_challenge_title",
          showViewIcon: true,
          visibility: true,
          iconViewAction: controller.gotoChallengeView,
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
                AppRatioSpaces.verticalSectionSpaceS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "add_challenge_thumb_lbl".tr,
                          style: TextStyleX.subHeading4(context).copyWith(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: AppTextSizes.headerText2(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: controller.selectImage,
                        child: Container(
                          padding:
                              EdgeInsets.all(AppRatioSize.getRatioWidth() / 44),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.lightBlueGrey.withOpacity(0.3)
                                    : AppColor.textBlueGrey,
                              )),
                          child: Obx(() {
                            return controller
                                        .selectedThumbnailImagePath.value ==
                                    ""
                                ? Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height:
                                              AppRatioSize.getRatioHeight() /
                                                  5.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? AppColor.lightBlueGrey
                                                    : AppColor.textBlueGrey,
                                              )),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.only(bottom: 4),
                                                width: AppRatioSize
                                                        .getRatioWidth() /
                                                    12,
                                                height: AppRatioSize
                                                        .getRatioWidth() /
                                                    12,
                                                child: Image.asset(
                                                    AppIcon.addImageIcon),
                                              ),
                                              Text(
                                                "500x300 Pixel",
                                                style: TextStyleX
                                                    .subHeading2BlueGrey(
                                                        context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      AppRatioSpaces.horizontalSectionSpaceS(),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "upload_constraint_txt".tr,
                                              textAlign: TextAlign.right,
                                              style: TextStyleX.subHeading3(
                                                      context)
                                                  .copyWith(
                                                fontSize:
                                                    AppTextSizes.headerText3(),
                                              ),
                                            ),
                                            AppRatioSpaces
                                                .verticalSectionSpaceXS(),
                                            AppButton(
                                                action: controller.selectImage,
                                                primary: false,
                                                txtColor: AppColor.primary,
                                                buttonHeight: AppRatioSize
                                                        .getRatioHeight() /
                                                    26,
                                                buttonWidth: AppRatioSize
                                                        .getRatioWidth() /
                                                    3.8,
                                                text: "select_file_btn_lbl")
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: AppRatioSize.getRatioHeight() / 5,
                                    width: Get.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(controller
                                            .selectedThumbnailImagePath.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textEditField(context,
                          label: "challenge_title_lbl",
                          hint: "challenge_title_hint",
                          textEditingController:
                              controller.challengetitleTextController,
                          showError: controller.showChallengeTitle.value,
                          showSuffix: false),
                      AppRatioSpaces.verticalSectionSpaceXXS(),
                      _textEditField(context,
                          label: "number_of_weeks_lbl",
                          hint: "number_of_weeks_hint",
                          textEditingController:
                              controller.numberOfWeeksTextController,
                          showError: controller.showChallengeTitle.value,
                          showSuffix: false),
                      AppRatioSpaces.verticalSectionSpaceXXS(),
                      AppSectionTitle(
                        title: "workout_type_lbl",
                        showViewAll: true,
                        disableDefaultHPadding: true,
                        titleColor: AppColor.primary,
                        secondaryOptionText: "add_lbl",
                        onTapViewAll: () {
                          final workoutTypeController = TextEditingController();
                          controller.workoutTypeListController
                              .add(workoutTypeController);
                        },
                      ),
                      Obx(() {
                        return ListView.builder(
                            itemCount:
                                controller.workoutTypeListController.length,
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
                                        controller: controller
                                            .workoutTypeListController[index],
                                        hintText:
                                            "Ex: Yoga/Cardio/Calisthenic",
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
                                        controller.workoutTypeListController
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
                              );
                            });
                      }),
                      _textEditField(context,
                          label: "price_lbl",
                          hint: "price_hint",
                          textEditingController:
                              controller.challengePriceTextController,
                          showError: controller.showChallengeTitle.value,
                          showSuffix: false),
                    ],
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceXXS(),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              "${"preference_qh_overview".tr}*",
                              style: TextStyleX.subHeading4(context).copyWith(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: AppTextSizes.headerText2(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          GestureDetector(
                            onTap: () {
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
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: const ChallengeAddOverviewBottomsheet());
                                },
                              );
                            },
                            child: Obx(() {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColor.textFieldBackground
                                        : AppColor.black,
                                    border: Border.all(
                                      color: AppColor.boarderBlueGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: controller.overviewText.value == ""
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "overview_hint".tr,
                                              style: TextStyleX.body1(context)
                                                  .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.grey,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: AppColor.grey,
                                          )
                                        ],
                                      )
                                    : Text(
                                      controller.overviewText.value,
                                      style: TextStyleX.body1(context)
                                          .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grey,
                                      ),
                                    ),
                              );
                            }),
                          ),
                        ])),
                AppRatioSpaces.verticalSectionSpaceMF(),
              ],
            )
            // PreferenceView(isEditMode: true,)
            ),
        bottomNavigationBar: _bottomNavBarButtons(context),
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
              Navigator.pop(context);
              SnackBarX.showSuccess(
                  title: isCreate
                      ? "challenge_creation_snack_title"
                      : "challenge_edit_snack_title",
                  message: isCreate
                      ? "challenge_creation_snack_message"
                      : "challenge_edit_snack_message");
            },
            text: isCreate ? "create_btn_lbl" : "edit_btn_lbl",
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
