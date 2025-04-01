import 'package:flutter/services.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/reusableComponents/app_image_rounded_container.dart';
import 'package:go7eight/src/modules/panels/student/cart/bindings/cart_binding.dart';
import 'package:go7eight/src/modules/panels/student/cart/views/cart_view.dart';
import 'package:go7eight/src/modules/panels/student/profile/bindings/profile_binding.dart';
import 'package:go7eight/src/modules/panels/student/profile/views/profile_view.dart';

import '../../../search/binding/search_binding.dart';
import '../../../search/page/search_view.dart';
import '../../controllers/home_controller.dart';

class HomeAppBar extends GetView<HomeController> implements PreferredSizeWidget {
  final bool? showSearchButton;
  final bool? showCartButton;
  final bool? showNotificationButton;

  const HomeAppBar({
    super.key,
    this.showSearchButton,
    this.showCartButton,
    this.showNotificationButton = true
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: PreferredSize(
          preferredSize: Size(Get.width, 66),
          child: Container(
            color: AppColor.white,
            margin: EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 120),
            child: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              elevation: 0.0,
              primary: true,
              centerTitle: false,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: AppColor.white, // Match this with backgroundColor
                ),
              ),
              actions: [
                showCartButton == false ? Container() : _appBarActionCart(context),
                (showCartButton != false)
                    ? Container(
                  width: AppRatioSize.getRatioWidth() / 48,
                )
                    : Container(),
                showNotificationButton == false
                    ? Container()
                    : _appBarActionNotification(context),
                (showCartButton != false || showNotificationButton != false)
                    ? Container(
                  width: AppRatioSize.getRatioWidth() / 24,
                )
                    : Container()
              ],
              title: _buildTitleWithUserAndSearch(context),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize {
    return Size(Get.width, 66);
  }

  Widget _buildTitleWithUserAndSearch(BuildContext context) {
    return Row(
      children: [
        // User profile image
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            Get.to(() => const ProfileView(),
                binding: ProfileBinding(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 550));
          },
          child: Hero(
              tag: "profileImage_user",
              child: AppLocalImage(
                width: AppRatioSize.getRatioWidth() / 10,
                height: AppRatioSize.getRatioWidth() / 10,
                showBoarder: true,
                imagePath: AppIcon.userIcon,
              )
          ),
        ),
        const SizedBox(width: 12),

        // Search field
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(() => const FitnofySearchVew(),
                  binding: SearchBinding(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.fadeIn);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Search product, service, account",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _appBarActionCart(BuildContext context) {
    return _appBarActionButton(context, action: () {
      Get.to(() => const CartView(),
          binding: CartBinding(),
          duration: const Duration(milliseconds: 500),
          transition: Transition.fadeIn);
    }, iconData: Icons.shopping_cart_outlined, heroTag: "");
  }

  Widget _appBarActionNotification(BuildContext context) {
    return _appBarActionButton(context, action: () {
      // Add navigation to notification screen here
      // For example:
      // Get.to(() => const NotificationView(),
      //    binding: NotificationBinding(),
      //    duration: const Duration(milliseconds: 500),
      //    transition: Transition.fadeIn);
    }, iconData: Icons.notifications_none_outlined, heroTag: "notification_container");
  }

  _appBarActionButton(BuildContext context,
      {required IconData iconData,
        required Function() action,
        required String heroTag}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: action,
          child: Hero(
            tag: heroTag,
            child: Container(
                width: AppRatioSize.getRatioWidth() / 10,
                height: AppRatioSize.getRatioWidth() / 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary.withOpacity(0.1)
                      : AppColor.primary.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  iconData,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.blackShade
                      : AppColor.creamColor,
                )),
          ),
        ),
      ],
    );
  }
}