
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/trainer_container_widget.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/all_session_widget.dart';
import 'package:go7eight/src/modules/panels/student/instructor/views/widgets/basic_training_info.dart';
import 'package:go7eight/src/modules/panels/student/instructor/views/widgets/overview_button.dart';
import 'package:go7eight/src/modules/panels/student/session/views/session_list_view.dart';

import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/instructor_public_controller.dart';
import 'widgets/instructor_challenges_widget.dart';

class InstructorPublicView extends GetView<InstructorPublicController> {
  final SessionType sessionType;
  final TrainerModel trainer;

  const InstructorPublicView(
      {super.key, required this.sessionType, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(context, title: "instructor_lbl"),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        children: [
          AppRatioSpaces.verticalSectionSpaceS(),
          TrainerContainer(
              trainer: trainer,
              imageBorderRadius: Get.width,
              imageSize: AppRatioSize.getRatioWidth() / 8,
              onClickFollow: () {
                toggleFollowTrainer();
              }),
          _trainerDetails(context),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          const OverviewButton(),
          AppRatioSpaces.verticalSectionSpaceS(),
          const BasicTrainingInfo(
              sessionCount: "29", challengeCount: "05", followerCount: "18k"),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          InstructorChallengesWidget(sessionType: sessionType),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          sessionType == SessionType.regular
              ? const AllSessionWidget()
              : SessionListViewWidget(
                  sessionList: controller.nutritionSessions,
                  sessionType: SessionType.nutrition,
                ),
        ],
      ),
    );
  }

  _trainerDetails(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
            .tr,
        style: TextStyleX.body2(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.blackShade
                : AppColor.white,
            fontSize: AppTextSizes.headerText4()),
        maxLines: 150,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  toggleFollowTrainer() {
    trainer.isFollowed = !trainer.isFollowed!;
    if (trainer.isFollowed == true) {
      SnackBarX.showSuccess(
          title: "follow_trainer_snack_title",
          message: "follow_trainer_snack_message");
    } else {
      SnackBarX.showWarning(
          title: "unfollow_trainer_snack_title",
          message: "unfollow_trainer_snack_message");
    }
  }
}
