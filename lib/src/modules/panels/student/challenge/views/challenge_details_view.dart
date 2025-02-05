import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/widgets/challenge_detail_grid.dart';

import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/challenge_detail_controller.dart';
import 'widgets/challenge_bottom_nav_widget.dart';
import 'widgets/challenge_image_widget.dart';
import 'widgets/challenge_intro_view.dart';
import 'widgets/challenge_started_view.dart';

class ChallengeDetailsView extends GetView<ChallengeController> {
  final String title;
  final bool myChallenge;
  final bool? myOnGoingChallenge;
  final SessionType sessionType;
  final ChallengeModel challenge;

  const ChallengeDetailsView({super.key, required this.title,
    required this.challenge,
    required this.myChallenge,
    this.myOnGoingChallenge,
    this.sessionType = SessionType.regular});

  @override
  Widget build(BuildContext context) {
    controller.challengeHasStarted.value = myOnGoingChallenge ?? false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: Obx(() {
          return sessionAppBar(context,
              showSaveIcon: true,
              title: title,
              saveIconAction: controller.saveSession,
              sessionSaved: controller.challengeIsSaved.value);
        }),
      ),
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        child: Obx(() {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceXS(),
              ChallengeImageWidget(
                challengeImagePath: challenge.imagePath!,
              ),
              AppRatioSpaces.verticalSectionSpaceXS(),
              TagListWidget(
                tags: challenge.tags!,
              ),
              AppRatioSpaces.verticalSectionSpaceXS(),
              _challengeTextTitleSection(context),
              AppRatioSpaces.verticalSectionSpaceS(),
              const ChallengeDetailGridView(),
              AppRatioSpaces.verticalSectionSpaceS(),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              controller.challengeHasStarted.value == false
                  ? ChallengeIntroView(
                sessionType: sessionType,
                challengeModel: challenge,
              )
                  : ChallengeStartedView(
                sessionType: sessionType,
              ),
              AppRatioSpaces.verticalSectionSpaceS(),
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomChallengeNavWidget(
        isPurchased: myChallenge,
        sessionType: sessionType,
      ),
    );
  }

  Widget _challengeTextTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: Text(
        "${challenge.title}".tr,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleX.subHeading1(context),
      ),
    );
  }
}
