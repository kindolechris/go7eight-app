import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/reusableComponents/app_image_rounded_container.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
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

  const HomeAppBar({super.key, this.showSearchButton, this.showCartButton});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(Get.width, 66),
      child: Container(
        margin: EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 120),
        child: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          elevation: 0.0,
          primary: true,
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            showCartButton == false ? Container() : _appBarActionCart(context),
            (showCartButton != false || showSearchButton != false)
                ? Container(
                    width: AppRatioSize.getRatioWidth() / 48,
                  )
                : Container(),
            showSearchButton == false
                ? Container()
                : _appBarActionSearch(context),
            (showCartButton != false || showSearchButton != false)
                ? Container(
                    width: AppRatioSize.getRatioWidth() / 24,
                  )
                : Container()
          ],
          title: _customappBarTitle(context),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(Get.width, 66);
  }

  Widget _customappBarTitle(BuildContext context) {
    return Row(
      children: [
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
        const SizedBox(
          width: 12,
        ),
        Expanded(child: _appBarProfileName(context))
      ],
    );
  }

  Widget _appBarProfileName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello ${controller.customer.value!.firstName}".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context).copyWith(
            color: AppColor.lightBlueGrey,
          ),
        ),
        Text("welcome_to_app".tr,
            textAlign: TextAlign.left, style: TextStyleX.header3(context)),
      ],
    );
  }

  Widget _appBarActionSearch(BuildContext context) {
    return Container(
      child: _appBarActionButton(context, iconData: Icons.search_rounded,
          action: () {
        Get.to(() => const FitnofySearchVew(),
            binding: SearchBinding(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.fadeIn);
      }, heroTag: "search_container"),
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
