
import '../../models/challenge_model.dart';
import '../../models/session_model.dart';

List<ChallengeModel> getNutritionChallengeListData() {
  final List<ChallengeModel> nutritionChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110709/nutrition_challange/Artboard_68_cquqgt.jpg",
        title: "2-Week Nourishment Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110754/nutritionist_trainer_image/39_uuf87h.jpg",
            name: "Alex Taylor",
            type: "Nutritionist"
        ),
        duration: "14",
        timeRange: "18-20",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Fat reduction",
        workoutType: "Home",
        price: "80",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Healthy"
          ),
          ProductTagModel(
              id: 2,
              tag: "Vegan"
          ),
          ProductTagModel(
              id: 3,
              tag: "Gluten Free"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.5",totalCount: "230")
    ),
    



    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110705/nutrition_challange/Artboard_66_rqhpyc.jpg",
        title: "One-month Fat Burning Nutrition Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 1,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110752/nutritionist_trainer_image/38_vwwiuc.jpg",
            name: "Jordan Morgan",
            type: "Nutritionist"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Fat reduction",
        workoutType: "Home",
        price: "95",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Healthy"
          ),
          ProductTagModel(
              id: 2,
              tag: "Meat based"
          ),
          ProductTagModel(
              id: 3,
              tag: "Gluten Free"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "4.7",totalCount: "300")
    ),
    



    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110704/nutrition_challange/Artboard_67_n2brcu.jpg",
        title: "Fuel Your Muscles Nutrition Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 2,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110750/nutritionist_trainer_image/37_imugmb.jpg",
            name: "Casey Riley",
            type: "Nutritionist"
        ),
        duration: "40",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Muscle building",
        workoutType: "Home",
        price: "85",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Protein rich"
          ),
          ProductTagModel(
              id: 2,
              tag: "Vegan"
          ),
          ProductTagModel(
              id: 3,
              tag: "Lactose Free"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "4.5",totalCount: "350")
    ),
    



    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110700/nutrition_challange/Artboard_65_ca6gmr.jpg",
        title: "Good Gut in One Month Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 3,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110739/nutritionist_trainer_image/28_dbmzf2.jpg",
            name: "Avery Quinn",
            type: "Nutritionist"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Gut health",
        workoutType: "Home",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Healthy"
          ),
          ProductTagModel(
              id: 2,
              tag: "High fiber"
          ),
          ProductTagModel(
              id: 3,
              tag: "Protein rich"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "4.6",totalCount: "550")
    ),
    



    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110699/nutrition_challange/Artboard_64_opblho.jpg",
        title: "Heart Healthy Eating Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 4,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110737/nutritionist_trainer_image/27_o91mt2.jpg",
            name: "Emory Dakota",
            type: "Nutritionist"
        ),
        duration: "25",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Heart health",
        workoutType: "Home",
        price: "80",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Healthy"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low fat"
          ),
          ProductTagModel(
              id: 3,
              tag: "High fiber"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "4.8",totalCount: "500")
    ),
    



    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110695/nutrition_challange/Artboard_63_zvpzgi.jpg",
        title: "Fish & Vegetables Nutrition Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 5,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110737/nutritionist_trainer_image/27_o91mt2.jpg",
            name: "Charlie Finley",
            type: "Nutritionist"
        ),
        duration: "20",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Fat reduction",
        workoutType: "Home",
        price: "75",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Pescatarian"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low fat"
          ),
          ProductTagModel(
              id: 3,
              tag: "High fiber"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "5.0",totalCount: "600")
    ),
    



    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110694/nutrition_challange/Artboard_62_pm6vgn.jpg",
        title: "Lose Weight With Flavors Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 6,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110735/nutritionist_trainer_image/26_jopgf8.jpg",
            name: "Rowan Peyton",
            type: "Nutritionist"
        ),
        duration: "30",
        timeRange: "30-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Fat reduction",
        workoutType: "Home",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Low calorie"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low fat"
          ),
          ProductTagModel(
              id: 3,
              tag: "Flavorful"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "4.8",totalCount: "370")
    ),
    
  ];

  return nutritionChallengeList;
}


