import 'package:get/get.dart';

import '../controllers/meal_controller.dart';

class MealBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MealController());
    Get.lazyPut(() => MealController());

  }
}
