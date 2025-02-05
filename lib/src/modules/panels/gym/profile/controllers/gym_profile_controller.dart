import 'package:intl/intl.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dataSource/local/admin_profile_option.dart';
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
import 'package:go7eight/src/modules/auth/views/login/login_view.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/bindings/instructor_employee_binding.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/views/instructor_varification_profile_view.dart';
import 'package:go7eight/src/theme/controller/theme_controller.dart';

class GYMProfileController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();
  TextEditingController keyWordController = TextEditingController();
  TextEditingController appName = TextEditingController();
  TextEditingController appVersion = TextEditingController();
  TextEditingController appSize = TextEditingController();
  TextEditingController appUpdatedDate = TextEditingController();
  TextEditingController appType = TextEditingController();
  TextEditingController appVersionType = TextEditingController();
  TextEditingController termsNConditionTitle = TextEditingController();

  RxBool isDarkMode = false.obs;
  final Rx<String> _currentModeName = ''.obs;
  RxList<ProfileOptionModel> profileOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> adminOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> historyOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> settingOptions = <ProfileOptionModel>[].obs;
  RxInt myRegularChallengeIndex = 0.obs;
  RxInt myNutritionChallengeIndex = 0.obs;
  RxBool isChallengesSelected = true.obs;
  final RxList<String> typeOfFilterSessionItem = ['Exercise', 'Nutrition'].obs;
  RxString selectedFilterSessionItem = 'Exercise'.obs;
  RxString selectedSortValue = 'Date'.obs;
  RxBool viewAboutSection = false.obs;
  RxList<OptionModel> appLanguageData = [
    OptionModel(true, 'English', "en_US"),
    OptionModel(false, 'Spanish', "es_ES"),
    OptionModel(false, 'Hindi', "hi_IN"),
    OptionModel(false, 'German', "gr_DE"),
    OptionModel(false, 'Arabic', "ar_AE"),
    OptionModel(false, 'French', "fr_FR"),
  ].obs;
  Rx<OptionModel> appLanguageSelected = OptionModel(false, "", "").obs;

  void changeLanguage() {
    String languageCode = appLanguageSelected.value.description.split("_")[0];
    String countryCode = appLanguageSelected.value.description.split("_")[1];
    Locale locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    _themeController.setLocale(locale);
    SnackBarX.showSuccess(
        title: "lbl_language_change".tr,
        message: "${"lbl_language_change_message".tr}${appLanguageSelected.value.text}");
  }

  @override
  void onInit() {
    isDarkMode.value = _themeController.isDarkTheme;
    _currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';
    profileOptions.value = getAdminAccountOptionData();
    settingOptions.value = getSettingOptionData();
    historyOptions.value = getHistoryOptionData();
    adminOptions.value = getAdminAdministrationOptionData();
    _setAboutInfoData();
    _getAppLocal();
    super.onInit();
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

  _setAboutInfoData() {
    appName.text = "Fitnofy";
    appVersion.text = "v0.0.1";
    appSize.text = "70.62mb";
    appUpdatedDate.text = DateFormat('MM-dd-yyyy').format(DateTime.now());
    appType.text = "Fitness App";
    appVersionType.text = "Demo Version";
    termsNConditionTitle.text = "Terms & Conditions";
  }

  onTermsNConditionSave() {
    Get.back();
    SnackBarX.showSuccess(
        title: "term_n_condition_snack_title",
        message: "term_n_condition_snack_message");
  }

  onEmployeeClick(SessionType sessionType) {
    Get.to(() => const InstructorProfileVerificationView(),
        binding: InstructorEmployeeBinding(),
        duration: const Duration(milliseconds: 400),
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

  void logoutPressed() {
    Get.offAll(() => const LoginView(),
        binding: AuthBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  final List<ChallengeModel> challenges = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 5 + index),
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

  final List<SessionModel> sessions = List.generate(
    38,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: index),
        title: "High-Intensity Interval Training${1 + index}",
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
  final List<TrainerModel> trainers = List.generate(
    20,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 18 + index),
        name: trainerNameGet(id: index),
        type: index % 2 == 0 ? "Fitness Trainer" : "Nutritionist",
        isFollowed: true),
  );
  final RxList<TrainerModel> featuredTrainers = List.generate(
    10,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 25 + index),
        name: trainerNameGet(id: 25 + index),
        type: index % 2 == 0 ? "Fitness Trainer" : "Nutritionist",
        isFollowed: true),
  ).obs;
}
