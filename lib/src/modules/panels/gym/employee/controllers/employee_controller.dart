import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dataSource/local/user_type_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/modules/panels/gym/employee/view/add_employee_view.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/bindings/instructor_employee_binding.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/views/instructor_employee_profile_view.dart';

class GYMEmployeeController extends GetxController {
  RxBool isTrainerSelected = true.obs;
  RxList<UserTypeModel> userTypes = <UserTypeModel>[].obs;
  TextEditingController firstNameTextController = TextEditingController();
  RxBool showFirstNameError = false.obs;
  TextEditingController lastNameTextController = TextEditingController();
  RxBool showLastNameError = false.obs;
  TextEditingController emailTextController = TextEditingController();
  RxBool showEmailError = false.obs;
  TextEditingController passwordTextController = TextEditingController();
  RxBool showPasswordError = false.obs;

  @override
  void onInit() {
    userTypes.value = getUserTypeData();
    super.onInit();
  }

  onUserTypeSelection(UserTypeModel userType) {
    List<UserTypeModel> tempUserType = <UserTypeModel>[];
    for (var user in userTypes) {
      if (user == userType) {
        user.isSelected = true;
      } else {
        user.isSelected = false;
      }
      tempUserType.add(user);
    }
    userTypes.value = tempUserType;
  }

  onEmployeeAddClick() {
    Get.to(() => const AddEmployeeView(),
        duration: const Duration(milliseconds: 400), transition: Transition.fadeIn);
  }

  onEmployeeClick(SessionType sessionType) {
    Get.to(() => InstructorEmployeeView(sessionType: sessionType),
        binding: InstructorEmployeeBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  final List<TrainerModel> myFitnessTrainers = List.generate(
    20,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 12 + index),
        name: trainerNameGet(id: 20 + index),
        type: "Fitness Trainer",
        isFollowed: true),
  );

  final List<TrainerModel> myNutritionists = List.generate(
    12,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerNutritionImageGet(id: 22 + index),
        name: trainerNameGet(id: 11 + index),
        type: "Nutritionist",
        isFollowed: true),
  );
}
