import 'dart:io';
import 'package:go7eight/src/modules/panels/trainer/profile/views/widgets/overview_widget.dart';

import '../../../../../core/app_export.dart';
import '../../../global_widgets/general_app_bar.dart';
import '../controllers/trainer_edit_profile_controller.dart';
import 'widgets/add_certificate_bottomsheet.dart';

class TrainerCertificateView extends GetView<TrainerEditProfileController> {
  const TrainerCertificateView({super.key});

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
          title: "cert_and_overview_title",
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
                  child: AppSectionTitle(
                    title: "cert_and_training_lbl",
                    showViewAll: true,
                    disableDefaultHPadding: true,
                    titleColor: AppColor.primary,
                    secondaryOptionText: "add_lbl",
                    onTapViewAll: () {
                      controller.certificateImagePath.value = "";
                      controller.certificateName.text = "";
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: false,
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
                              child: const AddCertificateBottomSheet());
                        },
                      );
                    },
                  ),
                ),
                Obx(() {
                  return controller.certificateImagePathList.isEmpty
                      ? Container()
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.certificateImagePathList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: AppRatioSize.getRatioWidth() / 24,
                                right: AppRatioSize.getRatioWidth() / 24,
                                bottom: 8,
                              ),
                              child: AppContainerWidget(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.certificateTitleList[index]
                                              .tr,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              TextStyleX.subHeading2BlueGrey(
                                                  context),
                                        ),
                                        _editProfileImageIconButton(context)
                                      ],
                                    ),
                                    AppRatioSpaces.verticalSectionSpaceXXXS(),
                                    SizedBox(
                                      width: AppRatioSize.getRatioWidth(),
                                      height:
                                          AppRatioSize.getRatioHeight() / 3.5,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.file(
                                            File(
                                              controller.certificateImagePathList[index],
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                }),
                const TrainerOverviewWidget(),
                AppRatioSpaces.verticalSectionSpaceM(),
              ],
            )),
        bottomNavigationBar: _bottomNavBarButtons(context),
      ),
    );
  }

  Widget _editProfileImageIconButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.primary.withOpacity(0.15)
              : AppColor.primary.withOpacity(0.25),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          AppIcon.edit2Icon,
          color: AppColor.primary,
          scale: 1,
        ));
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
              SnackBarX.showSuccess(
                  title: "profile_verification_snack_title",
                  message: "profile_verification_snack_message");
              Navigator.pop(context);
            },
            text: "request_for_approve_btn_lbl",
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
