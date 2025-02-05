import 'package:go7eight/src/modules/panels/student/preference/controllers/preference_controller.dart';

import '../../../../../core/app_export.dart';

class PreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreferenceController());
    Get.lazyPut<PreferenceController>(
      () => PreferenceController(),
    );
  }
}
