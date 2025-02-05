import 'package:get/get.dart';

import '../controllers/trainer_session_add_controller.dart';
import '../controllers/trainer_session_controller.dart';


class TrainerSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrainerSessionController());
    Get.lazyPut(() => TrainerSessionController());
    Get.put(TrainerSessionAddController());
    Get.lazyPut(() => TrainerSessionAddController());

  }
}
