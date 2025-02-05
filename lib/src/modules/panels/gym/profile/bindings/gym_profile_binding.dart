import 'package:get/get.dart';
import '../controllers/gym_edit_profile_controller.dart';
import '../controllers/gym_profile_controller.dart';

class GYMProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMProfileController());
    Get.lazyPut(() => GYMProfileController());
    Get.put(GYMEditProfileController());
    Get.lazyPut(() => GYMEditProfileController());

  }
}
