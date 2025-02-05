import 'package:go7eight/src/data/dataSource/local/meal_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/models/meal_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';

import '../../../../../core/app_export.dart';
import '../views/session_rating_view.dart';

class GYMSessionController extends GetxController {
  RxList<MealModel> meals = <MealModel>[].obs;

  final List<SessionModel> trendingSessions = List.generate(
    38,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: index),
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
  );
  final List<SessionModel> nutritionSessions = List.generate(
    38,
    (index) => SessionModel(
        id: index,
        imagePath: sessionNutritionImageGet(id: index),
        title: "Vega Organic All-in-One${1 + index}",
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
  final List<SessionModel> newSessions = List.generate(
    25,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 7 + index),
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
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  RxBool videoIsReady = false.obs;
  RxBool followTrainer = false.obs;
  RxBool sessionIsSaved = false.obs;
  mealSelection(MealModel meal) {
    List<MealModel> tempMeals = <MealModel>[];
    for (var mealModel in meals) {
      if (mealModel == meal) {
        mealModel.isSelected = true;
      } else {
        mealModel.isSelected = false;
      }
      tempMeals.add(mealModel);
    }
    meals.value = tempMeals;
  }

  RxList<OptionModel> reminderOptions = <OptionModel>[
    OptionModel(true, "10 min Before", ""),
    OptionModel(false, "20 min Before", ""),
    OptionModel(false, "30 min Before", ""),
    OptionModel(false, "40 min Before", ""),
    OptionModel(false, "1 hour Before", ""),
    OptionModel(false, "2 hour Before", ""),
    OptionModel(false, "6 hour Before", ""),
  ].obs;
  countDownFinished() {
    Get.back();
    videoIsReady.value = true;
  }

  sessionIsCompleted() {
    videoIsReady.value = false;
    Get.back();
    SnackBarX.showSuccess(
        title: "session_completed_snack_title",
        message: "session_completed_snack_message");
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

  saveSession() {
    sessionIsSaved.value = !sessionIsSaved.value;
    if (sessionIsSaved.value) {
      SnackBarX.showSuccess(
          title: "session_saved_snack_title",
          message: "session_saved_snack_message");
    } else {
      SnackBarX.showWarning(
          title: "session_saved_snack_title",
          message: "session_unsaved_snack_message");
    }
  }

  gotoSessionRatingView() {
    Get.to(() => const SessionRatingView(title: "review_lbl"),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  @override
  void onInit() {
    meals.value = getMealData();
    super.onInit();
  }
}
