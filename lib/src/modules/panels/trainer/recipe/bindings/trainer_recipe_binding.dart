import 'package:get/get.dart';
import '../controllers/trainer_add_recipe_controller.dart';
import '../controllers/trainer_recipe_controller.dart';


class TrainerRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrainerRecipeController());
    Get.lazyPut(() => TrainerRecipeController());
    Get.put(TrainerAddRecipeController());
    Get.lazyPut(() => TrainerAddRecipeController());

  }
}
