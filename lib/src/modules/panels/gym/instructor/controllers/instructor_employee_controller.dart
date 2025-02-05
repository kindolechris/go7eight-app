import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_video_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/views/instructor_varification_profile_view.dart';


class InstructorEmployeeController extends GetxController {
  RxInt currentChallenge = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isChallengesSelected = true.obs;

  Rx<TrainerModel> trainer = TrainerModel(
          id: 0,
          imagePath: trainerImageGet(id: 35),
          name: trainerNameGet(id: 1),
          type: "Nutritionist",
          isFollowed: true)
      .obs;
  final List<ChallengeModel> challenges = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 9 + index),
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
  final List<ChallengeModel> challengesNutrition = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeNutritionImageGet(id: index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 9 + index),
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
  final List<SessionModel> sessions = List.generate(
    25,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: index),
        videoUrl: sessionTrainingVideoGet(id: index),
        title: "High-Intensity Interval Training${1 + index}",
        desc: "",
        caloriesToBurn: "${150 + index}",
        duration: "${15 + index}",
        bre: "Bre",
        price: "${23 + index}",
        recipeCount: index + 20,
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: SessionRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  final List<SessionModel> sessionsNutrition = List.generate(
    25,
    (index) => SessionModel(
        id: index,
        imagePath: sessionNutritionImageGet(id: index),
        videoUrl: sessionNutritionVideoGet(id: index),
        title: "High-Intensity Interval Training${1 + index}",
        desc: "",
        caloriesToBurn: "${150 + index}",
        duration: "${15 + index}",
        bre: "Bre",
        price: "${23 + index}",
        recipeCount: index + 20,
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: SessionRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );


  gotoTrainerProfileVerification() {
    Get.to(() => const InstructorProfileVerificationView(),
        duration: const Duration(milliseconds: 400), transition: Transition.fadeIn);
  }
}
