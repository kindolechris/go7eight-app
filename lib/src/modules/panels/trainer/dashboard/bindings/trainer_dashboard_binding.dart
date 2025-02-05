import 'package:get/get.dart';

import '../controllers/trainer_dashboard_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(TrainerDashboardController(),permanent: true);
    Get.lazyPut<TrainerDashboardController>(
          () => TrainerDashboardController(),
    );
  }
}
