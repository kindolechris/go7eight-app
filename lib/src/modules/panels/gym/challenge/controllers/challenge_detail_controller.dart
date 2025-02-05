import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/challenge_session_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/modules/panels/gym/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/gym/session/views/session_details_view.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_rating_view.dart';

class GYMChallengeController extends GetxController {
  RxBool followTrainer = false.obs;
  RxBool challengeIsSaved = false.obs;
  RxBool challengeIsCompleted = false.obs;
  RxBool isOverviewSelected = true.obs;
  TrainerModel challengeTrainer = TrainerModel(
      id: 11,
      imagePath: trainerImageGet(id: 32),
      name: "Talan Gouse",
      type: "Fitness Trainer");
  RxList<OptionModel> challengeOptions = <OptionModel>[
    OptionModel(false, "Week 1", ""),
    OptionModel(false, "Week 2", ""),
    OptionModel(false, "Week 3", ""),
    OptionModel(true, "Week 4", ""),
    OptionModel(false, "Week 5", ""),
  ].obs;
  gotoChallengeRatingView() {
    Get.to(() => const ChallengeRatingView(title: "review_lbl"),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  trainerFollowToggle() {
    followTrainer.value = !followTrainer.value;
    if (followTrainer.value) {
      SnackBarX.showSuccess(
          title: "follow_trainer_snack_title",
          message: "follow_trainer_snack_message");
    } else {
      SnackBarX.showWarning(
          title: "unfollow_trainer_snack_title",
          message: "unfollow_trainer_snack_message");
    }
  }

  List<ChallengeSessionModel> challengeSessions = List.generate(
    7,
    (index) => ChallengeSessionModel(
      id: index,
      isCompleted: false,
      sessionModel: SessionModel(
          id: index,
          imagePath: challengeTrainingImageGet(id: index),
          title: "High-Intensity Interval Training${1 + index}",
          desc: "",
          caloriesToBurn: "${150 + index}",
          duration: "${15 + index}",
          bre: "Bre",
          price: "${23 + index}",
          tags: List.generate(
              5,
              (tagIndex) => ProductTagModel(
                  id: tagIndex,
                  tag: getSessionTagNames(id: tagIndex + index + 5))),
          rating: SessionRatingModel(
              id: index, rating: "4.8", totalCount: "${200 + index}")),
    ),
  );

  gotoCartView() {}
  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(
        () => GYMSessionDetailsView(
            title: "High-Intensity Interval Training1",
            sessionModel: sessionModel,
            sessionType: sessionType),
        binding: GYMSessionBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  challengeCompleted() {
    challengeIsCompleted.value = false;
    Get.back();
    SnackBarX.showSuccess(
        title: "session_completed_snack_title",
        message: "session_completed_snack_message");
  }

  startChallenge() {}

  saveSession() {
    challengeIsSaved.value = !challengeIsSaved.value;
    if (challengeIsSaved.value) {
      SnackBarX.showSuccess(
          title: "session_saved_snack_title",
          message: "session_saved_snack_message");
    } else {
      SnackBarX.showWarning(
          title: "session_saved_snack_title",
          message: "session_unsaved_snack_message");
    }
  }
}
