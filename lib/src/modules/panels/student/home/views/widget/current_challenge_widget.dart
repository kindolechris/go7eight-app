import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';

import '../../controllers/home_controller.dart';

class CurrentChallengeWidget extends GetView<HomeController> {
  const CurrentChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: AppContainerWidget(
          child: Row(
        children: [
          Expanded(flex: 4, child: _challengeImageSection()),
          Expanded(
            flex: 4,
            child: _challengeTextSection(context),
          ),
        ],
      )),
    );
  }

  Widget _challengeImageSection() {
    return Container(
      height: AppRatioSize.getRatioHeight() / 7.5,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppNetworkImage(
        imagePath: challengeTrainingImageGet(id: 2),
        height: Get.height / 6,
        width: Get.width / 1.3,
        borderRadius: 12,
      ),
    );
  }

  Widget _challengeTextSection(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 7.5,
      padding:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: _challengeTextSectionLabel(context)),
          Flexible(child: _challengeTextSectionValue(context)),
          Flexible(child: _challengeTextSectionButton(context))
        ],
      ),
    );
  }

  Widget _challengeTextSectionLabel(BuildContext context) {
    return Text("current_challenge_lbl".tr,
        style: TextStyleX.subHeading2BlueGrey(context).copyWith(height: 1));
  }

  Widget _challengeTextSectionValue(BuildContext context) {
    return Text.rich(
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyleX.header6(context),
      TextSpan(
        children: [
          TextSpan(
              text: "48",
              style: TextStyle(fontSize: AppTextSizes.titleText3())),
          TextSpan(
            text: ' % ${'done_lbl'.tr}',
          )
        ],
      ),
    );
  }

  Widget _challengeTextSectionButton(BuildContext context) {
    return AppButton(
      action: () {
        controller.challengeContinueClick(sessionTitle: "Current Challenge");
      },
      text: "lbl_btn_continue",
      buttonHeight: AppRatioSize.getRatioWidth() / 14,
      buttonWidth: AppRatioSize.getRatioWidth() / 5,
      boarderRadius: 8,
      fontSize: AppTextSizes.headerText4(),
    );
  }
}
