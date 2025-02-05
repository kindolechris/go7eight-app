import 'dart:io';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/bottom_nav_action.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import 'package:go7eight/src/modules/panels/global_widgets/overview_container_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/radio_button_option.dart';
import '../controllers/gym_edit_profile_controller.dart';

class GYMEditProfileView extends GetView<GYMEditProfileController> {
  const GYMEditProfileView({super.key});

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
        appBar: fitnofyGeneralAppBar(context,
            showAddIcon: false, title: "edit_profile_title", showLeading: true
            // backButtonAction: _preferenceController.backClick
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
                _basicProfilePreferenceForm(context),
                AppRatioSpaces.verticalSectionSpaceM(),
              ],
            )
            // PreferenceView(isEditMode: true,)
            ),
        bottomNavigationBar: BottomNavAction(
          actionText: "save_changes_lbl",
          action: controller.saveProfileChanges,
        ),
      ),
    );
  }

  Widget _basicProfilePreferenceForm(BuildContext context) {
    return Obx(() {
      return Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GestureDetector(
                  onTap: () {
                    _showSourceSelectionPopUp(context, isProfileImage: false);
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: AppRatioSize.getRatioWidth() / 12,
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 7.5,
                          child: Obx(() {
                            return controller.selectedCoverImagePath.value == ""
                                ? AppNetworkImage(
                                    imagePath:
                                        "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697115941/gym/Rectangle_22498_rwl1g4.png",
                                    height: Get.height / 3,
                                    width: Get.width,
                                    borderRadius: 12,
                                  )
                                : Image.file(
                                    File(controller
                                        .selectedCoverImagePath.value),
                                    fit: BoxFit.cover,
                                  );
                          }),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 12, right: 12),
                          child: _editProfileImageIconButton(context))
                    ],
                  ),
                ),
                _imageSelectionWidget(context),
              ],
            ),
            AppRatioSpaces.verticalSectionSpaceM(),
            _textEditField(context,
                label: "gym_name_lbl",
                hint: "gym_name_hint",
                textEditingController: controller.gymNameTextController,
                showError: controller.showFirstNameError.value,
                showSuffix: false,
                suffixWidget: Container()),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _textEditField(context,
                label: "email_text",
                hint: "email_hint_text",
                textEditingController: controller.emailTextController,
                showError: controller.showLastNameError.value,
                showSuffix: false,
                suffixWidget: Container()),
          ],
        ),
      );
    });
  }

  Widget _imageSelectionWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSourceSelectionPopUp(context, isProfileImage: true);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _selectedImageWidget(context),
          _editProfileImageIconButton(context)
        ],
      ),
    );
  }

  Widget _selectedImageWidget(BuildContext context) {
    return Obx(() {
      return Hero(
        tag: "profileImage_user",
        child: Container(
          height: AppRatioSize.getRatioWidth() / 5.5,
          width: AppRatioSize.getRatioWidth() / 5.5,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.grey.withOpacity(0.3)
                  : AppColor.darkGrey,
              borderRadius: BorderRadius.circular(Get.width),
              border: Border.all(color: AppColor.primary, width: 2)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(Get.width),
              child: controller.selectedProfileImagePath.value == ""
                  ? AppNetworkImage(
                      width: AppRatioSize.getRatioWidth() / 4,
                      height: AppRatioSize.getRatioWidth() / 4,
                      showBoarder: true,
                      boarderWidth: 0,
                      boarderColorLight: AppColor.white,
                      boarderColorDark: AppColor.black,
                      imagePath:
                          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697113995/gym/Rectangle_4522_dlhmzj.png")
                  : Image.file(
                      File(controller.selectedProfileImagePath.value),
                      fit: BoxFit.cover,
                    )),
        ),
      );
    });
  }

  Widget _editProfileImageIconButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                width: 3)),
        child: Image.asset(
          AppIcon.editIcon,
          color: AppColor.white,
          height: AppRatioSize.getRatioWidth() / 24,
        ));
  }

  Future _showSourceSelectionPopUp(BuildContext context,
      {required bool isProfileImage}) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        builder: (context) {
          return OverviewContainerWidget(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    "select_media_type".tr,
                    style: TextStyleX.subHeading1(context),
                  ),
                ),
                RadioButtonOption(
                  controller.imageSourceOptionData,
                  onChanged: (value) {
                    controller.selectedImageSourceOption.value = value;
                  },
                  title: '',
                  showDescription: true,
                ),
                _popUpButtonSection(context, isProfileImage),
                AppRatioSpaces.verticalSectionSpaceS()
              ],
            ),
          );
        });
  }

  Widget _popUpButtonSection(BuildContext context, bool isProfileImage) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: AppButton(
            action: () {
              Navigator.pop(context);
            },
            text: 'cancel_lbl',
            txtColor: AppColor.primary,
            buttonHeight: AppRatioSize.getRatioHeight() / 18,
            primary: false,
          ),
        ),
        AppRatioSpaces.horizontalSectionSpaceXS(),
        Expanded(
          flex: 1,
          child: AppButton(
            action: () async {
              Navigator.pop(context);
              controller.selectImage(isProfileImage);
            },
            text: "lbl_btn_continue",
            buttonHeight: AppRatioSize.getRatioHeight() / 18,
          ),
        ),
      ],
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
}
