import 'package:carousel_slider/carousel_slider.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/challenges_card_widget.dart';

import '../../../../../../core/app_export.dart';
import '../../controllers/category_controller.dart';

class ChallengeCarouselSlider extends GetView<CategoryController> {
  final SessionType sessionType;

  const ChallengeCarouselSlider({super.key, required this.sessionType});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider.builder(
        options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            aspectRatio: 1.1,
            onPageChanged: (index, reason) {
              controller.currentChallenge.value = index;
            }),
        itemCount: controller.categoryChallenges.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            GestureDetector(
          onTap: () {
            controller.gotoChallengeDetailedView(
                sessionType, itemIndex % 2 == 0 ? true : false,
                challengeModel: controller.categoryChallenges[itemIndex]);
          },
          child: ChallengesCardWidget(
            width: AppRatioSize.getRatioWidth() / 1.1,
            challenge: controller.categoryChallenges[itemIndex],
          ),
        ),
      );
    });
  }
}
