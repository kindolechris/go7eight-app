import 'package:get/get.dart';

import '../controllers/gym_transfer_controllers.dart';

class GYMTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMTransferController());
    Get.lazyPut(() => GYMTransferController());
  }
}
