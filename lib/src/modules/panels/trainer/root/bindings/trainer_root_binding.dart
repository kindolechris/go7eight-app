import 'package:get/get.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/controllers/trainer_challenge_controller.dart';
import 'package:go7eight/src/modules/panels/trainer/recipe/controllers/trainer_recipe_controller.dart';
import 'package:go7eight/src/modules/panels/trainer/session/controllers/trainer_session_controller.dart';
import 'package:go7eight/src/modules/panels/trainer/transfer/controllers/trainer_transfer_controllers.dart';
import 'package:go7eight/src/theme/controller/theme_controller.dart';

import '../../dashboard/controllers/trainer_dashboard_controller.dart';
import '../../profile/controllers/trainer_profile_controller.dart';
import '../controllers/trainer_root_controller.dart';

class TrainerRootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<TrainerRootController>(
      () => TrainerRootController(),
    );
    Get.put(TrainerRootController(), permanent: true);

    Get.put(TrainerDashboardController(), permanent: true);
    Get.put(TrainerProfileController(), permanent: true);
    Get.put(TrainerTransferController(), permanent: true);
    Get.put(TrainerChallengeListController(), permanent: true);
    Get.put(TrainerSessionController(), permanent: true);
    Get.put(TrainerRecipeController(), permanent: true);

    Get.lazyPut(() => TrainerDashboardController());
    Get.lazyPut(
      () => TrainerProfileController(),
    );
    Get.lazyPut(
      () => TrainerTransferController(),
    );
    Get.lazyPut(
      () => TrainerChallengeListController(),
    );
    Get.lazyPut(
      () => TrainerSessionController(),
    );
    Get.lazyPut(
      () => TrainerRecipeController(),
    );
  }
}
