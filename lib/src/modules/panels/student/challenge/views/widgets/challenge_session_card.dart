import 'dart:ui';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/challenge_session_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';

import '../../../../../../core/app_export.dart';
import '../../controllers/challenge_detail_controller.dart';

class ChallengeSessionCard extends GetView<ChallengeController> {
  final int sessionIndex;
  final List<ChallengeSessionModel> challengeSessions;
  final SessionType sessionType;

  const ChallengeSessionCard(this.sessionIndex,
      {super.key, required this.challengeSessions, required this.sessionType});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.singleSessionClick(
            sessionType, true, challengeSessions[sessionIndex].sessionModel!);
      },
      child: Container(
        height: AppRatioSize.getRatioHeight() / 9.5,
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            AppContainerWidget(
              child: Row(
                children: [
                  _sessionImageContainer(),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TagListWidget(
                          disableDefaultHPadding: true,
                          tags: challengeSessions[sessionIndex]
                              .sessionModel!
                              .tags!,
                        ),
                        _sessionTextTitleSection(context,
                            session:
                                challengeSessions[sessionIndex].sessionModel!),
                        _sessionTextInfoSection(context,
                            session:
                                challengeSessions[sessionIndex].sessionModel!),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _weekDayCountWidget(context),
            sessionIndex < 4 ? _sessionCompleted() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _sessionImageContainer() {
    return AppNetworkImage(
      width: AppRatioSize.getRatioWidth() / 5.5,
      height: AppRatioSize.getRatioWidth() / 5.5,
      imagePath: "${challengeSessions[sessionIndex].sessionModel!.imagePath}",
      borderRadius: 12,
    );
  }

  Widget _weekDayCountWidget(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 32),
      decoration: const BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
      child: Text(
        "${"day_lbl".tr} ${sessionIndex + 1}",
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleX.subHeading2BlueGrey(context).copyWith(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.white,
          fontSize: AppTextSizes.headerText3(),
        ),
      ),
    );
  }

  Widget _sessionBlurContainer() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
          ),
        ),
      ),
    );
  }

  Widget _sessionCompletedCheckMark() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(Get.width),
        ),
        child: Icon(
          Icons.check,
          color: AppColor.green,
          size: AppRatioSize.getRatioWidth() / 18,
        ),
      ),
    );
  }

  Widget _sessionCompleted() {
    return Stack(
      children: [_sessionBlurContainer(), _sessionCompletedCheckMark()],
    );
  }

  Widget _sessionTextTitleSection(BuildContext context,
      {required SessionModel session}) {
    return Text(
      "${session.title}".tr,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyleX.subHeading2BlueGrey(context),
    );
  }

  Widget _sessionTextInfoSection(BuildContext context,
      {required SessionModel session}) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.caloriesIcon,
            value: "${session.caloriesToBurn}",
            unit: "Cal"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        _textInfoWidget(context,
            iconPath: AppIcon.clockIcon,
            value: "${session.duration}",
            unit: "Min"),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: AppTextSizes.headerText(),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "$value $unit".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context)
              .copyWith(fontSize: AppTextSizes.headerText4()),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
