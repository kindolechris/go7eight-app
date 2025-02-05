import 'dart:math';

import 'package:get/get.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_video_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/models/category_model.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/student/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/student/session/views/session_details_view.dart';

import '../../challenge/bindings/challenge_binding.dart';
import '../../challenge/views/challenge_details_view.dart';

class CategoryController extends GetxController {
  RxDouble challengeContainerWidth = 0.0.obs;
  RxInt currentChallenge = 0.obs;
  Random random = Random();
  List<ChallengeModel> challenges = <ChallengeModel>[];
  RxList<ChallengeModel> categoryChallenges = List.generate(
    2,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: index + 4),
        title: sessionTrainingTitleGet(id: 8 + index),
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 31 + index),
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
  ).obs;

  RxList<SessionModel> categorySessions = List.generate(
    2,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 7 + index),
        videoUrl: sessionTrainingVideoGet(id: 14 + index),
        title: sessionTrainingTitleGet(id: 21 + index),
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
  ).obs;
  CategoryModel _category = CategoryModel();

  Future<CategoryModel> setArgumentValue() async {
    var arguments = await Get.arguments as Map<String, dynamic>;
    _category = arguments['category'] as CategoryModel;
    return _category;
  }

  @override
  void onInit() {
    setArgumentValue().then((value) {
      categoryChallenges.value = value.challengeList!;
      categorySessions.value = value.sessionList!;
    });

    super.onInit();
  }

  gotoChallengeDetailedView(SessionType sessionType, bool purchasedChallenge,
      {required ChallengeModel challengeModel}) {
    Get.to(
        () => ChallengeDetailsView(
              title: "Challenge",
              challenge: challengeModel,
              myChallenge: purchasedChallenge,
              sessionType: sessionType,
            ),
        binding: ChallengeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(
        () => SessionDetailsView(
            mySession: purchasedSession,
            session: sessionModel,
            sessionType: sessionType),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }
}
