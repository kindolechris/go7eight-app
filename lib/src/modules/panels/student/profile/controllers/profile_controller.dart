import 'dart:convert';

import 'package:go7eight/main.dart';
import 'package:go7eight/src/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/core/utils/snackbar.dart';
import 'package:go7eight/src/data/dataSource/local/profile_option_data.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/profile_option_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/modules/auth/bindings/auth_binding.dart';
import 'package:go7eight/src/modules/auth/controllers/login_controller.dart';
import 'package:go7eight/src/modules/auth/views/login/login_view.dart';
import 'package:go7eight/src/modules/auth/views/login_or_sign_up_view/login_or_sign_up_view.dart';
import 'package:go7eight/src/modules/panels/student/challenge/bindings/challenge_binding.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/student/instructor/bindings/instructor_public_binding.dart';
import 'package:go7eight/src/modules/panels/student/instructor/views/instructor_public_profile_view.dart';
import 'package:go7eight/src/theme/controller/theme_controller.dart';

import '../../../../../models/user.dart';
import '../../session/bindings/session_binding.dart';
import '../../session/views/session_details_view.dart';

class ProfileController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();
  final LoginController loginController = Get.find<LoginController>();
  RxBool isDarkMode = false.obs;
  RxBool isLoading = false.obs;
  final Rx<String> _currentModeName = ''.obs;
  RxList<ProfileOptionModel> profileOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> settingOptions = <ProfileOptionModel>[].obs;
  RxInt myRegularChallengeIndex = 0.obs;
  RxInt myNutritionChallengeIndex = 0.obs;
  RxBool isExerciseSelected = true.obs;
  RxList<OptionModel> appLanguageData = [
    OptionModel(true, 'English', "en_US"),
    OptionModel(false, 'Spanish', "es_ES"),
    OptionModel(false, 'Hindi', "hi_IN"),
    OptionModel(false, 'German', "gr_DE"),
    OptionModel(false, 'Arabic', "ar_AE"),
    OptionModel(false, 'French', "fr_FR"),
  ].obs;
  Rx<OptionModel> appLanguageSelected = OptionModel(false, "", "").obs;
  final Rx<Customer> customer = Rx<Customer>(Customer());

  @override
  void onInit() {
    isDarkMode.value = _themeController.isDarkTheme;
    _currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';
    profileOptions.value = getProfileOptionData();
    settingOptions.value = getSettingOptionData();
    _getAppLocal();
    super.onInit();
    loadUsers();
  }

  setLoading(value){
    isLoading.value = value;
  }

  // Load users from local storage
  void loadUsers() {
    var jsonCustomer = storageInstance.read('customer');
    if (customer != null) {
      customer.value = Customer.fromJson(jsonDecode(jsonCustomer));
    }
  }

  _getAppLocal() async {
    Locale locale = await _themeController.getLocale();
    appLanguageSelected.value = appLanguageData.firstWhere((element) =>
        element.description ==
        "${locale.languageCode}_${locale.countryCode}");
    for (var element in appLanguageData) {
      if (element == appLanguageSelected.value) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    appLanguageData.refresh();
  }

  void changeLanguage() {
    String languageCode = appLanguageSelected.value.description.split("_")[0];
    String countryCode = appLanguageSelected.value.description.split("_")[1];
    Locale locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    _themeController.setLocale(locale);
    SnackBarX.showSuccess(
        title: "lbl_language_change".tr,
        message: "lbl_language_change_message".tr +
            appLanguageSelected.value.text);
  }
  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(() => SessionDetailsView(
            mySession: purchasedSession,
            session: sessionModel,
            sessionType: sessionType),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  bool toggleTheme() {
    _currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';
    _changeTheme();
    return isDarkMode.value;
  }

  void _changeTheme() {
    _themeController.changeTheme(
      isDarkMode: isDarkMode,
      modeName: _currentModeName,
    );
    isDarkMode.value = _themeController.isDarkTheme;
  }

  trainerFollowToggle(int index) {
    if (myFollowingTrainers[index].isFollowed == false) {
      myFollowingTrainers[index].isFollowed = true;
      SnackBarX.showSuccess(
          title: "follow_trainer_snack_title",
          message: "follow_trainer_snack_message");
    } else {
      myFollowingTrainers[index].isFollowed = false;
      SnackBarX.showWarning(
          title: "unfollow_trainer_snack_title",
          message: "unfollow_trainer_snack_message");
    }
  }

  gotoInstructorPublicView(SessionType sessionType, TrainerModel trainer) {
    Get.to(
            () => InstructorPublicView(sessionType: sessionType, trainer: trainer),
        binding: InstructorPublicBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  Future<void> logoutPressed() async {
    storageInstance.remove("isLogged");
    loginController.signOutGoogle();
    Get.offAll(() => const LoginOrSignUpView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoChallengeDetailedView(bool purchasedChallenge,
      {required ChallengeModel challengeModel}) {
    Get.to(
            () => ChallengeDetailsView(
          title: "Challenge",
          challenge: challengeModel,
          myChallenge: purchasedChallenge,
          sessionType: SessionType.regular,
        ),
        binding: ChallengeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }
  final List<SessionModel> myScheduledSessions = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 23 + index),
        title: "High-Intensity Interval Training${1 + index}",
        desc: "",
        caloriesToBurn: "${150 + index}",
        duration: "${15 + index}",
        bre: "Bre",
        price: "${23 + index}",
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: SessionRatingModel(
            id: index, rating: "4.8", totalCount: "${200 + index}")),
  );
  final List<SessionModel> myNutritionSessions = List.generate(
    13,
    (index) => SessionModel(
        id: index,
        imagePath: sessionNutritionImageGet(id: 13 + index),
        title: "Vega Organic All-in-One${1 + index}",
        desc: "",
        caloriesToBurn: "${150 + index}",
        duration: "${15 + index}",
        bre: "Bre",
        price: "${23 + index}",
        recipeCount: index + 20,
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: SessionRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  final List<ChallengeModel> myRegularChallenges = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: 14 + index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 11 + index),
            name: "Talan Gouse",
            type: "Fitness Trainer"),
        duration: "${15 + index}",
        timeRange: "15-30",
        isBookMarked: false,
        totalMembers: "${index + 9}K+",
        workoutFocus: "Full Body",
        workoutType: "Gym",
        price: "${150 + index}",
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: ChallengeRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  final List<ChallengeModel> myNutritionChallenges = List.generate(
    4,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeNutritionImageGet(id: index),
        title: "Simple 30-Day Summer Meal Plan${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 27 + index),
            name: "Simon Fisck",
            type: "Nutritionist"),
        duration: "${15 + index}",
        timeRange: "15-30",
        isBookMarked: false,
        totalMembers: "${index + 9}K+",
        workoutFocus: "Full Body",
        workoutType: "Gym",
        price: "${150 + index}",
        tags: List.generate(
            5,
            (tagIndex) => ProductTagModel(
                id: tagIndex,
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: ChallengeRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );

  final List<TrainerModel> myFollowingTrainers = List.generate(
    20,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 14 + index),
        name: trainerNameGet(id: index + 25),
        type: index % 2 == 0 ? "Fitness Trainer" : "Nutritionist",
        isFollowed: true),
  );


}
