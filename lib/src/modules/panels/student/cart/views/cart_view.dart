import 'package:go7eight/src/modules/panels/student/cart/views/widget/cart_item_list.dart';
import '../../../../../core/app_export.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/cart_controller.dart';
import 'widget/add_more_item_button.dart';
import 'widget/bottom_nav_bar_widget.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(context, showSaveIcon: false, title: "cart_title"),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceXS(),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //       horizontal: AppRatioSize.getRatioWidth() / 24),
              //   child: AppSectionTitle(
              //       title: "cart_challenge_title",
              //       showViewAll: true,
              //       secondaryOptionText: "clear_title",
              //       disableDefaultHPadding: true,
              //       onTapViewAll: () {
              //         controller.cartChanllenges.clear();
              //       }),
              // ),
              AppRatioSpaces.verticalSectionSpaceXXXS(),
              // CartItemList(
              //   cartList: controller.cartChanllenges,
              //   isChallenge: true,
              // ),
              AppRatioSpaces.verticalSectionSpaceXS(),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //       horizontal: AppRatioSize.getRatioWidth() / 24),
              //   child: AppSectionTitle(
              //       title: "cart_session_title",
              //       showViewAll: true,
              //       secondaryOptionText: "clear_title",
              //       disableDefaultHPadding: true,
              //       onTapViewAll: () {
              //         controller.cartSessions.clear();
              //       }),
              // ),
              AppRatioSpaces.verticalSectionSpaceXXXS(),
              // CartItemList(
              //   cartList: controller.cartSessions,
              //   isChallenge: false,
              // ),
              AppRatioSpaces.verticalSectionSpaceXS(),
              // AddMoreItemTextButton(
              //   action: controller.addMoreItemClick,
              // ),
              AppRatioSpaces.verticalSectionSpaceL(),
            ],
          )),
      // bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
