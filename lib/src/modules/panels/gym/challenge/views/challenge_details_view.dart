import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_bar_widget.dart';
import '../controllers/challenge_detail_controller.dart';
import 'widgets/challenge_bottom_nav_widget.dart';
import 'widgets/challenge_detail_grid.dart';
import 'widgets/challenge_image_widget.dart';
import 'widgets/challenge_overview_view.dart';
import 'widgets/challenge_rating_container.dart';
import 'widgets/challenge_session_view.dart';

class GYMChallengeDetailsView extends GetView<GYMChallengeController> {
  final String title;
  final bool? myOnGoingChallenge;
  final SessionType sessionType;
  final ChallengeModel challenge;

  const GYMChallengeDetailsView(
      {super.key, required this.title,
      required this.challenge,
      this.myOnGoingChallenge,
      this.sessionType = SessionType.regular});

  @override
  Widget build(BuildContext context) {
    controller.isOverviewSelected.value = myOnGoingChallenge ?? false;
    return Scaffold(
      appBar: sessionAppBar(
        context,
        showSaveIcon: false,
        title: title,
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
            ChallengeImageWidget(challengeThumbnail: challenge.imagePath!),
            AppRatioSpaces.verticalSectionSpaceXS(),
            TagListWidget(
              tags: challenge.tags!,
            ),
            AppRatioSpaces.verticalSectionSpaceXS(),
            _challengeTextTitleSection(context),
            AppRatioSpaces.verticalSectionSpaceS(),
            const ChallengeDetailGridView(),
            AppRatioSpaces.verticalSectionSpaceS(),
            const ChallengeRatingContainer(),
            AppRatioSpaces.verticalSectionSpaceS(),
            Obx(() {
              return AppTabBar(
                  onChange: (value) {
                    controller.isOverviewSelected.value = value;
                  },
                  isFirstOptionSelected: controller.isOverviewSelected.value,
                  horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                  optionOneText: "preference_qh_overview",
                  optionTwoText: "sessions_title");
            }),
            Obx(() {
              return controller.isOverviewSelected.value == true
                  ? ChallengeOverviewView(sessionType: sessionType)
                  : const ChallengeSessionView();
            }),
            AppRatioSpaces.verticalSectionSpaceS(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomChallengeNavWidget(),
    );
  }

  Widget _challengeTextTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: Text(
        "High-Intensity Interval Training".tr,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleX.subHeading1(context),
      ),
    );
  }
}
