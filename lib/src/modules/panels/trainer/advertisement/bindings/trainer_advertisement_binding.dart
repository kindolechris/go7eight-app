import 'package:get/get.dart';

import '../controllers/trainer_advertisement_controller.dart';
class TrainerAdvertisementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrainerAdvertisementController());
    Get.lazyPut(() => TrainerAdvertisementController());

  }
}
