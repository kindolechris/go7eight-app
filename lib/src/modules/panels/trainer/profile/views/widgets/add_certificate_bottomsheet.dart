import 'dart:io';
import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_edit_profile_controller.dart';

class AddCertificateBottomSheet extends GetView<TrainerEditProfileController> {
  const AddCertificateBottomSheet({super.key});

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
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    "add_certificate_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context).copyWith(
                      fontSize: AppTextSizes.titleText5(),
                    ),
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
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.blackShade
                          : AppColor.creamColor,
                      scale: 1.2,
                    ),
                  ),
                )
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textEditField(context,
                    label: "Name of the Certificate",
                    hint: "Enter your certificate title",
                    textEditingController: controller.certificateName,
                    showError: controller.showLastNameError.value,
                    showSuffix: false,
                    suffixWidget: Container()),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                Text(
                  "image_lbl".tr,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleX.subHeading2BlueGrey(context).copyWith(
                    color: AppColor.primary,
                  ),
                ),
                Text(
                  "certificate_upload_message".tr,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleX.subHeading2(context).copyWith(
                    fontSize: AppTextSizes.headerText4(),
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Obx(() {
                    return controller.certificateImagePath.value == ""
                        ? Container(
                            width: AppRatioSize.getRatioWidth(),
                            height: AppRatioSize.getRatioHeight() / 3.5,
                            decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.primary.withOpacity(0.15)
                                    : AppColor.primary.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColor.primary)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: AppRatioSize.getRatioWidth() / 44),
                                  child: Image.asset(
                                    AppIcon.addImageIcon,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColor.primary
                                        : AppColor.primary,
                                    scale: 1.8,
                                  ),
                                ),
                                Text(
                                  "add_image_lbl".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleX.subHeading2BlueGrey(context)
                                      .copyWith(
                                    fontSize: AppTextSizes.headerText2(),
                                  ),
                                ),
                                Text("upload_image_message".tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleX.subHeading2(context)),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: AppRatioSize.getRatioWidth(),
                            height: AppRatioSize.getRatioHeight() / 3.5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(controller.certificateImagePath.value),
                                  fit: BoxFit.cover,
                                )),
                          );
                  }),
                )
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceL(),
          _bottomNavBarButtons(context)
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
      boarderColor: AppColor.boarderBlueGrey,
      shadowOpacity: 0,
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
            },
            text: "cancel_lbl",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.primary,
            primary: false,
          )),
          AppRatioSpaces.horizontalSectionSpaceXS(),
          Expanded(
              child: AppButton(
            action: () {
              controller.assignCertificateImageToList();
              SnackBarX.showSuccess(
                  title: "certificate_added_snack_title",
                  message: "certificate_added_snack_message");
              Navigator.pop(context);
            },
            text: "save_btn_lbl",
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
