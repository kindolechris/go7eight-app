import 'package:go7eight/src/modules/language/view/language_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_signature_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/profile_item_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/profile_option_widget.dart';
import '../../../../../core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/gym_profile_controller.dart';
import 'widgets/gym_profile_image_widget.dart';

class GYMProfileView extends GetView<GYMProfileController> {
  const GYMProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "gym_profile",
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            AppRatioSpaces.verticalSectionSpaceM(),
            const GYMProfileImageWidget(),
            AppRatioSpaces.verticalSectionSpaceM(),
            ProfileItemWidget(
              title: "account_lbl",
              listChild: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.profileOptions.length,
                    itemBuilder: (context, index) {
                      return ProfileOptionWidget(
                        option: controller.profileOptions[index],
                        isLast: index == (controller.profileOptions.length - 1),
                        rightWidget:
                            controller.profileOptions[index].iconRight!,
                      );
                    });
              }),
            ),
            AppRatioSpaces.verticalSectionSpaceM(),
            ProfileItemWidget(
              title: "administrator_lbl",
              listChild: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.adminOptions.length,
                    itemBuilder: (context, index) {
                      return ProfileOptionWidget(
                        option: controller.adminOptions[index],
                        isLast: index == (controller.adminOptions.length - 1),
                        rightWidget: controller.adminOptions[index].iconRight!,
                      );
                    });
              }),
            ),
            AppRatioSpaces.verticalSectionSpaceS(),
            ProfileItemWidget(
              title: "history_lbl",
              listChild: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.historyOptions.length,
                    itemBuilder: (context, index) {
                      return ProfileOptionWidget(
                        option: controller.historyOptions[index],
                        isLast: index == (controller.historyOptions.length - 1),
                        rightWidget:
                            controller.historyOptions[index].iconRight!,
                      );
                    });
              }),
            ),
            AppRatioSpaces.verticalSectionSpaceS(),
            ProfileItemWidget(
              title: "setting_lbl",
              listChild: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: controller.settingOptions.length,
                    itemBuilder: (context, index) {
                      return ProfileOptionWidget(
                        option: controller.settingOptions[index],
                        isLast: index == (controller.settingOptions.length - 1),
                        rightWidget:
                            index == (controller.settingOptions.length - 1)
                                ? SizedBox(
                                    height: AppRatioSize.getRatioWidth() / 16,
                                    width: AppRatioSize.getRatioWidth() / 8,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: CupertinoSwitch(
                                        value: controller.isDarkMode.value,
                                        activeColor: AppColor.primary,
                                        onChanged: (value) {
                                          controller.toggleTheme();
                                        },
                                      ),
                                    ))
                                : controller.settingOptions[index].iconRight!,
                      );
                    });
              }),
            ),
            AppRatioSpaces.verticalSectionSpaceS(),
            const LanguageView(),
            AppRatioSpaces.verticalSectionSpaceM(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: AppButton(
                action: controller.logoutPressed,
                text: "logout_lbl",
                boarderRadius: 18,
                primary: false,
                btnColor: AppColor.red,
                txtColor: AppColor.red,
                fontSize: AppTextSizes.headerText1(),
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceXS(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: Divider(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.grey.withOpacity(0.5)
                    : AppColor.darkGrey.withOpacity(0.5),
                thickness: 1,
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceXL(),
            const AppSignatureWidget(),
            AppRatioSpaces.verticalSectionSpaceM(),
          ],
        ),
      ),
    );
  }
}
