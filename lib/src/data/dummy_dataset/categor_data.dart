
import 'package:go7eight/src/data/dummy_dataset/session_data_by_category.dart';

import '../../core/app_export.dart';
import '../../models/category_model.dart';
import 'challenge_data_by_category.dart';

List<CategoryModel> getCategoryData() {
  final List<CategoryModel> categories = [
    CategoryModel(
        id: 0,
        name: "nutrition_category_lbl",
        desc: "",
      iconPath: AppIcon.nutritionIcon,
      challengeList: getNutritionChallengeListData(),
      sessionList: getNutritionSessionListData()
    ),
    CategoryModel(
      id: 1,
      name: "cardio_category_lbl",
      desc: "",
      iconPath: AppIcon.cardioIcon,
        challengeList: getCardioChallengeListData(),
        sessionList: getCardioSessionListData()
    ),
    CategoryModel(
      id: 2,
      name: "gym_category_lbl",
      desc: "",
      iconPath: AppIcon.gymCategoryIcon,
        challengeList: getGymChallengeListData(),
        sessionList: getGymSessionListData()
    ),
    CategoryModel(
      id: 3,
      name: "strength_category_lbl",
      desc: "",
      iconPath: AppIcon.strengthIcon,
        challengeList: getStrengthChallengeListData(),
        sessionList: getStrengthSessionListData()
    ),
    CategoryModel(
      id: 4,
      name: "yoga_category_lbl",
      desc: "",
      iconPath: AppIcon.yogaCategoryIcon,
        challengeList: getYogaChallengeListData(),
        sessionList: getYogaSessionListData()
    ),
    CategoryModel(
      id: 5,
      name: "diet_category_lbl",
      desc: "",
      iconPath: AppIcon.dietIcon,
        challengeList: getDietChallengeListData(),
        sessionList: getDietSessionListData()
    ),
    CategoryModel(
      id: 6,
      name: "hit_category_lbl",
      desc: "",
      iconPath: AppIcon.hitIcon,
        challengeList: getHIITChallengeListData(),
        sessionList: getHIITSessionListData()
    ),

  ];

  return categories;
}