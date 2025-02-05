import 'package:get/get.dart';

import '../controller/community_home_controller.dart';


class CommunityHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommunityHomeController());
    Get.lazyPut(() => CommunityHomeController());

  }
}
