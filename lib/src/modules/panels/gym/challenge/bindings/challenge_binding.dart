
import 'package:get/get.dart';

import '../controllers/challenge_detail_controller.dart';

class GYMChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GYMChallengeController());
    Get.lazyPut(() => GYMChallengeController());
  }
}