import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/meal_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/recipe_image_data.dart';
import 'package:go7eight/src/models/recipe_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/recipe_widget.dart';

import '../../controllers/session_controllers.dart';
import 'session_recipe_add_bottomsheet.dart';

class NutritionSessionRecipeListView extends GetView<SessionController> {
  const NutritionSessionRecipeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.gotoAddMealView(mealType: MealType.breakfast);
              },
              child: RecipeWidget(
                addAction: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return const RecipeAddBottomSheet();
                    },
                  );
                },
                recipe: RecipeModel(
                    id: index,
                    title: "Chicken & Waffles$index",
                    desc: "",
                    imagePath: recipeImageGet(id: index),
                    duration: "",
                    totalCalories: "150",
                    totalProteins: "50g",
                    totalFats: "14g",
                    totalCarbs: "32g",
                    isBookmarked: false),
                width: Get.width,
              ),
            );
          }),
    );
  }
}
