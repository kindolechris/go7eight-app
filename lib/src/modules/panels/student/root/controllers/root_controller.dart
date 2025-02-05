
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/community_home_view.dart';
import 'package:go7eight/src/modules/panels/student/home/views/home_view.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/meal_view.dart';
import 'package:go7eight/src/modules/panels/student/profile/views/profile_view.dart';
import 'package:go7eight/src/modules/panels/student/workout/views/workout_view.dart';

import '../../user_account/user_account.dart';

class RootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool profileIsConnected = false.obs;
  RxBool isBiometricModalShown = false.obs;
  DateTime cTime = DateTime.now();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const AnalyticsView(),
    const AddPostView(),
    const MessageView(),
    const UserAccountView()
  ];

  setBottomSheetVisibility(bool value) {
    isBiometricModalShown.value = value;
  }

  bool onWillPop() {
    DateTime now = DateTime.now();
    if ( now.difference(cTime) > const Duration(seconds: 2)) {
      cTime = now;

      return false;
    }
    return true;
  }
}
