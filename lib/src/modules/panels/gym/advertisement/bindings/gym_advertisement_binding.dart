import 'package:get/get.dart';

import '../controllers/gym_advertisement_controller.dart';
class GYMAdvertisementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMAdvertisementController());
    Get.lazyPut(() => GYMAdvertisementController());

  }
}
