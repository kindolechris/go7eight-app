import 'package:get/get.dart';
import 'package:go7eight/src/modules/panels/student/meal/controllers/meal_controller.dart';
import 'package:go7eight/src/modules/panels/student/session/controllers/session_controllers.dart';
import 'package:go7eight/src/modules/panels/student/workout/controllers/workout_controller.dart';
import '../../../../../theme/controller/theme_controller.dart';
import '../../community/community_home/controller/community_home_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.put(HomeController(), permanent: true);
    Get.put(RootController(), permanent: true);
    Get.put(SessionController(), permanent: true);
    Get.put(MealController(), permanent: true);
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => WorkoutController());
    Get.lazyPut(
      () => MealController(),
    );
    Get.lazyPut(() => CommunityHomeController());
  }
}
