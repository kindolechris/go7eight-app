import 'package:get/get.dart';

import '../controllers/community_notification_controller.dart';



class CommunityNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommunityNotificationController());
    Get.lazyPut(() => CommunityNotificationController());

  }
}
