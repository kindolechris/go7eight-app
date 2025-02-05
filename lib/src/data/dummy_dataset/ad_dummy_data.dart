

import 'package:get/get.dart';
import 'package:go7eight/src/data/dummy_dataset/session_data_by_category.dart';

import '../../core/enums/session_type_enum.dart';
import '../../models/advertisement_model.dart';
import '../../modules/panels/student/challenge/bindings/challenge_binding.dart';
import '../../modules/panels/student/challenge/views/challenge_details_view.dart';
import '../../modules/panels/student/session/bindings/session_binding.dart';
import '../../modules/panels/student/session/views/session_details_view.dart';
import 'challenge_data_by_category.dart';

List<String> adImageGet(){
  return [
   "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697116833/gym/ad_banner_gwnbw3.png",
   "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697116809/gym/banner4_sxfjln.jpg",
   "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697116806/gym/banner1_dnvyq4.jpg",
   "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697116804/gym/banner3_b0ibjg.jpg",
  "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697116797/gym/banner5_gtnjin.jpg",
   "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697116795/gym/banner6_x6tx2f.jpg",
  ];
}

List<AdvertisementModel> getAdvertisementListData() {
  final List<AdvertisementModel> meals = [
    AdvertisementModel(
        id: 0,
        title: "-",
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1698060292/gym/banner_first_m4clc6.gif",
        gotoScreen: (){
          final session = getHIITSessionListData()[3];
          Get.to(()=>SessionDetailsView(
              mySession: false,
              session: session,
              sessionType: SessionType.regular),
              binding: SessionBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        }
    ),
    AdvertisementModel(
        id: 1,
        title: "-",
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1698059975/gym/banner_4_zbwpsn.gif",
        gotoScreen: (){
          final session = getGymSessionListData()[0];
          Get.to(()=>SessionDetailsView(
              mySession: false,
              session: session,
              sessionType: SessionType.regular),
              binding: SessionBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        }
    ),
    AdvertisementModel(
        id: 2,
        title: "-",
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1698059975/gym/banner_1_vpdsoi.gif",
        gotoScreen: (){
          final session = getYogaSessionListData()[3];
          Get.to(()=>SessionDetailsView(
              mySession: false,
              session: session,
              sessionType: SessionType.regular),
              binding: SessionBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        }
    ),
    AdvertisementModel(
        id: 3,
        title: "-",
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1698059975/gym/banner_3_qtlfoi.gif",
        gotoScreen: (){
          final session = getStrengthSessionListData()[0];
          Get.to(()=>SessionDetailsView(
              mySession: false,
              session: session,
              sessionType: SessionType.regular),
              binding: SessionBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        }
    ),
    AdvertisementModel(
        id: 4,
        title: "-",
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697973259/gym/banner_5_zfd6cq.gif",
        gotoScreen: (){
          final challenge = getStrengthChallengeListData()[3];
          Get.to(() => ChallengeDetailsView(
            title: "Challenge",
            challenge: challenge,
            myChallenge: false,
            sessionType: SessionType.regular,
          ),
              binding: ChallengeBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        }
    ),
    AdvertisementModel(
        id: 5,
        title: "-",
        imagePath: "https://res.cloudinary.com/ds9ufzny1/image/upload/v1698059975/gym/banner_2_skr6xo.gif",
        gotoScreen: (){
          final session = getGymSessionListData()[5];
          Get.to(()=>SessionDetailsView(
              mySession: false,
              session: session,
              sessionType: SessionType.regular),
              binding: SessionBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        }
    ),
  ];

  return meals;
}