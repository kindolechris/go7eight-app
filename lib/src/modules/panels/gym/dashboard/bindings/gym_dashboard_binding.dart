import 'package:get/get.dart';
import '../controllers/gym_dashboard_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMDashboardController(), permanent: true);
    Get.lazyPut<GYMDashboardController>(
      () => GYMDashboardController(),
    );
  }
}
