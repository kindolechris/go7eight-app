import 'package:get/get.dart';

import '../controllers/employee_controller.dart';

class GYMEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMEmployeeController());
    Get.lazyPut(() => GYMEmployeeController());

  }
}