List<ChallengeModel> getDietChallengeListData() {
  final List<ChallengeModel> dietChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697456965/fitness_food_thumbnail/pexels-oben-kural-18490285_bzwhax.jpg",
        title: "30 Day Juice Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110742/nutritionist_trainer_image/31_mzrrhl.jpg",
            name: "Kendall Reese",
            type: "Nutritionist"
        ),
        duration: "30",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "70",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Low carb"
          ),
          ProductTagModel(
              id: 2,
              tag: "High fiber"
          ),
          ProductTagModel(
              id: 3,
              tag: "Low calorie"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.5",totalCount: "400")
    ),
    


    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110623/fitness_food_thumbnail/Artboard_88_edu8cb.jpg",
        title: "Skip the Sugar Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110747/nutritionist_trainer_image/35_nizrw8.jpg",
            name: "Drew Dakota",
            type: "Nutritionist"
        ),
        duration: "15",
        timeRange: "10-15",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "60",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low calorie"
          ),
          ProductTagModel(
              id: 3,
              tag: "Low glucose"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "4.9",totalCount: "450")
    ),
    


    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110627/fitness_food_thumbnail/Artboard_90_ajxxz1.jpg",
        title: "Eat Better 20-Day Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110739/nutritionist_trainer_image/28_dbmzf2.jpg",
            name: "Skyler Tatum",
            type: "Nutritionist"
        ),
        duration: "20",
        timeRange: "10-15",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Wellness",
        workoutType: "Home",
        price: "100",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low calorie"
          ),
          ProductTagModel(
              id: 3,
              tag: "Low fat"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "4.6",totalCount: "550")
    ),
    



    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110612/fitness_food_thumbnail/Artboard_81_f72jcg.jpg",
        title: "40 Days to Less Fat Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110717/nutritionist_trainer_image/08_xcgtiv.jpg",
            name: "Rory Sage",
            type: "Nutritionist"
        ),
        duration: "40",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "85",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low fat"
          ),
          ProductTagModel(
              id: 3,
              tag: "Low calorie"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "4.8",totalCount: "350")
    ),
    


    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110600/fitness_food_thumbnail/Artboard_73_poazob.jpg",
        title: "30 Day Carnivore Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110718/nutritionist_trainer_image/11_zvlj4k.jpg",
            name: "Frankie Taylor",
            type: "Nutritionist"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "80",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Carnivore"
          ),
          ProductTagModel(
              id: 3,
              tag: "Medium calorie"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "4.7",totalCount: "450")
    ),
    



    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110615/fitness_food_thumbnail/Artboard_83_oscmtq.jpg",
        title: "Green Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110730/nutritionist_trainer_image/21_oplnke.jpg",
            name: "Alex Jordan",
            type: "Nutritionist"
        ),
        duration: "20",
        timeRange: "10-15",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "70",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "High fiber"
          ),
          ProductTagModel(
              id: 3,
              tag: "Low calorie"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "4.8",totalCount: "380")
    ),
    


    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110607/fitness_food_thumbnail/Artboard_78_xsg0ql.jpg",
        title: "Vitamin & Mineral Intake Diet Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110729/nutritionist_trainer_image/20_m0chz7.jpg",
            name: "Morgan Emerson",
            type: "Nutritionist"
        ),
        duration: "25",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Wellness",
        workoutType: "Home",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Supplementation"
          ),
          ProductTagModel(
              id: 3,
              tag: "Gut health"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "4.6",totalCount: "250")
    ),
    
  ];

  return dietChallengeList;
}

