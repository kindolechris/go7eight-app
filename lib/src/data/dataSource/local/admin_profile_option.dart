
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/app_export.dart';
import '../../../core/enums/session_type_enum.dart';
import '../../../models/profile_option_model.dart';
import '../../../modules/auth/bindings/auth_binding.dart';
import '../../../modules/auth/views/additional/change_password_view.dart';
import '../../../modules/panels/gym/advertisement/bindings/gym_advertisement_binding.dart';
import '../../../modules/panels/gym/advertisement/views/advertisement_view.dart';
import '../../../modules/panels/gym/advertisement/views/trainer_ad_request_view.dart';
import '../../../modules/panels/gym/employee/bindings/employee_binding.dart';
import '../../../modules/panels/gym/notification/bindings/notification_binding.dart';
import '../../../modules/panels/gym/notification/views/notification_view.dart';
import '../../../modules/panels/gym/profile/views/about_platform_view.dart';
import '../../../modules/panels/gym/profile/views/featured_trainer_list_view.dart';
import '../../../modules/panels/gym/profile/views/gym_edit_profile_view.dart';
import '../../../modules/panels/gym/profile/views/gym_newly_updated_view.dart';
import '../../../modules/panels/gym/profile/views/gym_republish_request_view.dart';
import '../../../modules/panels/gym/profile/views/gym_unpublished_list_view.dart';
import '../../../modules/panels/gym/profile/views/gym_verify_trainer_view.dart';
import '../../../modules/panels/gym/profile/views/terms_n_condition_view.dart';
import '../../../modules/panels/gym/transfer/bindings/gym_transfer_bindings.dart';
import '../../../modules/panels/gym/transfer/views/sale_history_view.dart';
import '../../../modules/panels/gym/transfer/views/transaction_history_view.dart';

List<ProfileOptionModel> getAdminAccountOptionData() {
  final List<ProfileOptionModel> profileOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.profileEditIcon,
        name: "edit_profile_title",
        desc: "",
        action: (){
          Get.to(()=>const GYMEditProfileView(),binding:GYMEmployeeBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
  ];

  return profileOptionData;
}
List<ProfileOptionModel> getAdminAdministrationOptionData() {
  final List<ProfileOptionModel> adminOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.unpublishedListIcon,
        name: "unpublished_list_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMUnpublishedListView(sessionType: SessionType.regular),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "8"
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.newlyUpdatedIcon,
        name: "newly_posted_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMNewlyUpdatedView(sessionType: SessionType.nutrition),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "16"
    ),
    ProfileOptionModel(
        id: 2,
        iconPath: AppIcon.advertisementsIcon,
        name: "advertisements_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMAdvertisementView(),
              binding: GYMAdvertisementBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
    ),
    ProfileOptionModel(
        id: 3,
        iconPath: AppIcon.adReqIcon,
        name: "trainer_ad_request_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMAdvertisementRequestView(),
              binding: GYMAdvertisementBinding(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "18"
    ),
    ProfileOptionModel(
        id: 4,
        iconPath: AppIcon.featuredTrainerIcon,
        name: "featured_trainer_list_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMFeaturedTrainerView(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
    ),
    ProfileOptionModel(
        id: 5,
        iconPath: AppIcon.verifyTrainerIcon,
        name: "verify_trainer_profile_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMVerifyTrainerView(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "5"
    ),
    ProfileOptionModel(
        id: 6,
        iconPath: AppIcon.republishReqIcon,
        name: "republishing_request_lbl",
        desc: "",
        action: (){
          Get.to(() => const GYMRepublishingRequestListView(sessionType: SessionType.regular),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "7"
    ),

  ];

  return adminOptionData;
}
List<ProfileOptionModel> getHistoryOptionData() {
  final List<ProfileOptionModel> historyOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.transactionHistoryIcon,
        name: "transaction_history_lbl",
        desc: "",
        action: (){
          Get.to(()=>const GYMTransactionHistoryView(),binding:GYMTransferBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.salesHistoryIcon,
        name: "sales_history_lbl",
        desc: "",
        action: (){
           Get.to(()=>const GYMSaleHistoryView(),binding:GYMTransferBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),

  ];

  return historyOptionData;
}
List<ProfileOptionModel> getSettingOptionData() {
  final List<ProfileOptionModel> settingOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.notificationProfileIcon,
        name: "lbl_notifications",
        desc: "",
        action: (){
          Get.to(()=>const NotificationView(),binding:NotificationBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.aboutIcon,
        name: "lbl_about",
        desc: "",
        action: (){
          Get.to(()=>const GYMAboutPlatformView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 2,
        iconPath: AppIcon.termsConditionIcon,
        name: "terms_Conditions_lbl",
        desc: "",
        action: (){
          Get.to(()=>const GYMTermsNConditionView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
      id: 3,
      iconPath: AppIcon.passwordIcon,
      name: "change_password",
      desc: "",
      action: (){
        Get.to(()=>const ChangePasswordView(),binding:AuthBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
      },
      iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
    ),
    ProfileOptionModel(
      id: 4,
      iconPath: AppIcon.darkModeIcon,
      name: "dark_mode_lbl",
      desc: "",
      action: (){

      },
      iconRight: Container(

      ),
    ),

  ];

  return settingOptionData;
}