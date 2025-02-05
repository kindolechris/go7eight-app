
import '../../../core/app_export.dart';
import '../../../models/profile_option_model.dart';
import '../../../modules/auth/bindings/auth_binding.dart';
import '../../../modules/auth/views/additional/change_password_view.dart';
import '../../../modules/panels/gym/notification/bindings/notification_binding.dart';
import '../../../modules/panels/gym/notification/views/notification_view.dart';
import '../../../modules/panels/student/cart/bindings/cart_binding.dart';
import '../../../modules/panels/student/cart/views/cart_view.dart';
import '../../../modules/panels/student/profile/views/edit_profile_view.dart';
import '../../../modules/panels/student/profile/views/following_view.dart';
import '../../../modules/panels/student/profile/views/my_favorite_view.dart';
import '../../../modules/panels/student/profile/views/my_order_view.dart';
import '../../../modules/panels/student/profile/views/my_schedule_view.dart';

List<ProfileOptionModel> getProfileOptionData() {
  final List<ProfileOptionModel> profileOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.profileEditIcon,
        name: "edit_profile_title",
      desc: "",
      action: (){
        //Get.to(()=>const EditProfileView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
      },
      iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.cartIcon,
        name: "cart_title",
        desc: "",
        action: (){
          // Get.to(() => const CartView(),
          //     binding: CartBinding(),
          //     duration: const Duration(milliseconds: 500),
          //     transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,),
      notificationCount: "16"
    ),
    ProfileOptionModel(
        id: 2,
        iconPath: AppIcon.scheduleIcon,
        name: "my_schedule_lbl",
        desc: "",
        action: (){
         // Get.to(()=>const MyScheduleView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 3,
        iconPath: AppIcon.myOrderIcon,
        name: "my_orders_lbl",
        desc: "",
        action: (){
          //Get.to(()=>const MyOrderView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 4,
        iconPath: AppIcon.savedIcon,
        name: "favorite_title",
        desc: "",
        action: (){
          //Get.to(()=>const MyFavoriteView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 5,
        iconPath: AppIcon.followingIcon,
        name: "lbl_following",
        desc: "",
        action: (){
          //Get.to(()=>const FollowingView(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),

  ];

  return profileOptionData;
}

List<ProfileOptionModel> getSettingOptionData() {
  final List<ProfileOptionModel> settingOptionData = [
    ProfileOptionModel(
        id: 0,
        iconPath: AppIcon.notificationProfileIcon,
        name: "lbl_notifications",
        desc: "",
        action: (){
          //Get.to(()=>const NotificationView(),binding:NotificationBinding(),duration: const Duration(milliseconds: 500),transition: Transition.fadeIn);
        },
        iconRight: const Icon(Icons.arrow_forward_ios_rounded,color: AppColor.lightBlueGrey,)
    ),
    ProfileOptionModel(
        id: 1,
        iconPath: AppIcon.passwordIcon,
        name: "password_text",
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