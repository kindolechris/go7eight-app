import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/view/trainer_challenge_list_view.dart';
import 'package:go7eight/src/modules/panels/trainer/recipe/view/trainer_recipe_list_view.dart';
import 'package:go7eight/src/modules/panels/trainer/session/view/trainer_session_list_view.dart';

import '../../dashboard/view/trainer_dashboard_view.dart';
import '../../profile/views/trainer_profile_view.dart';

class TrainerRootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool profileIsConnected = false.obs;
  DateTime cTime = DateTime.now();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> widgetOptions = <Widget>[
    const TrainerDashboardView(),
    const TrainerChallengeListView(),
    const TrainerSessionView(),
    const TrainerRecipeView(),
    const TrainerProfileView(),
  ];

  bool onWillPop() {
    DateTime now = DateTime.now();
    if ( now.difference(cTime) > const Duration(seconds: 2)) {
      cTime = now;

      return false;
    }

    return true;
  }

}
