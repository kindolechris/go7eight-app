import 'package:intl/intl.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dataSource/local/trainer_profile_option.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_data_by_category.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_data_by_category.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/data/dummy_dataset/user_image_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/profile_option_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
import 'package:go7eight/src/models/user_model.dart';
import 'package:go7eight/src/modules/auth/bindings/auth_binding.dart';
import 'package:go7eight/src/modules/auth/views/login/login_view.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/bindings/instructor_employee_binding.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/views/instructor_varification_profile_view.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/bindings/trainer_challenge_binding.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/view/add_challenge_view.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/view/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/trainer/session/bindings/trainer_session_binding.dart';
import 'package:go7eight/src/modules/panels/trainer/session/view/session_add_view.dart';
import 'package:go7eight/src/modules/panels/trainer/session/view/tainer_session_details_view.dart';
import 'package:go7eight/src/theme/controller/theme_controller.dart';

class TrainerProfileController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();
  RxBool isDarkMode = false.obs;
  final Rx<String> _currentModeName = ''.obs;
  RxList<ProfileOptionModel> profileOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> adminOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> settingOptions = <ProfileOptionModel>[].obs;
  RxList<ProfileOptionModel> historyOptions = <ProfileOptionModel>[].obs;
  RxInt myRegularChallengeIndex = 0.obs;
  RxInt myNutritionChallengeIndex = 0.obs;
  RxBool isChallengesSelected = true.obs;
  String appName = "Fitnofy";
  String appVersion = "v0.0.1";
  String appSize = "70.62mb";
  String appUpdatedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());
  String appType = "Fitness App";
  String appVersionType = "Demo Version";

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
        message: "lbl_language_change_message".tr +
            appLanguageSelected.value.text);
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

  final List<ChallengeModel> challenges = List.generate(
    7,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: 13 + index),
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

  final List<SessionModel> unpublishedSessions = getGymSessionListData();
  final List<ChallengeModel> unpublishedChallenges = getDietChallengeListData();
  final List<TrainerModel> trainers = List.generate(
    20,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 12 + index),
        name: trainerNameGet(id: index + 8),
        type: index % 2 == 0 ? "Fitness Trainer" : "Nutritionist",
        isFollowed: true),
  );
  final List<UserModel> userList = List.generate(
    15,
    (index) => UserModel(
        id: index,
        imagePath: userImageGet(id: 1 + index),
        name: "Carmelo Delfina",
        bio: "",
        height: "6ft 1inch",
        weight: "${100 - index}kgs",
        challengeCompleted: "${13 - index}",
        sessionCompleted: "${38 - index}",
        isInCommunity: true),
  );

  @override
  void onInit() {
    isDarkMode.value = _themeController.isDarkTheme;
    _currentModeName.value = _themeController.isDarkTheme ? 'Dark' : 'Light';
    profileOptions.value = getTrainerAccountOptionData();
    settingOptions.value = getTrainerSettingOptionData();
    adminOptions.value = getTrainerAdministrationOptionData();
    historyOptions.value = getHistoryOptionData();
    _getAppLocal();
    super.onInit();
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

  gotoChallengeDetails(
      {required ChallengeModel challenge, required SessionType sessionType}) {
    Get.to(
        () => TrainerChallengeDetailsView(
              title: challenge.title!,
              isReadyToPublish: false,
              challenge: challenge,
            ),
        binding: TrainerChallengeListBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  onChallengeEditClick() {
    Get.to(
        () => const TrainerAddChallengeView(
              isCreate: false,
            ),
        binding: TrainerChallengeListBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void singleSessionClick(SessionType sessionType, SessionModel sessionModel) {
    Get.to(
        () => TrainerSessionDetailsView(
            title: "High-Intensity Interval Training1",
            sessionModel: sessionModel,
            isReadyToPublish: false,
            sessionType: sessionType),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn);
  }

  onSessionAddClick() {
    Get.to(() => const TrainerAddSessionView(isCreate: true),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  onSessionEditClick() {
    Get.to(
        () => const TrainerAddSessionView(
              isCreate: false,
            ),
        binding: TrainerSessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }
}
