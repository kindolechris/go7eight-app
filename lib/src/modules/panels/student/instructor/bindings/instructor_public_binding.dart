

import 'package:get/get.dart';

import '../controllers/instructor_public_controller.dart';



class InstructorPublicBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InstructorPublicController());
    Get.lazyPut(() => InstructorPublicController());
  }
}
