import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import '../../../../../../core/app_export.dart';
import '../../controllers/trainer_challenge_controller.dart';

class ChallengeSessionCard extends GetView<TrainerChallengeListController> {
  final int sessionIndex;

  const ChallengeSessionCard(this.sessionIndex, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.singleSessionClick(SessionType.regular, true,
            controller.challengeSessions[sessionIndex].sessionModel!);
      },
      child: Container(
        height: AppRatioSize.getRatioHeight() / 9.5,
        margin: const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            AppContainerWidget(
              child: Row(
                children: [
                  _sessionImageContainer(),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TagListWidget(
                        disableDefaultHPadding: true,
                        tags: [],
                      ),
                      _sessionTextTitleSection(context,
                          session: controller
                              .challengeSessions[sessionIndex].sessionModel!),
                      _sessionTextInfoSection(context,
                          session: controller
                              .challengeSessions[sessionIndex].sessionModel!),
                    ],
                  )
                ],
              ),
            ),
            _weekDayCountWidget(context),
            // sessionIndex<4?
            // _sessionCompleted():Container(),
          ],
        ),
      ),
    );
  }

  Widget _sessionImageContainer() {
    return AppNetworkImage(
      width: AppRatioSize.getRatioWidth() / 5.5,
      height: AppRatioSize.getRatioWidth() / 5.5,
      imagePath: "${controller.challengeSessions[sessionIndex].sessionModel!.imagePath}",
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
        "Day ${sessionIndex + 1}".tr,
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
