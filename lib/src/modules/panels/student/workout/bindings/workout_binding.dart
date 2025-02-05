import 'package:get/get.dart';

import '../controllers/workout_controller.dart';


class WorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WorkoutController());
    Get.lazyPut(() => WorkoutController());

  }
}
