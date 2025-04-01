import 'dart:convert';
import 'dart:math';

import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/ad_dummy_data.dart';
import 'package:go7eight/src/data/dummy_dataset/categor_data.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_data_by_category.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_video_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/models/advertisement_model.dart';
import 'package:go7eight/src/models/category_model.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/student/category/bindings/category_binding.dart';
import 'package:go7eight/src/modules/panels/student/category/views/category_view.dart';
import 'package:go7eight/src/modules/panels/student/challenge/bindings/challenge_binding.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/student/root/controllers/root_controller.dart';
import 'package:go7eight/src/modules/panels/student/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/student/session/views/nutrition_session_list_view.dart';
import 'package:go7eight/src/modules/panels/student/session/views/recent_session_list_view.dart';
import 'package:go7eight/src/modules/panels/student/session/views/session_details_view.dart';
import 'package:go7eight/src/modules/panels/student/session/views/trending_session_list_view.dart';

import '../../../../../../main.dart';
import '../../../../../models/user.dart';
import '../../instructor/bindings/instructor_public_binding.dart';
import '../../instructor/views/instructor_public_profile_view.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  TextEditingController reflectionTextController = TextEditingController();
  late TabController newsTypeTabController;
  late TabController categoryTypeTabController;
  RxList<ReflectionModel> reflections = <ReflectionModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  var page = 0;
  final Random _random = Random();
  RxList<SessionModel> allSessions = <SessionModel>[].obs;
  ScrollController scrollController = ScrollController();
  List<AdvertisementModel> advertisements = getAdvertisementListData();
  final RxDouble appBarOffset = 0.0.obs;
  double? lastScrollOffset = 0.0;
  RxBool? appBarVisible;

  final Rx<Customer> customer = Rx<Customer>(Customer());

  final List<TrainerModel> featuredTrainerList = List.generate(
    12,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 12 + index),
        name: trainerNameGet(id: index),
        type: index % 2 == 0 ? "Fitness Trainer" : "Nutritionist",
        isFollowed: true),
  );

  final List<TrainerModel> listedTrainerList = List.generate(
    12,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 1 + index),
        name: trainerNameGet(id: 12 + index),
        type: index % 2 == 0 ? "Fitness Trainer" : "Nutritionist",
        isFollowed: true),
  );
  @override
  void onInit() {
    newsTypeTabController = TabController(vsync: this, length: 3);
    categoryTypeTabController = TabController(vsync: this, length: 5);
    appBarVisible = true.obs;
    lastScrollOffset = 0.0;
    initiateData();
    super.onInit();
    loadUsers();
  }

  // Load users from local storage
  void loadUsers() {
   var jsonCustomer = storageInstance.read('customer');
    if (customer != null) {
      customer.value = Customer.fromJson(jsonDecode(jsonCustomer));
    }
  }


  Future<void> initiateData() async {
    categories.value = getCategoryData();
    scrollController.addListener(_scrollListener);
    fetchAllSessionData();
  }

  void _scrollListener() {
    final maxScroll =
        allSessions.length * (AppRatioSize.getRatioHeight() / 2.6);
    final currentScroll = scrollController.position.pixels;

    if (currentScroll >= maxScroll - 200) {
      loadMore();
    }
  }


  addReflection() {
    ReflectionModel reflection = ReflectionModel(
        id: reflections.length + 1,
        data: reflectionTextController.text,
        dateTime: DateTime.now());
    reflections.add(reflection);
    reflectionTextController.clear();
  }

  void fetchAllSessionData() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2));
      final List<SessionModel> sessionData =
          getAllPaginatedSession(itemCount: 5, pageNumber: page);
      allSessions.addAll(sessionData);
      isLoading(false);
      update();
    } catch (e) {
      isLoading(false);
    }
  }

  void loadMore() {
    if (!isLoading.value) {
      page++;
      fetchAllSessionData();
    }
  }

  void trendingSessionSeeAllClick() {
    Get.to(() => const TrendingSessionListView(),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void nutritionSessionSeeAllClick() {
    Get.to(() => const NutritionSessionListView(),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void newSessionSeeAllClick() {
    Get.to(() => const RecentSessionListView(),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void categoryClick({required CategoryModel category}) {
    Get.to(() => CategoryView(categoryName: category.name!),
        binding: CategoryBinding(),
        arguments: {'category': category},
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void challengeContinueClick({required String sessionTitle}) {
    Get.to(
        () => ChallengeDetailsView(
            title: sessionTitle,
            myChallenge: true,
            myOnGoingChallenge: true,
            challenge: ChallengeModel(
                id: 0,
                imagePath: challengeTrainingImageGet(id: 2),
                title: "30-Days Full Body Transformation${1}",
                desc: "",
                trainer: TrainerModel(
                    id: 0,
                    imagePath: trainerImageGet(id: 12),
                    name: "Talan Gouse",
                    type: "Fitness Trainer"),
                duration: "${15}",
                timeRange: "15-30",
                isBookMarked: false,
                totalMembers: "${9}K+",
                workoutFocus: "Full Body",
                workoutType: "Gym",
                price: "${150}",
                tags: List.generate(
                    5,
                    (tagIndex) => ProductTagModel(
                        id: tagIndex,
                        tag: getSessionTagNames(id: tagIndex))),
                rating: ChallengeRatingModel(
                    id: 0, rating: "4.2", totalCount: "${200}"))),
        binding: ChallengeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(
        () => SessionDetailsView(
            mySession: purchasedSession,
            session: sessionModel,
            sessionType: sessionType),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoChallengeDetailedView(SessionType sessionType, bool purchasedChallenge,
      {required ChallengeModel challengeModel}) {
    Get.to(
        () => ChallengeDetailsView(
              title: "Challenge",
              challenge: challengeModel,
              myChallenge: purchasedChallenge,
              sessionType: sessionType,
            ),
        binding: ChallengeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoInstructorPublicView(SessionType sessionType, TrainerModel trainer) {
    Get.to(
        () => InstructorPublicView(
              sessionType: sessionType,
              trainer: trainer,
            ),
        binding: InstructorPublicBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  todayScheduleClicked() {
    RootController rootController = Get.find();
    rootController.selectedIndex.value = 0;
  }



  List<SessionModel> getAllPaginatedSession(
      {required int itemCount, required pageNumber}) {
    if (pageNumber > 7) {
      page = 0;
      pageNumber = page;
    }
    final List<SessionModel> genAllSessions = List.generate(
      itemCount,
      (index) => SessionModel(
          id: pageNumber + index,
          imagePath: sessionTrainingImageGet(id: page + index),
          videoUrl: sessionTrainingVideoGet(id: 7 + index),
          title: sessionTrainingTitleGet(id: 5 + index),
          desc: "",
          caloriesToBurn: "${150 + pageNumber + index}",
          duration: "${15 + pageNumber + index}",
          bre: "Bre",
          price: "${23 + pageNumber + index}",
          tags: List.generate(
              index + _random.nextInt(5),
              (tagIndex) => ProductTagModel(
                  id: tagIndex,
                 // tag: getSessionTagNames(id: _random.nextInt(80)))),
                  tag: getSessionTagNames(id: _random.nextInt(3)))),
          rating: SessionRatingModel(
              id: pageNumber + index,
              rating: "4.2",
              totalCount: "${200 + pageNumber + index}")),
    );
    return genAllSessions;
  }

  final List<SessionModel> trendingSessions = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 7 + index),
        videoUrl: sessionTrainingVideoGet(id: 14 + index),
        title: sessionTrainingTitleGet(id: 21 + index),
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
  final List<ChallengeModel> listedChallenges = getGymChallengeListData();
  final List<SessionModel> nutritionSessions = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: sessionNutritionImageGet(id: 22 + index),
        videoUrl: sessionNutritionVideoGet(id: index),
        title: sessionNutritionTitleGet(id: index),
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
                tag: getSessionTagNames(id: tagIndex + 12 + index))),
        rating: SessionRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  final List<SessionModel> newSessions = List.generate(
    7,
    (index) => SessionModel(
        id: index,
        imagePath: sessionTrainingImageGet(id: 15 + index),
        videoUrl: sessionTrainingVideoGet(id: index),
        title: sessionTrainingTitleGet(id: 12 + index),
        desc: "",
        caloriesToBurn: "${150 + index}",
        duration: "${15 + index}",
        bre: "Bre",
        price: "${23 + index}",
        tags: List.generate(
            4,
            (tagIndex) => ProductTagModel(
                id: tagIndex, tag: getSessionTagNames(id: tagIndex + 12))),
        rating: SessionRatingModel(
            id: index, rating: "5.0", totalCount: "${8 + index}")),
  );
}

class ReflectionModel {
  final int id;
  final String data; 
  final DateTime dateTime;

  ReflectionModel(
      {required this.id, required this.data, required this.dateTime});
}
