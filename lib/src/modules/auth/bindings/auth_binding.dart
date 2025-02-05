
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/registration_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.lazyPut(() => LoginController());
    Get.put(RegistrationController());
    Get.lazyPut(() => RegistrationController());
  }
}
