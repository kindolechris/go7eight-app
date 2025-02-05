import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/models/recipe_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/trainer/recipe/bindings/trainer_recipe_binding.dart';
import 'package:go7eight/src/modules/panels/trainer/recipe/view/recipe_details_view.dart';

import '../bindings/trainer_session_binding.dart';
import '../view/session_add_view.dart';
import '../view/session_rating_view.dart';
import '../view/tainer_session_details_view.dart';

class TrainerSessionController extends GetxController {
  final List<String> items = ['lbl_exercises', 'lbl_nutrition'];
  RxString selectedItem = 'lbl_exercises'.obs;
  RxBool isPublishedSelected = true.obs;
  RxBool videoIsReady = false.obs;

  onSessionAddClick() {
    Get.to(() => const TrainerAddSessionView(isCreate: true),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  onSessionEditClick() {
    Get.to(
        () => const TrainerAddSessionView(
              isCreate: false,
            ),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoRecipeDetailsView(RecipeModel recipe) {
    Get.to(
        () => RecipeDetailsView(
              recipeThumbnail: recipe.imagePath!,
              isCreate: false,
            ),
        binding: TrainerRecipeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  final List<SessionModel> sessions = List.generate(
    25,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 12 + index),
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

  final List<SessionModel> unpublishedSessions = List.generate(
    8,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 28 + index),
        title: "Yoga Teacher Training Everything You Need${1 + index}",
        desc: "",
        caloriesToBurn: "${123 + index}",
        duration: "${12 + index}",
        bre: "Bre",
        price: "${27 + index}",
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: SessionRatingModel(
            id: index, rating: "4.2", totalCount: "${5 + index}")),
  );

  gotoSessionRatingView() {
    Get.to(() => const TrainerSessionRatingView(title: "Review"),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  void singleSessionClick(
      SessionType sessionType, bool purchasedSession, SessionModel sessionModel,
      {required bool isCreate}) {
    Get.to(
        () => TrainerSessionDetailsView(
            title: "High-Intensity Interval Training1",
            sessionModel: sessionModel,
            isReadyToPublish: isCreate,
            sessionType: sessionType),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }
}
