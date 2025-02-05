import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import 'package:go7eight/src/modules/panels/gym/profile/controllers/gym_profile_controller.dart';

class GYMAboutPlatformView extends GetView<GYMProfileController> {
  const GYMAboutPlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: Obx(() {
          return fitnofyGeneralAppBar(
            context,
            title: "about_platform_lbl",
            showLeading: true,
            showViewIcon: true,
            visibility: !controller.viewAboutSection.value,
            iconViewAction: () {
              controller.viewAboutSection.value =
                  !controller.viewAboutSection.value;
            },
          );
        }),
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
                child: AppContainerWidget(child: Obx(() {
                  return controller.viewAboutSection.value == false
                      ? Column(
                          children: [
                            Image.asset(
                              AppImage.logoLight,
                              scale: 2.2,
                              fit: BoxFit.cover,
                              color: AppColor.primary,
                            ),
                            AppRatioSpaces.verticalSectionSpaceM(),
                            _textField(context,
                                textEditingController: controller.appName,
                                labelText: "app_name_lbl",
                                hint: "app_name_hint"),
                            _textField(context,
                                textEditingController: controller.appVersion,
                                labelText: "app_version_lbl",
                                hint: "app_version_hint"),
                            _textField(context,
                                textEditingController: controller.appSize,
                                labelText: "app_size_lbl",
                                hint: "app_size_hint"),
                            _textField(context,
                                textEditingController:
                                    controller.appUpdatedDate,
                                labelText: "latest_update_date_lbl",
                                hint: "latest_update_date_hint"),
                            _textField(context,
                                textEditingController: controller.appType,
                                labelText: "app_type_lbl",
                                hint: "app_type_hint"),
                            _textField(context,
                                textEditingController:
                                    controller.appVersionType,
                                labelText: "version_type_lbl",
                                hint: "version_type_hint"),
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              AppImage.logoLight,
                              scale: 2.2,
                              fit: BoxFit.cover,
                              color: AppColor.primary,
                            ),
                            AppRatioSpaces.verticalSectionSpaceM(),
                            _infoData(
                              context,
                              valueText: controller.appName.text,
                              labelText: "app_name_lbl",
                            ),
                            _infoData(
                              context,
                              valueText: controller.appVersion.text,
                              labelText: "app_version_lbl",
                            ),
                            _infoData(
                              context,
                              valueText: controller.appSize.text,
                              labelText: "app_size_lbl",
                            ),
                            _infoData(
                              context,
                              valueText: controller.appUpdatedDate.text,
                              labelText: "latest_update_date_lbl",
                            ),
                            _infoData(context,
                                valueText: controller.appType.text,
                                labelText: "app_type_lbl"),
                            _infoData(context,
                                valueText: controller.appVersionType.text,
                                labelText: "version_type_lbl"),
                          ],
                        );
                })),
              )
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }

  Widget _textField(BuildContext context,
      {required TextEditingController textEditingController,
      required String hint,
      required String labelText}) {
    return AppTextField(
      hintText: hint.tr,
      controller: textEditingController,
      showLabel: true,
      labelText: labelText.tr,
      shadowOpacity: 0,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showBoarder: true,
      boarderColor: AppColor.boarderBlueGrey,
    );
  }

  Widget _infoData(BuildContext context,
      {required String labelText, required String valueText}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${labelText.tr}:",
            style: TextStyleX.subHeading2(context).copyWith(
              fontSize: AppTextSizes.headerText2(),
            ),
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          Text(
            valueText.tr,
            textAlign: TextAlign.right,
            style: TextStyleX.subHeading2BlueGrey(context).copyWith(
              fontSize: AppTextSizes.headerText2(),
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
