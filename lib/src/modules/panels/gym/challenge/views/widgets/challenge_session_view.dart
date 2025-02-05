import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/gym/challenge/views/widgets/challenge_session_card.dart';
import 'package:go7eight/src/modules/panels/global_widgets/option_widget.dart';

import '../../controllers/challenge_detail_controller.dart';

class ChallengeSessionView extends GetView<GYMChallengeController> {
  const ChallengeSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
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
            itemCount: controller.challengeSessions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChallengeSessionCard(index);
            },
          )
        ],
      ),
    );
  }
}