List<ChallengeModel> getGymChallengeListData() {
  final List<ChallengeModel> gymChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104792/fitness_training_session/Artboard_16_ufzgn5.jpg",
        title: "Muscle Mania Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/w65ntvimkpet2fqpvbtr.jpg",
            name: "Hayden Parker",
            type: "Fitness trainer"
        ),
        duration: "45",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "100",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Hypertrophy"
          ),
          ProductTagModel(
              id: 2,
              tag: "Moderate intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.6",totalCount: "430")
    ),
    



    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104814/fitness_training_session/Artboard_31_rfehoe.jpg",
        title: "Mass Monster Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 1,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/llbcs3z8vwokbkqddcjw.jpg",
            name: "Avery Mackenzie",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "95",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Low reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "5.0",totalCount: "470")
    ),
    


    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104820/fitness_training_session/Artboard_36_f0108a.jpg",
        title: "Lower Body Hypertrophy Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 2,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/jtl4pgpg8ul97z8dizkz.jpg",
            name: "Kennedy Emery",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Lower body",
        workoutType: "Gym",
        price: "100",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Joint friendly"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "4.9",totalCount: "650")
    ),
    


    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104807/fitness_training_session/Artboard_28_jlcron.jpg",
        title: "Bulletproof Body Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 3,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/uhi9znmb1ekfldh82osd.jpg",
            name: "Taylor Emerson",
            type: "Fitness trainer"
        ),
        duration: "40",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Athletic"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "4.9",totalCount: "225")
    ),
    



    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104805/fitness_training_session/Artboard_21_zpksih.jpg",
        title: "Core Strength Gym Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 4,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/e8uarprt3j8sxxbtzni9.jpg",
            name: "Jordan Skylar",
            type: "Fitness Trainer"
        ),
        duration: "25",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Abs",
        workoutType: "Gym",
        price: "120",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "Medium intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Hypertrophy"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "5.0",totalCount: "320")
    ),
    



    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104798/fitness_training_session/Artboard_22_s4tdlc.jpg",
        title: "Spartan Warrior Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 5,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102626/Trainer/d1pmystvig9rworaqrlk.jpg",
            name: "Morgan Sydney",
            type: "Fitness trainer"
        ),
        duration: "25",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "95",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "Athletic"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "4.3",totalCount: "250")
    ),
    


    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104796/fitness_training_session/Artboard_19_ussnkc.jpg",
        title: "Killer Full Body Gym Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 6,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102626/Trainer/lltuy0advn63ouctic7g.jpg",
            name: "Rowan Sawyer",
            type: "Fitness trainer"
        ),
        duration: "35",
        timeRange: "40-45",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "105",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Shredding"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "4.8",totalCount: "530")
    ),
    
  ];

  return gymChallengeList;
}

List<ChallengeModel> getStrengthChallengeListData() {
  final List<ChallengeModel> strengthChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104786/fitness_training_session/Artboard_12_oatjkf.jpg",
        title: "30-Day Pull Up Mastery Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102626/Trainer/vbm56cfuq32rmlt5ayr8.jpg",
            name: "Carson Payton",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Upper body",
        workoutType: "Outdoor",
        price: "120",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Hypertrophy"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.7",totalCount: "530")
    ),
    



    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104783/fitness_training_session/Artboard_11_atanjc.jpg",
        title: "The Ultimate Push Up Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102625/Trainer/pbalg9ojnx6vlwov5tbz.jpg",
            name: "Jaden Leslie",
            type: "Fitness trainer"
        ),
        duration: "25",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Upper body",
        workoutType: "Outdoor",
        price: "85",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "4.8",totalCount: "270")
    ),
    



    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104781/fitness_training_session/Artboard_10_enh91p.jpg",
        title: "Squat Strength Builder Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102625/Trainer/vsw1oaqiu9x23flkrhtq.jpg",
            name: "Reagan Casey",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "4K+",
        workoutFocus: "Lower body",
        workoutType: "Gym",
        price: "110",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Joint friendly"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "5.0",totalCount: "350")
    ),
    



    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104789/fitness_training_session/Artboard_15_pphhe8.jpg",
        title: "Strong Forearms Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102626/Trainer/opz2rnqowgf7yu9vydfh.jpg",
            name: "Rory Avery",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Arms",
        workoutType: "Gym",
        price: "70",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Hypertrophy"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "5.0",totalCount: "425")
    ),
    



    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104780/fitness_training_session/Artboard_1_sdqxe2.jpg",
        title: "Muscle Up Pro Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102626/Trainer/xk8tqgo4gdxjzcznl0yn.jpg",
            name: "Dallas Taylor",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Upper body",
        workoutType: "Outdoor",
        price: "105",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Hypertrophy"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "4.5",totalCount: "240")
    ),
    



    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104781/fitness_training_session/Artboard_10_enh91p.jpg",
        title: "Crazy Strength Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102626/Trainer/d1pmystvig9rworaqrlk.jpg",
            name: "Finley Morgan",
            type: "Fitness trainer"
        ),
        duration: "45",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "100",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Athletic"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "4.5",totalCount: "200")
    ),
    



    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104798/fitness_training_session/Artboard_22_s4tdlc.jpg",
        title: "Powerlifting Master Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/llbcs3z8vwokbkqddcjw.jpg",
            name: "Reese Emerson",
            type: "Fitness trainer"
        ),
        duration: "60",
        timeRange: "45-50",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "120",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Hypertrophy"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "4.9",totalCount: "350")
    ),
    
  ];

  return strengthChallengeList;
}




