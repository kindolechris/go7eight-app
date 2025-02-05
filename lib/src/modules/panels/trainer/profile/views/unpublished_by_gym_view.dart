
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/trainer_profile_controller.dart';

class TrainerUnpublishedListView extends GetView<TrainerProfileController> {
  final SessionType sessionType;

  const TrainerUnpublishedListView({super.key, required this.sessionType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          title: "unpublished_list_lbl", showAddIcon: false, showLeading: true),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          AppRatioSpaces.verticalSectionSpaceS(),
          Obx(() {
            return AppTabBar(
                onChange: (value) {
                  controller.isChallengesSelected.value = value;
                },
                isFirstOptionSelected: controller.isChallengesSelected.value,
                horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                optionOneText: "challenges_title",
                optionTwoText: "sessions_title");
          }),
          AppRatioSpaces.verticalSectionSpaceS(),
          Obx(() {
            return controller.isChallengesSelected.value == true
                ? Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 24),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.gotoChallengeDetails(
                                  challenge:
                                      controller.unpublishedChallenges[index],
                                  sessionType: sessionType);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: AppContainerWidget(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        AppNetworkImage(
                                          imagePath:
                                              "${controller.unpublishedChallenges[index].imagePath}",
                                          width: AppRatioSize.getRatioWidth() /
                                              4.5,
                                          height: AppRatioSize.getRatioWidth() /
                                              7.5,
                                          borderRadius: 12,
                                        ),
                                        AppRatioSpaces
                                            .horizontalSectionSpaceXS(),
                                        Expanded(
                                            child: _titlePriceTextWidget(
                                                context,
                                                title:
                                                    "${controller.unpublishedChallenges[index].title}",
                                                price:
                                                    "${controller.unpublishedChallenges[index].price}"))
                                      ],
                                    ),
                                    const Divider(
                                      color: AppColor.lightGrey,
                                      thickness: 1.5,
                                    ),
                                    _bottomActionsWidget(context,
                                        isChallengeType: true,
                                        addFunction:
                                            controller.onSessionAddClick,
                                        editFunction:
                                            controller.onChallengeEditClick,
                                        deleteFunction: () {
                                      actionsAlertBox(
                                          context: context,
                                          title: "delete_challenge_message",
                                          description: "",
                                          icon: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: AppColor.macroGreen
                                                          .withOpacity(0.2)),
                                                  padding: const EdgeInsets.all(4),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: AppColor.macroGreen,
                                                    size: AppRatioSize
                                                            .getRatioWidth() /
                                                        12,
                                                  ))
                                            ],
                                          ),
                                          buttonWidget: SizedBox(
                                            height:
                                                AppRatioSize.getRatioHeight() /
                                                    18,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: AppButton(
                                                    action: () {
                                                      Navigator.pop(context);
                                                    },
                                                    text: "cancel_lbl",
                                                    btnColor: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? AppColor.textBlueGrey
                                                        : AppColor.grey,
                                                    primary: false,
                                                    txtColor: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? AppColor.textBlueGrey
                                                        : AppColor.grey,
                                                  ),
                                                ),
                                                AppRatioSpaces
                                                    .horizontalSectionSpaceS(),
                                                Expanded(
                                                  child: AppButton(
                                                    action: () {
                                                      SnackBarX.showSuccess(
                                                          title:
                                                              "challenge_delete_snack_title",
                                                          message:
                                                              "challenge_delete_snack_message");
                                                      Navigator.pop(context);
                                                    },
                                                    text: "lbl_btn_confirm",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                    })
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 24),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: GestureDetector(
                              onTap: () {
                                controller.singleSessionClick(sessionType,
                                    controller.unpublishedSessions[index]);
                              },
                              child: AppContainerWidget(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        AppNetworkImage(
                                          imagePath:
                                              "${controller.unpublishedSessions[index].imagePath}",
                                          width: AppRatioSize.getRatioWidth() /
                                              4.5,
                                          height: AppRatioSize.getRatioWidth() /
                                              7.5,
                                          borderRadius: 12,
                                        ),
                                        AppRatioSpaces
                                            .horizontalSectionSpaceXS(),
                                        Expanded(
                                            child: _titlePriceTextWidget(
                                                context,
                                                title:
                                                    "${controller.unpublishedSessions[index].title}",
                                                price:
                                                    "${controller.unpublishedSessions[index].price}"))
                                      ],
                                    ),
                                    const Divider(
                                      color: AppColor.lightGrey,
                                      thickness: 1.5,
                                    ),
                                    _bottomActionsWidget(context,
                                        isChallengeType: false,
                                        addFunction: () {},
                                        editFunction:
                                            controller.onSessionEditClick,
                                        deleteFunction: () {
                                      actionsAlertBox(
                                          context: context,
                                          title: "delete_session_message",
                                          description: "",
                                          icon: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: AppColor.macroGreen
                                                          .withOpacity(0.2)),
                                                  padding: const EdgeInsets.all(4),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: AppColor.macroGreen,
                                                    size: AppRatioSize
                                                            .getRatioWidth() /
                                                        12,
                                                  ))
                                            ],
                                          ),
                                          buttonWidget: SizedBox(
                                            height:
                                                AppRatioSize.getRatioHeight() /
                                                    18,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: AppButton(
                                                    action: () {
                                                      Navigator.pop(context);
                                                    },
                                                    text: "cancel_lbl",
                                                    btnColor: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? AppColor.textBlueGrey
                                                        : AppColor.grey,
                                                    primary: false,
                                                    txtColor: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? AppColor.textBlueGrey
                                                        : AppColor.grey,
                                                  ),
                                                ),
                                                AppRatioSpaces
                                                    .horizontalSectionSpaceS(),
                                                Expanded(
                                                  child: AppButton(
                                                    action: () {
                                                      SnackBarX.showSuccess(
                                                          title:
                                                              "session_delete_snack_title",
                                                          message:
                                                              "session_delete_snack_message");
                                                      Navigator.pop(context);
                                                    },
                                                    text: "lbl_btn_confirm",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                    })
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
          }),
        ],
      ),
    );
  }

  Widget _titlePriceTextWidget(BuildContext context,
      {required String title, required String price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyleX.subHeading3(context),
        ),
        Row(
          children: [
            Text(
              "\$$price".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading3(context).copyWith(
                  color: AppColor.primary,
                  fontSize: AppTextSizes.titleText6()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }

  Widget _bottomActionsWidget(
    BuildContext context, {
    required bool isChallengeType,
    required Function() addFunction,
    required Function() editFunction,
    required Function() deleteFunction,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Row(
          children: [
            isChallengeType == false
                ? Container()
                : GestureDetector(
                    onTap: addFunction,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.width),
                        color:
                            Theme.of(context).brightness == Brightness.light
                                ? AppColor.primary.withOpacity(0.15)
                                : AppColor.primary.withOpacity(0.55),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColor.primary,
                        size: AppRatioSize.getRatioWidth() / 18,
                      ),
                    ),
                  ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            GestureDetector(
              onTap: editFunction,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width),
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary.withOpacity(0.15)
                      : AppColor.primary.withOpacity(0.55),
                ),
                child: Icon(
                  Icons.edit_note_rounded,
                  color: AppColor.primary,
                  size: AppRatioSize.getRatioWidth() / 18,
                ),
              ),
            ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            GestureDetector(
              onTap: deleteFunction,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width),
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.red.withOpacity(0.15)
                      : AppColor.red.withOpacity(0.55),
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: AppColor.red,
                  size: AppRatioSize.getRatioWidth() / 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
