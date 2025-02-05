import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/view/widgets/challenge_card_widget.dart';

import '../../controllers/trainer_challenge_controller.dart';

class UnpublishedChallengeList extends GetView<TrainerChallengeListController> {
  const UnpublishedChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.unpublishedChallenges.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  controller.gotoChallengeDetails(
                      challenge: controller.challenges[index], isCreate: false);
                },
                child: ChallengeCardWidget(
                  challenge: controller.challenges[index],
                  isPublished: false,
                ),
              ),
            );
          }),
    );
  }
}
