import 'package:video_player/video_player.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/trainer_container_widget.dart';
import '../controllers/session_controllers.dart';
import '../../../global_widgets/app_bar_widget.dart';
import 'widgets/session_detail_second_section.dart';
import 'widgets/session_details_bottom_nav.dart';
import 'widgets/session_rating_widget.dart';
import 'widgets/video_player_widget.dart';

class SessionDetailsView extends GetView<SessionController> {
  final bool mySession;
  final SessionType sessionType;
  final SessionModel session;

  const SessionDetailsView(
      {super.key, required this.mySession,
      required this.session,
      required this.sessionType});

  @override
  Widget build(BuildContext context) {
    controller.getTrainer(sessionType);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: Obx(() {
          return sessionAppBar(context,
              showSaveIcon: true,
              title: "session_title",
              saveIconAction: controller.saveSession,
              sessionSaved: controller.sessionIsSaved.value);
        }),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
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
            AppRatioSpaces.verticalSectionSpaceXS(),
            Obx(() {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24,
                ),
                child: controller.videoIsReady.value == true
                    ? VideoPlayerWidget(
                        thumbnail: "${session.imagePath}",
                        url: '${session.videoUrl}',
                        dataSourceType: DataSourceType.network,
                        aspectRatio: 16 / 9,
                      )
                    : AspectRatio(
                        aspectRatio: 16 / 9,
                        child: AppNetworkImage(
                          width: Get.width,
                          height: Get.height / 3,
                          borderRadius: 12,
                          imagePath: "${session.imagePath}",
                        ),
                      ),
              );
            }),
            AppRatioSpaces.verticalSectionSpaceXS(),
            TagListWidget(tags: session.tags!),
            AppRatioSpaces.verticalSectionSpaceXS(),
            _sessionTextTitleSection(context),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            _sessionTextInfoSection(context),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            const SessionRatingContainer(),
            AppRatioSpaces.verticalSectionSpaceS(),
            GestureDetector(
              onTap: () {
                controller.sessionTrainer.type =
                    sessionType == SessionType.nutrition
                        ? "user_type_three".tr
                        : "fitness_trainer_lbl".tr;
                controller.gotoInstructorPublicView(
                    sessionType, controller.sessionTrainer);
              },
              child: TrainerContainer(
                trainer: controller.sessionTrainer,
                onClickFollow: controller.trainerFollowToggle,
                imageBorderRadius: Get.width,
                imageSize: AppRatioSize.getRatioWidth() / 12,
              ),
            ),
            SessionDetailsSecondSection(
              session: session,
              sessionType: sessionType,
              mySession: mySession,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SessionDetailsBottomNav(mySession: mySession),
    );
  }

  Widget _sessionTextTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: Text(
        "${session.title}".tr,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleX.subHeading1(context),
      ),
    );
  }

  Widget _sessionTextInfoSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: Row(
        children: [
          sessionType == SessionType.nutrition
              ? Row(
                  children: [
                    _textInfoWidget(context,
                        iconPath: AppIcon.breIcon, value: "Bre", unit: ""),
                    AppRatioSpaces.horizontalSectionSpaceXXS(),
                  ],
                )
              : Container(),
          _textInfoWidget(context,
              iconPath: AppIcon.caloriesIcon, value: "150", unit: "Cal"),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          _textInfoWidget(context,
              iconPath: AppIcon.clockIcon, value: "15", unit: "Min"),
        ],
      ),
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
          style: TextStyleX.subHeading2(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
