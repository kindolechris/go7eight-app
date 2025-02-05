import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/recipe_image_data.dart';
import 'package:go7eight/src/models/recipe_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import '../bindings/trainer_recipe_binding.dart';
import '../view/add_recipe_view.dart';
import '../view/recipe_details_view.dart';

class TrainerRecipeController extends GetxController {
  RxBool isIngredientsSelected = true.obs;
  RxBool showBrandSelected = true.obs;
  RxBool showSpicesSelected = true.obs;
  RxInt personCount = 1.obs;

  List<OptionModel> instructionOptions = <OptionModel>[
    OptionModel(true, "Prepared", ""),
    OptionModel(false, "Cook", ""),
    OptionModel(false, "Assembly", ""),
  ];
  RxList<RecipeModel> recipes = List.generate(
      12,
      (index) => RecipeModel(
            id: index,
            title: "Chicken & Waffles",
            imagePath: recipeImageGet(id: index),
            totalCalories: "${index + 150}",
            totalFats: "${index + 12}",
            totalCarbs: "${index + 30}",
            totalProteins: "${index + 50}",
            duration: "${index + 15}",
          )).obs;

  onAddRecipe() {
    Get.to(
        () => const TrainerAddRecipeView(
              isCreate: true,
            ),
        binding: TrainerRecipeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoRecipeDetailsView({required RecipeModel recipe, required bool isCreate}) {
    Get.to(
        () => RecipeDetailsView(
              recipeThumbnail: recipe.imagePath!,
              isCreate: isCreate,
            ),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoEditRecipe() {
    Get.to(
        () => const TrainerAddRecipeView(
              isCreate: false,
            ),
        binding: TrainerRecipeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }
}
