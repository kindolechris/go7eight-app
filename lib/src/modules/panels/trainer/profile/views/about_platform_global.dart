import 'package:go7eight/src/core/app_export.dart';

import '../../../global_widgets/general_app_bar.dart';
import '../controllers/trainer_profile_controller.dart';

class GlobalAboutPlatformView extends GetView<TrainerProfileController> {
  const GlobalAboutPlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: fitnofyGeneralAppBar(context,
            title: "lbl_about", showLeading: true),
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
                child: AppContainerWidget(
                    child: Column(
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
                      valueText: controller.appName,
                      labelText: "app_name_lbl",
                    ),
                    _infoData(
                      context,
                      valueText: controller.appVersion,
                      labelText: "app_version_lbl",
                    ),
                    _infoData(
                      context,
                      valueText: controller.appSize,
                      labelText: "app_size_lbl",
                    ),
                    _infoData(
                      context,
                      valueText: controller.appUpdatedDate,
                      labelText: "latest_update_date_lbl",
                    ),
                    _infoData(context,
                        valueText: controller.appType,
                        labelText: "app_type_lbl"),
                    _infoData(context,
                        valueText: controller.appVersionType,
                        labelText: "version_type_lbl"),
                  ],
                )),
              )
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
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