List<ChallengeModel> getHIITChallengeListData() {
  final List<ChallengeModel> hIITChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104816/fitness_training_session/Artboard_33_fiiqkx.jpg",
        title: "30 Day Tabata Burner Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110733/nutritionist_trainer_image/23_byouxm.jpg",
            name: "Quinn Reese",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "4K+",
        workoutFocus: "Fat reduction",
        workoutType: "Home",
        price: "95",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Moderate reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.7",totalCount: "200")
    ),
    


    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104815/fitness_training_session/Artboard_32_nz67og.jpg",
        title: "Extreme Interval Training Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110732/nutritionist_trainer_image/22_ygnow4.jpg",
            name: "Morgan Cameron",
            type: "Fitness trainer"
        ),
        duration: "40",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Fat reduction",
        workoutType: "Outdoor",
        price: "100",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "Athletic"
          ),
          ProductTagModel(
              id: 3,
              tag: "High intensity"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "4.6",totalCount: "500")
    ),
    


    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104814/fitness_training_session/Artboard_31_rfehoe.jpg",
        title: "Warrior HIIT Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110737/nutritionist_trainer_image/27_o91mt2.jpg",
            name: "Blair Jaden",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Gym",
        price: "110",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "4.8",totalCount: "250")
    ),
    


    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104809/fitness_training_session/Artboard_24_rbxhwa.jpg",
        title: "HIIT Makeover Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110752/nutritionist_trainer_image/38_vwwiuc.jpg",
            name: "Scout Harley",
            type: "Fitness trainer"
        ),
        duration: "60",
        timeRange: "35-40",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "95",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "4.6",totalCount: "230")
    ),
    



    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104829/fitness_training_session/Artboard_6_rr1jzo.jpg",
        title: "HIIT Master Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110749/nutritionist_trainer_image/36_dopohs.jpg",
            name: "Charlie Smith",
            type: "Fitness trainer"
        ),
        duration: "20",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Weight loss",
        workoutType: "Home",
        price: "85",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "4.8",totalCount: "460")
    ),
    



    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104806/fitness_training_session/Artboard_23_kzk5kw.jpg",
        title: "Military HIIT Fitness Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110735/nutritionist_trainer_image/26_jopgf8.jpg",
            name: "Edward Jordan",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Weight loss",
        workoutType: "Outdoor",
        price: "80",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Moderate duration"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "4.9",totalCount: "480")
    ),
    



    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697104822/fitness_training_session/Artboard_37_oqnz4g.jpg",
        title: "Intermediate HIIT Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110754/nutritionist_trainer_image/39_uuf87h.jpg",
            name: "Thunder Emerson",
            type: "Fitness trainer"
        ),
        duration: "45",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Fat loss",
        workoutType: "Home",
        price: "100",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "Medium intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "High reps"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "5.0",totalCount: "550")
    ),
    
  ];

  return hIITChallengeList;
}

