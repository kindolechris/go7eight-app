import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/challenge_session_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/modules/panels/trainer/session/view/session_add_view.dart';
import 'package:go7eight/src/modules/panels/trainer/session/view/tainer_session_details_view.dart';

import '../../session/bindings/trainer_session_binding.dart';
import '../bindings/trainer_challenge_binding.dart';
import '../view/add_challenge_view.dart';
import '../view/challenge_details_view.dart';
import '../view/challenge_rating_view.dart';

class TrainerChallengeListController extends GetxController {
  final List<String> items = ['lbl_exercises', 'lbl_nutrition'];
  RxString selectedItem = 'lbl_exercises'.obs;
  RxBool isPublishedSelected = true.obs;
  RxBool isOverviewSelected = true.obs;


  RxList<OptionModel> challengeOptions = <OptionModel>[
    OptionModel(false, "Week 1", ""),
    OptionModel(false, "Week 2", ""),
    OptionModel(false, "Week 3", ""),
    OptionModel(true, "Week 4", ""),
    OptionModel(false, "Week 5", ""),
  ].obs;
  final List<ChallengeModel> challenges = List.generate(
    12,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: 12 + index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 23 + index),
            name: "Talan Gouse",
            type: "Fitness Trainer"),
        duration: "${15 + index}",
        timeRange: "15-30",
        isBookMarked: false,
        totalMembers: "${index + 9}K+",
        workoutFocus: "Full Body",
        workoutType: "Gym",
        price: "${150 + index}",
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: ChallengeRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  final List<ChallengeModel> unpublishedChallenges = List.generate(
    5,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: 25 + index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 5 + index),
            name: "Talan Gouse",
            type: "Fitness Trainer"),
        duration: "${15 + index}",
        timeRange: "15-30",
        isBookMarked: false,
        totalMembers: "${index + 9}K+",
        workoutFocus: "Full Body",
        workoutType: "Gym",
        price: "${150 + index}",
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: ChallengeRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
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
  onChallengeAddClick() {
    Get.to(
        () => const TrainerAddChallengeView(
              isCreate: true,
            ),
        binding: TrainerChallengeListBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  onChallengeEditClick() {
    Get.to(
        () => const TrainerAddChallengeView(
              isCreate: false,
            ),
        binding: TrainerChallengeListBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoChallengeRatingView() {
    Get.to(() => const ChallengeRatingView(title: "review_lbl"),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoChallengeDetails(
      {required ChallengeModel challenge, required bool isCreate}) {
    Get.to(
        () => TrainerChallengeDetailsView(
              title: challenge.title!,
              isReadyToPublish: isCreate,
              challenge: challenge,
            ),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(
        () => TrainerSessionDetailsView(
            title: "High-Intensity Interval Training1",
            sessionModel: sessionModel,
            isReadyToPublish: false,
            sessionType: sessionType),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  void onAddSessionClick() {
    Get.to(() => const TrainerAddSessionView(isCreate: true),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  onChallengeDelete() {}
}
