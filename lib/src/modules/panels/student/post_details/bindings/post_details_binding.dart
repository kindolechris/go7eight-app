

import 'package:get/get.dart';
import 'package:go7eight/src/modules/panels/student/post_details/controllers/post_details_controller.dart';

class PostDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostDetailsController());
    Get.lazyPut(() => PostDetailsController());
  }
}
