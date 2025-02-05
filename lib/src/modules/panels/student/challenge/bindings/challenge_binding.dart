
import 'package:get/get.dart';

import '../controllers/challenge_detail_controller.dart';

class ChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChallengeController());
    Get.lazyPut(() => ChallengeController());
  }
}