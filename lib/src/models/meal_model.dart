
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../core/enums/meal_type_enum.dart';
import 'food_model.dart';
import 'recipe_model.dart';

class MealModel{
  int id;
  String name;
  String desc;
  String iconPath;
  MealType mealType;
  RxList<FoodModel>? foodList;
  RxList<RecipeModel>? recipeList;
  bool? isSelected;

  MealModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.iconPath,
    required this.mealType,
    this.foodList,
    this.recipeList,
    this.isSelected=false
  });
}