List<ChallengeModel> getCardioChallengeListData() {
  final List<ChallengeModel> cardioChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458566/finess_category/Cardio_challenge/Artboard_51_jp4wzb.jpg",
        title: "Half Month Cardio Burn Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102629/Trainer/wdrwcbozunhrzcaruafv.jpg",
            name: "Justice River",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Full body",
        workoutType: "Outdoor",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Medium intensity"
          ),
          ProductTagModel(
              id: 2,
              tag: "Moderate duration"
          ),
          ProductTagModel(
              id: 3,
              tag: "Beginner"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.5",totalCount: "330")
    ),
    



    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458568/finess_category/Cardio_challenge/Artboard_52_l24fwi.jpg",
        title: "32-Day Couch to Cardio Master Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102629/Trainer/exddviy9nukcfqvs52jk.jpg",
            name: "Skyler Sage",
            type: "Fitness trainer"
        ),
        duration: "20",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "85",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Joint friendly"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "4.9",totalCount: "500")
    ),
    



    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458569/finess_category/Cardio_challenge/Artboard_58_j1hhaq.jpg",
        title: "Lower Body Cardio Focus Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102629/Trainer/wdrwcbozunhrzcaruafv.jpg",
            name: "Casey Riley",
            type: "Fitness trainer"
        ),
        duration: "20",
        timeRange: "25-30",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Lower body",
        workoutType: "Gym",
        price: "95",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Joint friendly"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "4.8",totalCount: "450")
    ),
    



    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458568/finess_category/Cardio_challenge/Artboard_52_l24fwi.jpg",
        title: "Swift Runner Cardio Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102629/Trainer/h1c3yqtujz9age4qyx1v.jpg",
            name: "Harper James",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Outdoor",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Athletic"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "4.8",totalCount: "250")
    ),
    



    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458566/finess_category/Cardio_challenge/Artboard_51_jp4wzb.jpg",
        title: "Six Pack Abs Cardio Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102629/Trainer/vdkpgenalw2kjcbkganx.jpg",
            name: "Cameron Reese",
            type: "Fitness Trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Abs",
        workoutType: "Home",
        price: "80",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "Medium intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Joint friendly"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "5.0",totalCount: "420")
    ),
    


    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458564/finess_category/Cardio_challenge/Artboard_50_gf3yxe.jpg",
        title: "Athletic Performance Cardio Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102628/Trainer/wixza26crymtbanho0qy.jpg",
            name: "Hunter Phoenix",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Outdoor",
        price: "75",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "Athletic"
          ),
          ProductTagModel(
              id: 3,
              tag: "High intensity"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "4.8",totalCount: "450")
    ),
    



    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697458564/finess_category/Cardio_challenge/Artboard_49_jtownc.jpg",
        title: "Vertical Jump Cardio Training",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697102627/Trainer/lrn39a6pmxkjcmyjosox.jpg",
            name: "August Spencer",
            type: "Fitness trainer"
        ),
        duration: "20",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Lower body",
        workoutType: "Gym",
        price: "75",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Athletic"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "4.9",totalCount: "430")
    ),
    
  ];

  return cardioChallengeList;
}




