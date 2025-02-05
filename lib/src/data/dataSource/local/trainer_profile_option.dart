
import '../../../core/app_export.dart';
import '../../../core/enums/session_type_enum.dart';
import '../../../models/profile_option_model.dart';
import '../../../modules/auth/bindings/auth_binding.dart';
import '../../../modules/auth/views/additional/change_password_view.dart';
import '../../../modules/panels/trainer/advertisement/bindings/trainer_advertisement_binding.dart';
import '../../../modules/panels/trainer/advertisement/views/advertisement_view.dart';
import '../../../modules/panels/trainer/advertisement/views/trainer_ad_request_view.dart';
import '../../../modules/panels/trainer/notification/bindings/notification_binding.dart';
import '../../../modules/panels/trainer/notification/views/notification_view.dart';
import '../../../modules/panels/trainer/profile/bindings/trainer_profile_binding.dart';
import '../../../modules/panels/trainer/profile/views/about_platform_global.dart';
import '../../../modules/panels/trainer/profile/views/terms_n_condition_global.dart';
import '../../../modules/panels/trainer/profile/views/trainer_certificate_view.dart';
import '../../../modules/panels/trainer/profile/views/trainer_edit_profile_view.dart';
import '../../../modules/panels/trainer/profile/views/trainer_user_list_view.dart';
import '../../../modules/panels/trainer/profile/views/unpublished_by_gym_view.dart';
import '../../../modules/panels/trainer/transfer/bindings/trainer_transfer_bindings.dart';
import '../../../modules/panels/trainer/transfer/views/sale_history_view.dart';
import '../../../modules/panels/trainer/transfer/views/transaction_history_view.dart';

List<ProfileOptionModel> getTrainerAccountOptionData() {
  final List<ProfileOptionModel> profileOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.profileEditIcon,
        name: "edit_profile_title",
        desc: "",
        action: (){
          Get.to(()=>const TrainerEditProfileView(),binding:TrainerEditProfileBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.certificationIcon,
        name: "certifications_lbl",
        desc: "",
        action: (){
          Get.to(()=>const TrainerCertificateView(),binding:TrainerEditProfileBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
  ];

  return profileOptionData;
}
List<ProfileOptionModel> getTrainerAdministrationOptionData() {
  final List<ProfileOptionModel> profileOptionData = [
    ProfileOptionModel(
      id: 2,
      iconPath: AppIcon.advertisementsIcon,
      name: "my_advertisements_lbl",
      desc: "",
      action: (){
        Get.to(() => const TrainerAdvertisementView(),
            binding: TrainerAdvertisementBinding(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.fadeIn);
      },
      iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "3"
    ),
    ProfileOptionModel(
      id: 4,
      iconPath: AppIcon.adReqIcon,
      name: "advertisement_requests_lbl",
      desc: "",
      action: (){
        Get.to(() => const TrainerAdvertisementRequestView(),
            binding: TrainerAdvertisementBinding(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.fadeIn);
      },
      iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "5"
    ),
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.unpublishedListIcon,
        name: "unpublished_list_lbl",
        desc: "",
        action: (){
          Get.to(() => const TrainerUnpublishedListView(sessionType: SessionType.regular),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "4"
    ),
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.userListIcon,
        name: "user_list_lbl",
        desc: "",
        action: (){
          Get.to(() => const TrainerUserListView(),
              duration: const Duration(milliseconds: 500),
              transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
        notificationCount: "11"
    ),

  ];

  return profileOptionData;
}
List<ProfileOptionModel> getHistoryOptionData() {
  final List<ProfileOptionModel> historyOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.transactionHistoryIcon,
        name: "transaction_history_lbl",
        desc: "",
        action: (){
          Get.to(()=>const TrainerTransactionHistoryView(),binding:TrainerTransferBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.salesHistoryIcon,
        name: "sales_history_lbl",
        desc: "",
        action: (){
          Get.to(()=>const TrainerSaleHistoryView(),binding:TrainerTransferBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),

  ];

  return historyOptionData;
}
List<ProfileOptionModel> getTrainerSettingOptionData() {
  final List<ProfileOptionModel> settingOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.notificationProfileIcon,
        name: "lbl_notifications",
        desc: "",
        action: (){
          Get.to(()=>const TrainerNotificationView(),binding:TrainerNotificationBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.aboutIcon,
        name: "lbl_about",
        desc: "",
        action: (){
          Get.to(()=>const GlobalAboutPlatformView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 2,
        iconPath: AppIcon.termsConditionIcon,
        name: "terms_Conditions_lbl",
        desc: "",
        action: (){
          Get.to(()=>const GlobalTermsNConditionView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
      id: 1,
      iconPath: AppIcon.passwordIcon,
      name: "change_password",
      desc: "",
      action: (){
        Get.to(()=>const ChangePasswordView(),binding:AuthBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
      },
      iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
    ),
    ProfileOptionModel(
      id: 2,
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