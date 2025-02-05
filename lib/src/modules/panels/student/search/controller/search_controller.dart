
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/modules/panels/student/challenge/bindings/challenge_binding.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/student/instructor/bindings/instructor_public_binding.dart';
import 'package:go7eight/src/modules/panels/student/instructor/views/instructor_public_profile_view.dart';

import '../../session/bindings/session_binding.dart';
import '../../session/views/nutrition_session_list_view.dart';
import '../../session/views/session_details_view.dart';

class FitnofySearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();

  RxBool isSearching = false.obs;
  RxBool isSearchDone = false.obs;
  RxBool noResultFound = false.obs;

  RxList<String> recentSearch =
      ["Special offers & discounts", "Goods & electric goods", "Services, events & experience", "Smart TV"].obs;

  RxList<OptionModel> categoriesFilterOption = <OptionModel>[
    OptionModel(false, "All", ""),
    OptionModel(false, "Devices", ""),
    OptionModel(false, "Fashion", ""),
    OptionModel(false, "Services", ""),
    OptionModel(false, "Donation", ""),
    OptionModel(true, "Training", ""),
    OptionModel(false, "News", ""),
    OptionModel(false, "Movie", ""),
  ].obs;
  RxList<OptionModel> durationFilterOption = <OptionModel>[
    OptionModel(false, "America", ""),
    OptionModel(false, "Africa", ""),
    OptionModel(false, "Asia", ""),
    OptionModel(false, "Canada", ""),
    OptionModel(false, "China", ""),
  ].obs;
  RxList<OptionModel> intensityFilterOption = <OptionModel>[
    OptionModel(false, "Used", ""),
    OptionModel(false, "New", ""),
    OptionModel(false, "Refurbished", ""),
  ].obs;
  RxList<OptionModel> mealFilterOption = <OptionModel>[
    OptionModel(false, "Breakfast", ""),
    OptionModel(true, "Lunch", ""),
    OptionModel(false, "Snacks", ""),
    OptionModel(false, "Dinner", ""),
  ].obs;
  RxList<OptionModel> goalFilterOption = <OptionModel>[
    OptionModel(true, "Lose Weight", ""),
    OptionModel(true, "Keep Fit", ""),
    OptionModel(false, "Get Stronger", ""),
    OptionModel(false, "Calm Mind", ""),
  ].obs;

  @override
  void onInit() async {
    searchTextController.addListener(() {
      isSearchDone.value = false;
      noResultFound.value = false;
      if (searchTextController.text.length > 2) {
        isSearching.value = true;
      } else {
        isSearching.value = false;
      }
    });
    super.onInit();
  }

  removeRecentSearchItem(int index) {
    recentSearch.removeAt(index);
  }

  addItemToRecentSearch(String value) {
    recentSearch.add(value);
    isSearchDone.value = true;
    if (value.toLowerCase() == "no session") {
      noResultFound.value = true;
    } else {
      noResultFound.value = false;
    }
  }

  void nutritionSessionSeeAllClick() {
    Get.to(() => const NutritionSessionListView(),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  optionSelection(List<OptionModel> options, int index) {
    var tempOption = options;
    for (OptionModel option in tempOption) {
      if (option == tempOption[index]) {
        tempOption[index].isSelected = !tempOption[index].isSelected;
      }
    }
    return tempOption;
  }

  RxInt regularChallenge = 0.obs;
  final List<ChallengeModel> searchListRegularChallenges = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: 26 + index),
        title: sessionTrainingTitleGet(id: 12 + index),
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 16 + index),
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
  RxInt nutritionChallenge = 0.obs;
  final List<SessionModel> searchListNutritionChallenges = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: challengeNutritionImageGet(id: index),
        title: sessionNutritionTitleGet(id: 8 + index),
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

  final List<SessionModel> trendingSessions = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 18 + index),
        title: sessionTrainingTitleGet(id: index),
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
  );
  final List<SessionModel> nutritionSessions = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: sessionNutritionImageGet(id: 18 + index),
        title: sessionNutritionTitleGet(id: 18 + index),
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
  );
  final List<TrainerModel> searchedTrainers = List.generate(
    7,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 25 + index),
        name: trainerNameGet(id: index + 7),
        type: "Fitness Trainer",
        isFollowed: true),
  );
  final List<TrainerModel> searchedNutritionist = List.generate(
    7,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerNutritionImageGet(id: 7 + index),
        name: "Helena T. Bane",
        type: "Nutritionist",
        isFollowed: true),
  );

  trainerFollowToggle(int index, {required List<TrainerModel> trainerList}) {
    if (trainerList[index].isFollowed == false) {
      trainerList[index].isFollowed = true;
      SnackBarX.showSuccess(
          title: "follow_trainer_snack_title",
          message: "follow_trainer_snack_message");
    } else {
      trainerList[index].isFollowed = false;
      SnackBarX.showWarning(
          title: "unfollow_trainer_snack_title",
          message: "unfollow_trainer_snack_message");
    }
  }
}
