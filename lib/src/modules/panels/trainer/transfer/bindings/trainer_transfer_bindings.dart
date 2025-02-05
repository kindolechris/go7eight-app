import 'package:get/get.dart';

import '../controllers/trainer_transfer_controllers.dart';


class TrainerTransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrainerTransferController());
    Get.lazyPut(() => TrainerTransferController());
  }
}
