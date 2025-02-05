
import '../../../core/app_export.dart';
import '../../../core/enums/meal_type_enum.dart';
import '../../../models/food_model.dart';
import '../../../models/meal_model.dart';
import '../../../models/recipe_model.dart';

List<MealModel> getMealData() {
  final List<MealModel> meals = [
    MealModel(
      id: 0,
      name: "breakfast_lbl",
      desc: "",
      iconPath: AppIcon.breakfastIcon,
      mealType: MealType.breakfast,
      foodList: <FoodModel>[].obs,
      recipeList: <RecipeModel>[].obs
    ),
    MealModel(
      id: 1,
      name: "lunch_lbl",
      desc: "",
      iconPath: AppIcon.lunchIcon,
        mealType: MealType.lunch,
        foodList: <FoodModel>[].obs,
        recipeList: <RecipeModel>[].obs
    ),
    MealModel(
      id: 2,
      name: "dinner_lbl",
      desc: "",
      iconPath: AppIcon.dinnerIcon,
        mealType: MealType.dinner,
        foodList: <FoodModel>[].obs,
        recipeList: <RecipeModel>[].obs
    ),
  ];

  return meals;
}