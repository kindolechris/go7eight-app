import 'package:get/get.dart';

import '../controllers/trainer_add_challenge_controller.dart';
import '../controllers/trainer_challenge_controller.dart';


class TrainerChallengeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrainerChallengeListController());
    Get.lazyPut(() => TrainerChallengeListController());

    Get.put(TrainerAddChallengeController());
    Get.lazyPut(() => TrainerAddChallengeController());

  }
}
