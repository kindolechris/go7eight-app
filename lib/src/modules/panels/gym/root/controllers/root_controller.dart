import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/gym/employee/view/employee_view.dart';
import 'package:go7eight/src/modules/panels/gym/profile/views/gym_profile_view.dart';
import '../../dashboard/view/gym_dashboard_view.dart';

class GYMRootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool profileIsConnected = false.obs;
  DateTime cTime =DateTime.now();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> widgetOptions = <Widget>[
    const GYMDashboardView(),
    const GYMEmployeeView(),
    const GYMProfileView(),
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
