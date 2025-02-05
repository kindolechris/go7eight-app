import 'package:get/get.dart';
import 'package:go7eight/src/modules/panels/student/session/controllers/session_controllers.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionController());
    Get.lazyPut(() => SessionController());
  }
}
