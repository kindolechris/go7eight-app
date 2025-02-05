

import 'package:get/get.dart';

import '../controllers/instructor_employee_controller.dart';



class InstructorEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InstructorEmployeeController());
    Get.lazyPut(() => InstructorEmployeeController());
  }
}
