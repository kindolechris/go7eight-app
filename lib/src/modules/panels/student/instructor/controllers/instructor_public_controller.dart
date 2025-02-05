import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_data_by_category.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/student/challenge/bindings/challenge_binding.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/student/home/controllers/home_controller.dart';

class InstructorPublicController extends GetxController {
  RxInt currentChallenge = 0.obs;
  ScrollController scrollController = ScrollController();

  final List<ChallengeModel> challenges = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: 7 + index),
        title: sessionTrainingTitleGet(id: 8 + index),
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 11 + index),
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

  final List<ChallengeModel> nutritionChallenges =
      getNutritionChallengeListData();
  final List<SessionModel> nutritionSessions = List.generate(
    38,
    (index) => SessionModel(
        id: index,
        imagePath: sessionNutritionImageGet(id: index),
        title: sessionNutritionTitleGet(id: index),
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
  gotoChallengeDetailedView(bool purchasedChallenge,
      {required ChallengeModel challengeModel}) {
    Get.to(
        () => ChallengeDetailsView(
              title: "Challenge",
              challenge: challengeModel,
              myChallenge: purchasedChallenge,
              sessionType: SessionType.regular,
            ),
        binding: ChallengeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  @override
  void onInit() {
    initiateData();
    super.onInit();
  }

  Future<void> initiateData() async {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    HomeController homeController = Get.find();
    final maxScroll = homeController.allSessions.length *
        (AppRatioSize.getRatioHeight() / 2.6);
    final currentScroll = scrollController.position.pixels;

    if (currentScroll >= maxScroll - 200) {
      homeController.loadMore();
    }
  }
}
