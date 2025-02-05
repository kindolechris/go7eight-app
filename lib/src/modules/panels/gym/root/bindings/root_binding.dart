import 'package:get/get.dart';
import 'package:go7eight/src/modules/panels/gym/profile/controllers/gym_edit_profile_controller.dart';
import 'package:go7eight/src/modules/panels/gym/transfer/controllers/gym_transfer_controllers.dart';
import 'package:go7eight/src/theme/controller/theme_controller.dart';
import '../../dashboard/controllers/gym_dashboard_controller.dart';
import '../../employee/controllers/employee_controller.dart';
import '../../profile/controllers/gym_profile_controller.dart';
import '../controllers/root_controller.dart';

class GYMRootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<GYMRootController>(
      () => GYMRootController(),
    );
    Get.put(GYMDashboardController(), permanent: true);
    Get.put(GYMTransferController(), permanent: true);
    Get.put(GYMProfileController(), permanent: true);
    Get.put(GYMEmployeeController(), permanent: true);
    Get.put(GYMRootController(), permanent: true);
    Get.put(GYMEditProfileController(), permanent: true);
    Get.lazyPut(() => GYMDashboardController());
    Get.lazyPut(() => GYMEmployeeController());
    Get.lazyPut(
      () => GYMProfileController(),
    );
    Get.lazyPut(
      () => GYMTransferController(),
    );
    Get.lazyPut(
      () => GYMEditProfileController(),
    );
  }
}
