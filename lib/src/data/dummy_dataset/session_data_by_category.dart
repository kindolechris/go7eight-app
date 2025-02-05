import '../../models/session_model.dart';

List<SessionModel> getNutritionSessionListData() {
  final List<SessionModel> nutritionSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110664/nutrition_challange/Artboard_41_ambw0p.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106279/fitness_session_videos/_import_609ba877c1e3b4.38349497_j8gpgu.mp4",
      title: "Low Fat Breakfast Dishes",
      desc: "",
      duration: "45",
      price: "20",
      recipeCount: 4,
      caloriesToBurn: "300",
      bre: "Bre",
      rating: SessionRatingModel(id: 0, rating: "4.5", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Healthy food"),
        ProductTagModel(id: 0, tag: "Balanced diet"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110665/nutrition_challange/Artboard_42_wyvowt.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106282/fitness_session_videos/housewife-in-the-kitchen-showing-salad-1-2022-08-03-03-21-32-utc_ilqemk.mp4",
      title: "Quick Keto Meal Plan",
      desc: "",
      duration: "50",
      price: "40",
      recipeCount: 5,
      caloriesToBurn: "500",
      bre: "Din",
      rating: SessionRatingModel(id: 1, rating: "4.6", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High protein"),
        ProductTagModel(id: 0, tag: "Low carb"),
        ProductTagModel(id: 0, tag: "Low calorie"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110672/nutrition_challange/Artboard_49_ltjsis.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106309/fitness_session_videos/mixed-race-woman-sitting-on-floor-in-sportswear-an-2022-08-03-19-51-08-utc_osaowx.mp4",
      title: "Beans & Greens Meal Plan",
      desc: "",
      duration: "35",
      price: "45",
      recipeCount: 3,
      caloriesToBurn: "250",
      bre: "Lun",
      rating: SessionRatingModel(id: 2, rating: "4.5", totalCount: "350"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Green food"),
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "Well Explained"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110689/nutrition_challange/Artboard_59_eepi8q.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106302/fitness_session_videos/woman-is-resting-and-eating-a-healthy-food-after-a-2022-08-03-15-08-41-utc_rxtsfc.mp4",
      title: "Low Fat Diet Plan",
      desc: "",
      duration: "40",
      price: "35",
      recipeCount: 3,
      caloriesToBurn: "200",
      bre: "Din",
      rating: SessionRatingModel(id: 3, rating: "4.7", totalCount: "245"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Low fat"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110682/nutrition_challange/Artboard_55_kqcxk2.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106309/fitness_session_videos/mixed-race-woman-sitting-on-floor-in-sportswear-an-2022-08-03-19-51-08-utc_osaowx.mp4",
      title: "High Fiber Nutritious Dishes",
      desc: "",
      duration: "40",
      price: "75",
      recipeCount: 5,
      caloriesToBurn: "800",
      bre: "Lun",
      rating: SessionRatingModel(id: 4, rating: "4.8", totalCount: "308)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "Green food"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110709/nutrition_challange/Artboard_68_cquqgt.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106296/fitness_session_videos/_import_609ba718782226.63671986_yyummt.mp4",
      title: "Protein Rich Cooking",
      desc: "",
      duration: "50",
      price: "78",
      recipeCount: 6,
      caloriesToBurn: "1000",
      bre: "Lun",
      rating: SessionRatingModel(id: 5, rating: "4.6", totalCount: "380"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Protein rich"),
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110692/nutrition_challange/Artboard_61_punigt.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106282/fitness_session_videos/housewife-in-the-kitchen-showing-salad-1-2022-08-03-03-21-32-utc_ilqemk.mp4",
      title: "Low Fat Cooking Made Easy",
      desc: "",
      duration: "45",
      price: "70",
      recipeCount: 4,
      caloriesToBurn: "350",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.5", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low fat"),
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "Heart healthy"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110687/nutrition_challange/Artboard_58_rbiio7.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106297/fitness_session_videos/tuppers-of-chicken-and-rice-ready-to-eat-in-a-kitc-2023-04-05-14-34-17-utc_nktd5s.mp4",
      title: "Low Calorie High Taste Meal Planning",
      desc: "",
      duration: "40",
      price: "60",
      recipeCount: 4,
      caloriesToBurn: "400",
      bre: "Bre",
      rating: SessionRatingModel(id: 7, rating: "4.8", totalCount: "420"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Low fat"),
        ProductTagModel(id: 0, tag: "Heart healthy"),
      ],
    ),
  ];

  return nutritionSessionList;
}

List<SessionModel> getDietSessionListData() {
  final List<SessionModel> dietSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110695/nutrition_challange/Artboard_63_zvpzgi.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106309/fitness_session_videos/mixed-race-woman-sitting-on-floor-in-sportswear-an-2022-08-03-19-51-08-utc_osaowx.mp4",
      title: "A Quick Guide to Proper Dieting",
      desc: "",
      duration: "40",
      price: "30",
      recipeCount: 4,
      caloriesToBurn: "250",
      bre: "Bre",
      rating: SessionRatingModel(id: 0, rating: "4.5", totalCount: "420"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Healthy food"),
        ProductTagModel(id: 0, tag: "Balanced diet"),
        ProductTagModel(id: 0, tag: "Science based"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110704/nutrition_challange/Artboard_67_n2brcu.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106297/fitness_session_videos/tuppers-of-chicken-and-rice-ready-to-eat-in-a-kitc-2023-04-05-14-34-17-utc_nktd5s.mp4",
      title: "Dieting for Powerlifting Competitions",
      desc: "",
      duration: "60",
      price: "80",
      recipeCount: 5,
      caloriesToBurn: "600",
      bre: "Din",
      rating: SessionRatingModel(id: 1, rating: "4.7", totalCount: "350"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High protein"),
        ProductTagModel(id: 0, tag: "Low carb"),
        ProductTagModel(id: 0, tag: "Moderate fat"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110682/nutrition_challange/Artboard_55_kqcxk2.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106282/fitness_session_videos/housewife-in-the-kitchen-showing-salad-1-2022-08-03-03-21-32-utc_ilqemk.mp4",
      title: "Dieting 101 for Beginners",
      desc: "",
      duration: "50",
      price: "55",
      recipeCount: 3,
      caloriesToBurn: "350",
      bre: "Lun",
      rating: SessionRatingModel(id: 2, rating: "4.9", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Heart healthy"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low calorie"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110684/nutrition_challange/Artboard_56_kessdm.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106302/fitness_session_videos/woman-is-resting-and-eating-a-healthy-food-after-a-2022-08-03-15-08-41-utc_rxtsfc.mp4",
      title: "Key Components of a Successful Diet",
      desc: "",
      duration: "50",
      price: "45",
      recipeCount: 3,
      caloriesToBurn: "400",
      bre: "Din",
      rating: SessionRatingModel(id: 3, rating: "4.8", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Low fat"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110672/nutrition_challange/Artboard_49_ltjsis.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106275/fitness_session_videos/athletic-white-male-holding-a-bowl-of-fruits-in-hi-2022-08-19-00-01-24-utc_gih47c.mp4",
      title: "Introduction to High Fiber Dieting",
      desc: "",
      duration: "40",
      price: "75",
      recipeCount: 5,
      caloriesToBurn: "600",
      bre: "Lun",
      rating: SessionRatingModel(id: 4, rating: "4.8", totalCount: "328)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "Green food"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110670/nutrition_challange/Artboard_45_nv8l9k.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106296/fitness_session_videos/_import_609ba718782226.63671986_yyummt.mp4",
      title: "Dieting Pros & Cons",
      desc: "",
      duration: "30",
      price: "50",
      recipeCount: 6,
      caloriesToBurn: "200",
      bre: "Lun",
      rating: SessionRatingModel(id: 5, rating: "4.7", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110664/nutrition_challange/Artboard_41_ambw0p.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106290/fitness_session_videos/men-during-physiotherapy-session-in-clinic-2022-12-30-17-38-19-utc_tpaja7.mp4",
      title: "What Not to Do While Dieting",
      desc: "",
      duration: "50",
      price: "75",
      recipeCount: 4,
      caloriesToBurn: "350",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.6", totalCount: "260"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low fat"),
        ProductTagModel(id: 0, tag: "Low calorie"),
        ProductTagModel(id: 0, tag: "Heart healthy"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110665/nutrition_challange/Artboard_42_wyvowt.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106279/fitness_session_videos/_import_609ba877c1e3b4.38349497_j8gpgu.mp4",
      title: "Cooking Methods for Effective Dieting",
      desc: "",
      duration: "30",
      price: "50",
      recipeCount: 4,
      caloriesToBurn: "260",
      bre: "Bre",
      rating: SessionRatingModel(id: 7, rating: "4.9", totalCount: "320"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High fiber"),
        ProductTagModel(id: 0, tag: "Low fat"),
        ProductTagModel(id: 0, tag: "Heart healthy"),
      ],
    ),
  ];

  return dietSessionList;
}

List<SessionModel> getCardioSessionListData() {
  final List<SessionModel> cardioSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458563/finess_category/Cardio_challenge/Artboard_41_tc8o9u.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106284/fitness_session_videos/man-and-woman-individuals-uniting-for-joint-workou-2023-07-18-04-22-56-utc_v0o5vy.mp4",
      title: "How to Build Your Stamina",
      desc: "",
      duration: "50",
      price: "45",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 0, rating: "4.6", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stamina building"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458564/finess_category/Cardio_challenge/Artboard_49_jtownc.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106287/fitness_session_videos/gym-rope-challenge-muscular-man-s-fitness-session-2023-09-05-16-57-54-utc_o86csc.mp4",
      title: "A Guide to Running Longer",
      desc: "",
      duration: "40",
      price: "50",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 1, rating: "4.7", totalCount: "300"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Running"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458572/finess_category/Cardio_challenge/Artboard_60_jv5kdp.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106311/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_xnvclq.mp4",
      title: "Walking to Lose Weight",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "250",
      bre: "",
      rating: SessionRatingModel(id: 2, rating: "4.9", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Walking"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low intensity"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458571/finess_category/Cardio_challenge/Artboard_59_j8f58b.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106299/fitness_session_videos/man-and-woman-making-workout-session-outside-2022-08-04-22-06-27-utc_ys5c6i.mp4",
      title: "Best Ways to Do Cardio",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "200",
      bre: "",
      rating: SessionRatingModel(id: 3, rating: "4.8", totalCount: "230"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458564/finess_category/Cardio_challenge/Artboard_50_gf3yxe.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106286/fitness_session_videos/athletic-woman-exercising-at-gym-young-female-dur-2023-02-17-17-35-05-utc_jxxvfs.mp4",
      title: "Doing Cardio Smarter",
      desc: "",
      duration: "45",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "400",
      bre: "",
      rating: SessionRatingModel(id: 4, rating: "4.6", totalCount: "320)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458569/finess_category/Cardio_challenge/Artboard_58_j1hhaq.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106278/fitness_session_videos/caucasian-and-hispanic-fitness-enthusiasts-in-join-2023-09-05-16-57-49-utc_n6plkg.mp4",
      title: "What Makes a Good Cardio Session?",
      desc: "",
      duration: "30",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "600",
      bre: "",
      rating: SessionRatingModel(id: 5, rating: "4.8", totalCount: "280"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458571/finess_category/Cardio_challenge/Artboard_59_j8f58b.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106294/fitness_session_videos/young-man-workout-before-fitness-training-session-2022-09-07-18-00-46-utc_rhbeea.mp4",
      title: "Cardio for Total Beginners",
      desc: "",
      duration: "30",
      price: "55",
      recipeCount: 0,
      caloriesToBurn: "450",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.6", totalCount: "240"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Well explained"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low impact"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458572/finess_category/Cardio_challenge/Artboard_60_jv5kdp.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106311/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_xnvclq.mp4",
      title: "A Guide to Sprints",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 7, rating: "4.9", totalCount: "320"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
  ];

  return cardioSessionList;
}

List<SessionModel> getGymSessionListData() {
  final List<SessionModel> gymSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104820/fitness_training_session/Artboard_36_f0108a.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106311/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_xnvclq.mp4",
      title: "Bodybuilding Endurance Walkthrough",
      desc: "",
      duration: "50",
      price: "45",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 0, rating: "4.6", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stamina building"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104831/fitness_training_session/Artboard_7_lbdmv0.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106319/fitness_session_videos/athletic-young-woman-on-a-training-session-with-a-2022-01-29-05-26-10-utc_eu5rdo.mp4",
      title: "Lifting for Total Beginners",
      desc: "",
      duration: "40",
      price: "50",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 1, rating: "4.7", totalCount: "300"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Weights"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104824/fitness_training_session/Artboard_39_nr4g9e.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106306/fitness_session_videos/a-sportsman-warms-up-before-the-main-training-sess-2023-03-22-20-01-08-utc_ihk8kn.mp4",
      title: "Light Weight Lifting Tutorial",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "250",
      bre: "",
      rating: SessionRatingModel(id: 2, rating: "4.9", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Lightweight"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low intensity"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104818/fitness_training_session/Artboard_34_shuduh.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106288/fitness_session_videos/man-and-woman-during-physiotherapy-session-2022-12-30-17-38-07-utc_b6bseq.mp4",
      title: "Light Weight High Rep Training Guide",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "200",
      bre: "",
      rating: SessionRatingModel(id: 3, rating: "4.8", totalCount: "230"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104810/fitness_training_session/Artboard_29_yczepo.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106290/fitness_session_videos/men-during-physiotherapy-session-in-clinic-2022-12-30-17-38-19-utc_tpaja7.mp4",
      title: "Injury Rehabilitation in Gym",
      desc: "",
      duration: "45",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "400",
      bre: "",
      rating: SessionRatingModel(id: 4, rating: "4.6", totalCount: "320)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104780/fitness_training_session/Artboard_1_sdqxe2.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513648/fitness_session_videos/strong-active-athletic-trainer-using-upper-body-2022-11-17-04-56-51-utc_ogfrjz.mp4",
      title: "A Guide to Flexibility in Gym",
      desc: "",
      duration: "30",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "600",
      bre: "",
      rating: SessionRatingModel(id: 5, rating: "4.8", totalCount: "280"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104781/fitness_training_session/Artboard_10_enh91p.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106288/fitness_session_videos/man-and-woman-during-physiotherapy-session-2022-12-30-17-38-07-utc_b6bseq.mp4",
      title: "Dynamic Weight Lifting for Beginners",
      desc: "",
      duration: "30",
      price: "55",
      recipeCount: 0,
      caloriesToBurn: "450",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.6", totalCount: "240"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Well explained"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low impact"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104792/fitness_training_session/Artboard_16_ufzgn5.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106278/fitness_session_videos/caucasian-and-hispanic-fitness-enthusiasts-in-join-2023-09-05-16-57-49-utc_n6plkg.mp4",
      title: "Essential Steps of Advanced Bodybuilding",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 7, rating: "4.9", totalCount: "320"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
    SessionModel(
      id: 8,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104796/fitness_training_session/Artboard_19_ussnkc.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106291/fitness_session_videos/fitness-guidance-male-personal-trainer-assisting-w-2023-07-18-04-23-35-utc_jp634l.mp4",
      title: "Intermediate Push Exercises for Gym",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 8, rating: "4.8", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Medium impact"),
        ProductTagModel(id: 0, tag: "Medium intensity"),
        ProductTagModel(id: 0, tag: "Intermediate"),
      ],
    ),
    SessionModel(
      id: 9,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104789/fitness_training_session/Artboard_15_pphhe8.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106300/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_1_r3gxts.mp4",
      title: "Preparing an Advanced Push Pull Routine",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 9, rating: "4.9", totalCount: "350"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
  ];

  return gymSessionList;
}

List<SessionModel> getHIITSessionListData() {
  final List<SessionModel> hIITSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104829/fitness_training_session/Artboard_6_rr1jzo.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513639/fitness_session_videos/group-of-fit-people-exercising-and-jumping-on-wood-2022-11-17-04-57-09-utc_x5jz3i.mp4",
      title: "Basic HIIT Workouts for Beginners",
      desc: "",
      duration: "50",
      price: "45",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 0, rating: "4.6", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stamina building"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104822/fitness_training_session/Artboard_37_oqnz4g.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513634/fitness_session_videos/athlete-sporty-group-cardio-exercise-burning-calor-2023-04-04-23-57-40-utc_dkdrgy.mp4",
      title: "Yoga for Joint Health & Flexibility",
      desc: "",
      duration: "40",
      price: "50",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 1, rating: "4.7", totalCount: "300"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stretching"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104814/fitness_training_session/Artboard_31_rfehoe.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106294/fitness_session_videos/young-man-workout-before-fitness-training-session-2022-09-07-18-00-46-utc_rhbeea.mp4",
      title: "Beginner HIIT Tips to Remember",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "250",
      bre: "",
      rating: SessionRatingModel(id: 2, rating: "4.9", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low intensity"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104815/fitness_training_session/Artboard_32_nz67og.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106278/fitness_session_videos/caucasian-and-hispanic-fitness-enthusiasts-in-join-2023-09-05-16-57-49-utc_n6plkg.mp4",
      title: "HIIT 101 for Starters",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "200",
      bre: "",
      rating: SessionRatingModel(id: 3, rating: "4.8", totalCount: "230"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104812/fitness_training_session/Artboard_30_b9qb12.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106284/fitness_session_videos/man-and-woman-individuals-uniting-for-joint-workou-2023-07-18-04-22-56-utc_v0o5vy.mp4",
      title: "Starting HIIT as a Beginner",
      desc: "",
      duration: "45",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "400",
      bre: "",
      rating: SessionRatingModel(id: 4, rating: "4.6", totalCount: "320)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104809/fitness_training_session/Artboard_24_rbxhwa.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513653/fitness_session_videos/weight-training-muscle-building-lower-body-2023-04-22-04-49-32-utc_sc7frx.mp4",
      title: "What Makes HIIT Great for Newbies?",
      desc: "",
      duration: "30",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "600",
      bre: "",
      rating: SessionRatingModel(id: 5, rating: "4.8", totalCount: "280"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104805/fitness_training_session/Artboard_21_zpksih.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513644/fitness_session_videos/sporty-couple-cardio-exercise-burning-calorie-hiit-2023-04-04-23-58-24-utc_f61vsw.mp4",
      title: "A Guide to Simple HIIT Circuits",
      desc: "",
      duration: "30",
      price: "55",
      recipeCount: 0,
      caloriesToBurn: "450",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.6", totalCount: "240"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Well explained"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low impact"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104806/fitness_training_session/Artboard_23_kzk5kw.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513644/fitness_session_videos/athletic-woman-spinning-pedals-of-exercise-bike-en-2022-01-20-22-59-07-utc_crxuc8.mp4",
      title: "Creating a Basic Tabata Workout Routine",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 7, rating: "5.0", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 8,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104793/fitness_training_session/Artboard_17_wcmxvj.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513638/fitness_session_videos/athlete-sporty-group-cardio-exercise-burning-calor-2023-04-04-23-58-22-utc_tol9tk.mp4",
      title: "Advanced Athletic HIIT Training",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 8, rating: "4.9", totalCount: "320"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
    SessionModel(
      id: 9,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104802/fitness_training_session/Artboard_26_qunq0h.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513634/fitness_session_videos/athlete-sporty-group-cardio-exercise-burning-calor-2023-04-04-23-57-40-utc_dkdrgy.mp4",
      title: "HIIT Workout Dos and Don'ts",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 9, rating: "4.5", totalCount: "500"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "Medium intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 10,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104783/fitness_training_session/Artboard_11_atanjc.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106300/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_1_r3gxts.mp4",
      title: "HIIT Guide for Basketball Players",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 10, rating: "4.9", totalCount: "450"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
  ];

  return hIITSessionList;
}

List<SessionModel> getStrengthSessionListData() {
  final List<SessionModel> strengthSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104832/fitness_training_session/Artboard_8_lczvii.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106319/fitness_session_videos/athletic-young-woman-on-a-training-session-with-a-2022-01-29-05-26-10-utc_eu5rdo.mp4",
      title: "Basics of Strength Endurance",
      desc: "",
      duration: "50",
      price: "45",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 0, rating: "4.6", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stamina building"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104831/fitness_training_session/Artboard_7_lbdmv0.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106311/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_xnvclq.mp4",
      title: "Strength Training for Beginner Lifters",
      desc: "",
      duration: "40",
      price: "50",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 1, rating: "4.7", totalCount: "300"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Weights"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104827/fitness_training_session/Artboard_40_vejhrn.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106306/fitness_session_videos/a-sportsman-warms-up-before-the-main-training-sess-2023-03-22-20-01-08-utc_ihk8kn.mp4",
      title: "10 Steps to Your First Pushup",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "250",
      bre: "",
      rating: SessionRatingModel(id: 2, rating: "4.9", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Pushups"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low intensity"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104825/fitness_training_session/Artboard_4_e6py7v.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106303/fitness_session_videos/senior-man-trains-at-the-gym-2022-08-04-14-11-34-utc_nehedg.mp4",
      title: "Doing Your First Squat",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "200",
      bre: "",
      rating: SessionRatingModel(id: 3, rating: "4.8", totalCount: "230"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104824/fitness_training_session/Artboard_39_nr4g9e.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106300/fitness_session_videos/patient-doing-exercise-during-physiotherapy-sessio-2022-08-05-02-53-24-utc_1_r3gxts.mp4",
      title: "Stretching & Strength: A Quick Guide",
      desc: "",
      duration: "45",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "400",
      bre: "",
      rating: SessionRatingModel(id: 4, rating: "4.6", totalCount: "320)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104823/fitness_training_session/Artboard_38_kc5ntb.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106290/fitness_session_videos/men-during-physiotherapy-session-in-clinic-2022-12-30-17-38-19-utc_tpaja7.mp4",
      title: "Low Impact Strength Building",
      desc: "",
      duration: "30",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "600",
      bre: "",
      rating: SessionRatingModel(id: 5, rating: "4.8", totalCount: "280"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104818/fitness_training_session/Artboard_34_shuduh.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106288/fitness_session_videos/man-and-woman-during-physiotherapy-session-2022-12-30-17-38-07-utc_b6bseq.mp4",
      title: "Beginner’s Guide to Strength Workouts",
      desc: "",
      duration: "30",
      price: "55",
      recipeCount: 0,
      caloriesToBurn: "450",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.6", totalCount: "240"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Well explained"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low impact"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104810/fitness_training_session/Artboard_29_yczepo.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106286/fitness_session_videos/athletic-woman-exercising-at-gym-young-female-dur-2023-02-17-17-35-05-utc_jxxvfs.mp4",
      title: "An Overview of Powerlifting Strength Training",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 7, rating: "4.9", totalCount: "320"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
  ];

  return strengthSessionList;
}

List<SessionModel> getYogaSessionListData() {
  final List<SessionModel> yogaSessionList = [
    SessionModel(
      id: 0,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_78_gijf1e.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513645/fitness_session_videos/side-view-of-asian-woman-doing-yoga-exercise-yoga-2022-01-07-05-05-29-utc_qc91wo.mp4",
      title: "Yoga for Intermediate Practitioners",
      desc: "",
      duration: "50",
      price: "45",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 0, rating: "4.6", totalCount: "250"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stamina building"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 1,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_77_svbalu.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513645/fitness_session_videos/skills-red-haired-healthy-caucasian-woman-practici-2022-08-03-23-27-15-utc_k3bdco.mp4",
      title: "Yoga Basics for Beginners",
      desc: "",
      duration: "40",
      price: "50",
      recipeCount: 0,
      caloriesToBurn: "500",
      bre: "",
      rating: SessionRatingModel(id: 1, rating: "4.7", totalCount: "300"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Stretching"),
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 2,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_80_uv3hgc.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513641/fitness_session_videos/asian-active-sport-woman-learn-yoga-pilates-lesson-2022-08-11-22-06-16-utc_pfkuno.mp4",
      title: "A Guide to Basic Yoga Poses",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "250",
      bre: "",
      rating: SessionRatingModel(id: 2, rating: "4.9", totalCount: "220"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Yoga pose"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low intensity"),
      ],
    ),
    SessionModel(
      id: 3,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_76_po7cmx.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513641/fitness_session_videos/portrait-of-pretty-young-sportswoman-working-out-d-2022-01-19-00-17-17-utc_bvrtu6.mp4",
      title: "Simple Yoga Meditation Techniques",
      desc: "",
      duration: "30",
      price: "40",
      recipeCount: 0,
      caloriesToBurn: "200",
      bre: "",
      rating: SessionRatingModel(id: 3, rating: "4.8", totalCount: "230"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low intensity"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 4,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_79_gumldh.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697513636/fitness_session_videos/asian-woman-practice-yoga-downward-facing-dog-or-y-2022-01-07-05-05-49-utc_bqnuzk.mp4",
      title: "Useful Beginner Yoga Tips",
      desc: "",
      duration: "45",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "400",
      bre: "",
      rating: SessionRatingModel(id: 4, rating: "4.6", totalCount: "320)"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Moderate intensity"),
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
      ],
    ),
    SessionModel(
      id: 5,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460566/yoga_challenge/Artboard_75_mkzbrt.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106314/fitness_session_videos/yoga-session-with-a-group-of-young-women-in-a-stud-2023-07-18-14-57-09-utc_wii0dk.mp4",
      title: "How to Start Yoga Now",
      desc: "",
      duration: "30",
      price: "80",
      recipeCount: 0,
      caloriesToBurn: "600",
      bre: "",
      rating: SessionRatingModel(id: 5, rating: "4.8", totalCount: "280"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Low impact"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Well explained"),
      ],
    ),
    SessionModel(
      id: 6,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460566/yoga_challenge/Artboard_74_ma44lj.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106293/fitness_session_videos/group-fitness-and-stretching-session-with-a-coach-2022-06-03-00-48-44-utc_nciiba.mp4",
      title: "A Guide to Choosing a Yoga Style",
      desc: "",
      duration: "30",
      price: "55",
      recipeCount: 0,
      caloriesToBurn: "450",
      bre: "Bre",
      rating: SessionRatingModel(id: 6, rating: "4.6", totalCount: "240"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "Well explained"),
        ProductTagModel(id: 0, tag: "Beginner"),
        ProductTagModel(id: 0, tag: "Low impact"),
      ],
    ),
    SessionModel(
      id: 7,
      imagePath:
          "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_79_gumldh.jpg",
      videoUrl:
          "https://res.cloudinary.com/ds9ufzny1/video/upload/v1697106281/fitness_session_videos/active-women-run-in-place-at-fitness-training-sess-2023-05-30-05-19-42-utc_hvl7cl.mp4",
      title: "An Overview of Advanced Yoga Styles",
      desc: "",
      duration: "45",
      price: "65",
      recipeCount: 0,
      caloriesToBurn: "700",
      bre: "",
      rating: SessionRatingModel(id: 7, rating: "4.9", totalCount: "320"),
      isBookmarked: false,
      tags: [
        ProductTagModel(id: 0, tag: "High impact"),
        ProductTagModel(id: 0, tag: "High intensity"),
        ProductTagModel(id: 0, tag: "Advanced"),
      ],
    ),
  ];

  return yogaSessionList;
}
