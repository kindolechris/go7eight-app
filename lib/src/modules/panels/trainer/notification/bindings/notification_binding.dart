

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';


class TrainerNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrainerNotificationController());
    Get.lazyPut(() => TrainerNotificationController());
  }
}
