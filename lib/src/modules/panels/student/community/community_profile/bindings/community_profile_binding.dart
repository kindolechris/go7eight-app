import 'package:get/get.dart';

import '../controllers/community_profile_controller.dart';


class CommunityProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommunityProfileController());
    Get.lazyPut(() => CommunityProfileController());

  }
}
