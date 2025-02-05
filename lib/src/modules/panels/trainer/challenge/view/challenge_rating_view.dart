import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/rating_container_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/rating_header_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_bar_widget.dart';

import '../controllers/trainer_challenge_controller.dart';

class ChallengeRatingView extends GetView<TrainerChallengeListController> {
  final String title;

  const ChallengeRatingView({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sessionAppBar(context, showSaveIcon: false, title: title),
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
            const RatingHeaderWidget(),
            AppRatioSpaces.verticalSectionSpaceS(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return RatingContainerWidget(
                      ratingIndex: index,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
