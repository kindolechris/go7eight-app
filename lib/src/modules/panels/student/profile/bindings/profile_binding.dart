import 'package:get/get.dart';
import 'package:go7eight/src/modules/panels/student/preference/controllers/preference_controller.dart';
import 'package:go7eight/src/modules/panels/student/profile/controllers/edit_profile_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.lazyPut(() => ProfileController());
    Get.put(PreferenceController(),);
    Get.lazyPut<PreferenceController>(() => PreferenceController(),);
    Get.put(EditProfileController());
    Get.lazyPut(() => EditProfileController());
  }
}
