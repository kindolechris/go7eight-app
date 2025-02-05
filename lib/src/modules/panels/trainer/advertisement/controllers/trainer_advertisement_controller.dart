import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go7eight/src/core/utils/snackbar.dart';
import 'package:go7eight/src/data/dummy_dataset/ad_dummy_data.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_video_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/data/dummy_dataset/user_image_data.dart';
import 'package:go7eight/src/models/advertisement_model.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/image_size_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/user_model.dart';

import '../views/add_ad_view.dart';

class TrainerAdvertisementController extends GetxController {
  TextEditingController adBannerTitleController = TextEditingController();
  TextEditingController specifyAdController = TextEditingController();
  TextEditingController keyWordController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  RxString selectedAdImagePath = "".obs;
  List<AdvertisementModel> adImageList = getAdvertisementListData();
  RxBool isActive = false.obs;
  final List<String> typeOfAdvertisementList = [
    "ad_type_self",
    "ad_type_user",
    "ad_type_session",
    "ad_type_challenge"
  ];
  RxString selectedTypeOfAdvertisement = "ad_type_self".obs;
  final RxList<String> typeOfFilterSessionItem =
      ['lbl_exercises', 'lbl_nutrition'].obs;
  RxString selectedFilterSessionItem = 'lbl_exercises'.obs;
  RxString selectedSortValue = 'Date'.obs;
  RxList itemList = [].obs;
  Rx<SelectedItemModel> selectedAdItem = SelectedItemModel().obs;
  selectImage() async {
    selectedAdImagePath.value =
        await imagePickFromSource(ImageSize(maxWidth: 550, maxHeight: 550));
  }

  gotoAdAdvertisement() {
    Get.to(() => const TrainerAddAdvertisementView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  Future<String> imagePickFromSource(ImageSize imageSize) async {
    ImageSource imageSource = ImageSource.gallery;
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
      maxWidth: imageSize.maxWidth,
      maxHeight: imageSize.maxHeight,
      imageQuality: 100,
    );
    return pickedFile!.path;
  }

  bindSelectedItem(
      {required int index,
      required String name,
      required String subtext,
      required String imagePath}) {
    selectedAdItem.value = SelectedItemModel(
        id: index, price: subtext, name: name, iconPath: imagePath);
    Get.back();
    SnackBarX.showSuccess(
        title: "${selectedTypeOfAdvertisement.value.tr} ${"selection_lbl".tr}",
        message: "${selectedTypeOfAdvertisement.value.tr} ${"advertisement_snack_message".tr}");
  }

  adItemListGet(String itemType) {
    switch (itemType.tr) {
      case "Trainer":
        if (selectedFilterSessionItem.value == typeOfFilterSessionItem[0]) {
          itemList.value = trainerList;
        } else {
          itemList.value = nutritionistList;
        }
        return;
      case "User":
        itemList.value = userList;
        return;
      case "Session":
        if (selectedFilterSessionItem.value == typeOfFilterSessionItem[0]) {
          itemList.value = sessionList;
        } else {
          itemList.value = nutritionSessionsList;
        }
        return;
      case "Challenge":
        if (selectedFilterSessionItem.value == typeOfFilterSessionItem[0]) {
          itemList.value = trainingChallengeList;
        } else {
          itemList.value = nutritionChallengeList;
        }
        return;
      default:
        if (selectedFilterSessionItem.value == typeOfFilterSessionItem[0]) {
          itemList.value = sessionList;
        } else {
          itemList.value = nutritionSessionsList;
        }
        return;
    }
  }

  String getItemListName(int index) {
    if (selectedTypeOfAdvertisement.value == typeOfAdvertisementList[1]) {
      return userList[index].name!;
    } else {
      return itemList[index].title;
    }
  }

  String getItemListSecondaryText(int index) {
    if (selectedTypeOfAdvertisement.value == typeOfAdvertisementList[0]) {
      return itemList[index].type;
    } else if (selectedTypeOfAdvertisement.value == typeOfAdvertisementList[1]) {
      return ("Height: ${userList[index].height}, Weight:${userList[index].weight}");
    } else {
      return "\$${itemList[index].price}";
    }
  }

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

  final List<TrainerModel> trainerList = List.generate(
    10,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 1 + index),
        name: trainerNameGet(id: 10 + index),
        type: "Fitness Trainer",
        isFollowed: false),
  );
  final List<TrainerModel> nutritionistList = List.generate(
    12,
    (index) => TrainerModel(
        id: index,
        imagePath: trainerImageGet(id: 1 + index),
        name: "N. Abraham Cage",
        type: "Nutritionist",
        isFollowed: false),
  );
  final List<SessionModel> sessionList = List.generate(
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
  final List<SessionModel> nutritionSessionsList = List.generate(
    14,
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
                tag: getSessionTagNames(id: tagIndex + index + 5))),
        rating: SessionRatingModel(
            id: index, rating: "4.2", totalCount: "${200 + index}")),
  );
  final List<ChallengeModel> trainingChallengeList = List.generate(
    9,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeTrainingImageGet(id: index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 9 + index),
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
  final List<ChallengeModel> nutritionChallengeList = List.generate(
    11,
    (index) => ChallengeModel(
        id: index,
        imagePath: challengeNutritionImageGet(id: index),
        title: "30-Days Full Body Transformation${1 + index}",
        desc: "",
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 9 + index),
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
}

class SelectedItemModel {
  int? id;
  String? name;
  String? iconPath;
  String? price;

  SelectedItemModel({
    this.id,
    this.name,
    this.price,
    this.iconPath,
  });
}
