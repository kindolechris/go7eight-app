import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/meal_type_enum.dart';
import 'package:go7eight/src/data/dataSource/local/meal_data.dart';
import 'package:go7eight/src/data/dummy_dataset/food_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/recipe_image_data.dart';
import 'package:go7eight/src/models/food_model.dart';
import 'package:go7eight/src/models/meal_model.dart';
import 'package:go7eight/src/models/recipe_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/add_meal_view.dart';
import 'package:go7eight/src/modules/panels/student/recipe/bindings/recipe_binding.dart';

import '../../recipe/views/recipe_view.dart';

class MealController extends GetxController {
  RxBool isFoodSelected = true.obs;
  RxList<MealModel> meals = <MealModel>[].obs;
  TextEditingController searchMealTextController = TextEditingController();

  RxBool isSearching = false.obs;
  RxBool isSearchDone = false.obs;
  RxBool noResultFound = false.obs;
  RxList<OptionModel> filerOptions = <OptionModel>[
    OptionModel(true, "all_lbl", ""),
    OptionModel(false, "breakfast_lbl", ""),
    OptionModel(false, "lunch_lbl", ""),
    OptionModel(false, "dinner_lbl", ""),
  ].obs;

  @override
  void onInit() {
    meals.value = getMealData();
    super.onInit();
  }

  addItemToRecentSearch(String value) {
    isSearchDone.value = true;
    if (value.toLowerCase() == "no meal") {
      noResultFound.value = true;
    } else {
      noResultFound.value = false;
    }
  }

  List<FoodModel> foods = List.generate(
      45,
      (index) => FoodModel(
            id: index,
            title: "Vega Organic All-in-One",
            imagePath: foodImageGet(id: index),
            mealType: index % 3 == 0
                ? "Lunch"
                : index % 2 == 0
                    ? "Breakfast"
                    : "Dinner",
            totalCalories: "${index + 150}",
            duration: "${index + 15}",
          ));
  List<RecipeModel> recipes = List.generate(
      23,
      (index) => RecipeModel(
            id: index,
            title: "Chicken & Waffles",
            imagePath: recipeImageGet(id: index),
            totalCalories: "${index + 150}",
            totalFats: "${index + 12}",
            totalCarbs: "${index + 30}",
            totalProteins: "${index + 50}",
            duration: "${index + 15}",
          ));
  gotoAddMealView({required MealType mealType}) {
    Get.to(
        () => AddMealView(
              mealType: mealType,
            ),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoRecipeDetailsView(RecipeModel recipe) {
    Get.to(() => RecipeView(recipeThumbnail: recipe.imagePath!),
        binding: RecipeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  addFoodToMeal(MealType mealType, FoodModel food) {
    switch (mealType) {
      case MealType.breakfast:
        meals[0].foodList?.add(food);
        break;
      case MealType.lunch:
        meals[1].foodList?.add(food);
        break;
      case MealType.dinner:
        meals[2].foodList?.add(food);
        break;
    }
    SnackBarX.showSuccess(title: "meal_add_title", message: "food_add_message");
  }

  addRecipeToMeal(MealType mealType, RecipeModel recipe) {
    switch (mealType) {
      case MealType.breakfast:
        meals[0].recipeList?.add(recipe);
        break;
      case MealType.lunch:
        meals[1].recipeList?.add(recipe);
        break;
      case MealType.dinner:
        meals[2].recipeList?.add(recipe);
        break;
    }

    SnackBarX.showSuccess(
        title: "meal_add_title", message: "recipe_add_message");
  }
}
