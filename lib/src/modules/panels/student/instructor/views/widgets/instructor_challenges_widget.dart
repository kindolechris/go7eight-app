import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/challenges_card_widget.dart';

import '../../controllers/instructor_public_controller.dart';

class InstructorChallengesWidget extends GetView<InstructorPublicController> {
  final SessionType sessionType;

  const InstructorChallengesWidget({super.key, required this.sessionType});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const AppSectionTitle(
          title: "challenges_lbl",
          disableDefaultVPadding: true,
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        CarouselSlider.builder(
          options: CarouselOptions(
              autoPlay: false,
              enableInfiniteScroll: true,
              enlargeCenterPage: false,
              aspectRatio: 1.1,
              onPageChanged: (index, reason) {
                controller.currentChallenge.value = index;
              }),
          itemCount: sessionType == SessionType.regular
              ? controller.challenges.length
              : controller.nutritionChallenges.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  GestureDetector(
            onTap: () {
              controller.gotoChallengeDetailedView(
                  itemIndex % 2 == 0 ? true : false,
                  challengeModel: sessionType == SessionType.regular
                      ? controller.challenges[itemIndex]
                      : controller.nutritionChallenges[itemIndex]);
            },
            child: ChallengesCardWidget(
              width: AppRatioSize.getRatioWidth() / 1.1,
              challenge: sessionType == SessionType.regular
                  ? controller.challenges[itemIndex]
                  : controller.nutritionChallenges[itemIndex],
            ),
          ),
        ),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        Obx(() {
          return Container(
            alignment: Alignment.center,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentChallenge.value,
              count: sessionType == SessionType.regular
                  ? controller.challenges.length
                  : controller.nutritionChallenges.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotColor: AppColor.textBlueGrey.withOpacity(0.4),
                activeDotColor: AppColor.primary,
                dotWidth: 8,
                radius: 100,
                strokeWidth: 25,
              ),
            ),
          );
        }),
      ],
    );
  }
}
