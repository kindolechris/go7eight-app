
import 'package:get/get.dart';

import '../controllers/session_controllers.dart';

class GYMSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMSessionController());
    Get.lazyPut(() => GYMSessionController());
  }
}