List<ChallengeModel> getYogaChallengeListData() {
  final List<ChallengeModel> yogaChallengeList = [

    ChallengeModel(
        id: 0,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_79_gumldh.jpg",
        title: "Vinyasa Yoga Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110702/nutritionist_trainer_image/04_c7sewx.jpg",
            name: "Cameron Taylor",
            type: "Fitness trainer"
        ),
        duration: "25",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "110",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Breathing"
          ),
          ProductTagModel(
              id: 2,
              tag: "Stretching"
          ),
          ProductTagModel(
              id: 3,
              tag: "Mobility"
          ),
        ],
        rating: ChallengeRatingModel(id: 0,rating: "4.8",totalCount: "230")
    ),
    


    ChallengeModel(
        id: 1,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_77_svbalu.jpg",
        title: "Kundalini Yoga Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110707/nutritionist_trainer_image/02_f5reos.jpg",
            name: "Parker Quinn",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "25-30",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Flexibility"
          ),
        ],
        rating: ChallengeRatingModel(id: 1,rating: "4.5",totalCount: "220")
    ),
    


    ChallengeModel(
        id: 2,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460566/yoga_challenge/Artboard_75_mkzbrt.jpg",
        title: "20-Day Breathing Improvement Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110717/nutritionist_trainer_image/08_xcgtiv.jpg",
            name: "Hayden Rowan",
            type: "Fitness trainer"
        ),
        duration: "20",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Lungs",
        workoutType: "Home",
        price: "120",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Stretching"
          ),
        ],
        rating: ChallengeRatingModel(id: 2,rating: "4.8",totalCount: "250")
    ),
    



    ChallengeModel(
        id: 3,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_76_po7cmx.jpg",
        title: "Ashtanga Yoga Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110750/nutritionist_trainer_image/37_imugmb.jpg",
            name: "Charlie Sage",
            type: "Fitness trainer"
        ),
        duration: "28",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "3K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "85",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Advanced"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Mobility"
          ),
        ],
        rating: ChallengeRatingModel(id: 3,rating: "5.0",totalCount: "440")
    ),
    



    ChallengeModel(
        id: 4,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_78_gijf1e.jpg",
        title: "Clear Mind Yoga Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110749/nutritionist_trainer_image/36_dopohs.jpg",
            name: "Justice Kennedy",
            type: "Fitness trainer"
        ),
        duration: "20",
        timeRange: "15-20",
        isBookMarked: false,
        totalMembers: "4K+",
        workoutFocus: "Lungs",
        workoutType: "Home",
        price: "90",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "Low intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Breathing focused"
          ),
        ],
        rating: ChallengeRatingModel(id: 4,rating: "4.8",totalCount: "550")
    ),
    



    ChallengeModel(
        id: 5,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460566/yoga_challenge/Artboard_74_ma44lj.jpg",
        title: "Yin Yoga Supreme Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110744/nutritionist_trainer_image/32_jehflj.jpg",
            name: "Harley Bailey",
            type: "Fitness trainer"
        ),
        duration: "30",
        timeRange: "20-25",
        isBookMarked: false,
        totalMembers: "1K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "120",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Intermediate"
          ),
          ProductTagModel(
              id: 2,
              tag: "Mobility"
          ),
          ProductTagModel(
              id: 3,
              tag: "High intensity"
          ),
        ],
        rating: ChallengeRatingModel(id: 5,rating: "4.6",totalCount: "300")
    ),
    


    ChallengeModel(
        id: 6,
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697460567/yoga_challenge/Artboard_80_uv3hgc.jpg",
        title: "Master Yoga in 60 Days Challenge",
        desc: "",
        trainer: TrainerModel(
            id: 0,
            imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697110732/nutritionist_trainer_image/22_ygnow4.jpg",
            name: "Scout Jules",
            type: "Fitness trainer"
        ),
        duration: "60",
        timeRange: "30-35",
        isBookMarked: false,
        totalMembers: "2K+",
        workoutFocus: "Full body",
        workoutType: "Home",
        price: "115",
        tags: [
          ProductTagModel(
              id: 1,
              tag: "Beginner"
          ),
          ProductTagModel(
              id: 2,
              tag: "High intensity"
          ),
          ProductTagModel(
              id: 3,
              tag: "Mobility"
          ),
        ],
        rating: ChallengeRatingModel(id: 6,rating: "5.0",totalCount: "550")
    ),
    
  ];

  return yogaChallengeList;
}








































