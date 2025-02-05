import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_video_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/challenge_session_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_rating_view.dart';
import 'package:go7eight/src/modules/panels/student/instructor/bindings/instructor_public_binding.dart';
import 'package:go7eight/src/modules/panels/student/instructor/views/instructor_public_profile_view.dart';
import 'package:go7eight/src/modules/panels/student/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/student/session/views/session_details_view.dart';

import '../../cart/bindings/cart_binding.dart';
import '../../cart/views/cart_view.dart';

class ChallengeController extends GetxController {
  RxBool followTrainer = false.obs;
  RxBool challengeIsSaved = false.obs;
  RxBool challengeIsCompleted = false.obs;
  RxBool challengeHasStarted = false.obs;
  RxList<ChallengeSessionModel> allChallengeSessions =
      <ChallengeSessionModel>[].obs;

  @override
  void onInit() {
    allChallengeSessions.value = challengeSessions;
    super.onInit();
  }

  RxList<OptionModel> challengeOptions = <OptionModel>[
    OptionModel(false, "Week 1", ""),
    OptionModel(false, "Week 2", ""),
    OptionModel(false, "Week 3", ""),
    OptionModel(true, "Week 4", ""),
    OptionModel(false, "Week 5", ""),
  ].obs;
  gotoSessionRatingView() {
    Get.to(() => const ChallengeRatingView(title: "review_lbl"),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  trainerFollowToggle(TrainerModel trainer) {
    if (trainer.isFollowed == false) {
      trainer.isFollowed = true;
      SnackBarX.showSuccess(
          title: "follow_trainer_snack_title",
          message: "follow_trainer_snack_message");
    } else {
      trainer.isFollowed = false;
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
          imagePath: sessionTrainingImageGet(id: 3 + index),
          videoUrl: sessionTrainingVideoGet(id: 2 + index),
          title: sessionTrainingTitleGet(id: index + 7),
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
  List<ChallengeSessionModel> challengeNutritionSessions = List.generate(
    7,
    (index) => ChallengeSessionModel(
      id: index,
      isCompleted: false,
      sessionModel: SessionModel(
          id: index,
          imagePath: sessionNutritionImageGet(id: 3 + index),
          videoUrl: sessionNutritionVideoGet(id: 2 + index),
          title: sessionNutritionTitleGet(id: index + 7),
          desc: "",
          caloriesToBurn: "${90 + index}",
          duration: "${17 + index}",
          bre: "Bre",
          price: "${18 + index}",
          tags: List.generate(
              5,
              (tagIndex) => ProductTagModel(
                  id: tagIndex,
                  tag: getSessionTagNames(id: tagIndex + index + 5))),
          rating: SessionRatingModel(
              id: index, rating: "4.6", totalCount: "${200 + index}")),
    ),
  );
  gotoCartView() {
    Get.to(() => const CartView(),
        binding: CartBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(
        () => SessionDetailsView(
            session: sessionModel,
            mySession: purchasedSession,
            sessionType: sessionType),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
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
  gotoInstructorPublicView(SessionType sessionType, TrainerModel trainerModel) {
    Get.to(
        () => InstructorPublicView(
              sessionType: sessionType,
              trainer: trainerModel,
            ),
        binding: InstructorPublicBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

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
