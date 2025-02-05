
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';

import '../../../global_widgets/animated_alert_dialog.dart';
import '../controllers/trainer_advertisement_controller.dart';

class TrainerAdvertisementRequestView extends StatefulWidget {
  const TrainerAdvertisementRequestView({super.key});

  @override
  State<TrainerAdvertisementRequestView> createState() =>
      _TrainerAdvertisementRequestViewState();
}

class _TrainerAdvertisementRequestViewState
    extends State<TrainerAdvertisementRequestView> {
  final TrainerAdvertisementController _controller =
      Get.put(TrainerAdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "my_ad_req_lbl",
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
              AppRatioSpaces.verticalSectionSpaceM(),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 24),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: AppContainerWidget(
                              disableDefaultHPadding: true,
                              disableDefaultVPadding: true,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: AppNetworkImage(
                                      imagePath:
                                          "${_controller.adImageList[index].imagePath}",
                                      height:
                                          AppRatioSize.getRatioHeight() / 5.5,
                                      width: double.infinity,
                                      borderRadius: 12,
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppRatioSize.getRatioWidth() /
                                                  44),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: AppButton(
                                              action: () {
                                                _openAlertBox(
                                                    context: context,
                                                    title:
                                                        "advertisement_removal_message",
                                                    description: "",
                                                    icon: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: AppColor
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2)),
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    4),
                                                            child: Icon(
                                                              Icons
                                                                  .block_outlined,
                                                              color: AppColor
                                                                  .darkGrey,
                                                              size: AppRatioSize
                                                                      .getRatioWidth() /
                                                                  12,
                                                            )),
                                                      ],
                                                    ),
                                                    buttonWidget: SizedBox(
                                                      height: AppRatioSize
                                                              .getRatioHeight() /
                                                          18,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: AppButton(
                                                              action: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              text:
                                                                  "cancel_lbl",
                                                              btnColor: Theme.of(
                                                                              context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? AppColor
                                                                      .textBlueGrey
                                                                  : AppColor
                                                                      .grey,
                                                              primary: false,
                                                              txtColor: Theme.of(
                                                                              context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? AppColor
                                                                      .textBlueGrey
                                                                  : AppColor
                                                                      .grey,
                                                            ),
                                                          ),
                                                          AppRatioSpaces
                                                              .horizontalSectionSpaceS(),
                                                          Expanded(
                                                            child: AppButton(
                                                              action: () {
                                                                SnackBarX.showWarning(
                                                                    title:
                                                                        "advertisement_requests_snack_title",
                                                                    message:
                                                                        "advertisement_requests_snack_message");
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              text:
                                                                  "lbl_btn_confirm",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              },
                                              text: "remove_title",
                                              buttonHeight: AppRatioSize
                                                      .getRatioHeight() /
                                                  20,
                                              fontSize:
                                                  AppTextSizes.headerText2(),
                                              primary: false,
                                              btnColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColor.blackShade
                                                  : AppColor.grey,
                                              txtColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColor.blackShade
                                                  : AppColor.grey,
                                            ),
                                          ),
                                          AppRatioSpaces
                                              .horizontalSectionSpaceXXS(),
                                          Expanded(
                                            child: AppButton(
                                              action: () {
                                                _openAlertBox(
                                                    context: context,
                                                    title:
                                                        "advertisement_request_message",
                                                    description: "",
                                                    icon: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: AppColor
                                                                    .macroGreen
                                                                    .withOpacity(
                                                                        0.2)),
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    4),
                                                            child: Icon(
                                                              Icons.check,
                                                              color: AppColor
                                                                  .macroGreen,
                                                              size: AppRatioSize
                                                                      .getRatioWidth() /
                                                                  12,
                                                            ))
                                                      ],
                                                    ),
                                                    buttonWidget: SizedBox(
                                                      height: AppRatioSize
                                                              .getRatioHeight() /
                                                          18,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: AppButton(
                                                              action: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              text:
                                                                  "cancel_lbl",
                                                              btnColor: Theme.of(
                                                                              context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? AppColor
                                                                      .textBlueGrey
                                                                  : AppColor
                                                                      .grey,
                                                              primary: false,
                                                              txtColor: Theme.of(
                                                                              context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? AppColor
                                                                      .textBlueGrey
                                                                  : AppColor
                                                                      .grey,
                                                            ),
                                                          ),
                                                          AppRatioSpaces
                                                              .horizontalSectionSpaceS(),
                                                          Expanded(
                                                            child: AppButton(
                                                              action: () {
                                                                SnackBarX.showSuccess(
                                                                    title:
                                                                        "advertisement_requests_snack_title",
                                                                    message:
                                                                        "advertisement_re_requests_snack_message");
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              text:
                                                                  "lbl_btn_confirm",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              },
                                              text: "re_request_lbl",
                                              buttonHeight: AppRatioSize
                                                      .getRatioHeight() /
                                                  20,
                                              fontSize:
                                                  AppTextSizes.headerText2(),
                                              primary: false,
                                              btnColor: AppColor.primary,
                                              txtColor: AppColor.primary,
                                            ),
                                          ),
                                        ],
                                      )),
                                  AppRatioSpaces.verticalSectionSpaceXS(),
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }

  Future _openAlertBox(
      {required BuildContext context,
      required Widget icon,
      required Widget buttonWidget,
      required String title,
      required String description}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: AppColor.black.withOpacity(0.7),
        builder: (_) {
          return AnimatedAlertDialog(
            title: title,
            description: description,
            icon: icon,
            titleColor: AppColor.primary,
            buttonWidget: buttonWidget,
          );
        });
  }
}
