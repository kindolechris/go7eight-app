import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/student/challenge/controllers/challenge_detail_controller.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/widgets/challenge_session_card.dart';

import '../../../../global_widgets/option_widget.dart';
import 'challenge_progress_widget.dart';

class ChallengeStartedView extends GetView<ChallengeController> {
  final SessionType sessionType;

  const ChallengeStartedView({super.key, required this.sessionType});

  @override
  Widget build(BuildContext context) {
    controller.allChallengeSessions.value = sessionType == SessionType.regular
        ? controller.challengeSessions
        : controller.challengeNutritionSessions;
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Obx(() {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ChallengeProgressWidget(),
            AppRatioSpaces.verticalSectionSpaceS(),
            OptionWidget(
              title: "",
              filterOptions: controller.challengeOptions,
              showLeftPadding: false,
            ),
            AppRatioSpaces.verticalSectionSpaceS(),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              reverse: true,
              itemCount: controller.allChallengeSessions.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChallengeSessionCard(
                  index,
                  challengeSessions: controller.allChallengeSessions,
                  sessionType: sessionType,
                );
              },
            )
          ],
        );
      }),
    );
  }
}
