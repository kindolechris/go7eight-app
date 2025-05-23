import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

import '../../config/app_font.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../helpers/theme_switch.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: AppSize.appSize0,
        title: Text(
          'My Profile',
          style: TextStyle(
              color: themedColor(Get.context!, (c) => c.secondaryColor),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.appSize16),
          child: Column(
            children: [
              const SizedBox(height: AppSize.appSize20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: AppSize.appSize50,
                    backgroundImage: AssetImage('assets/images/profile1.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color:
                          themedColor(Get.context!, (c) => c.backgroundColor),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt,
                        color:
                            themedColor(Get.context!, (c) => c.secondaryColor),
                        size: AppSize.appSize20),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.appSize12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.sellerVerification);
                },
                child: Text(
                  'Upgrade to Seller',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFont.appFontBold,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: AppSize.appSize30),

              // Account Section in Card
              _buildSectionCard(
                title: 'Account',
                children: [
                  _buildProfileItem('Active Orders', 16, Icons.receipt_long,
                      route: AppRoutes.activeOrders),
                  _buildProfileItem('My Cart', 9, Icons.shopping_cart,
                      route: AppRoutes.myCart),
                  _buildProfileItem('My Wishlist', 83, Icons.favorite_border,
                      route: AppRoutes.myWishlist),
                  _buildProfileItem('Deliveries', 9, Icons.local_shipping,
                      route: AppRoutes.deliveries),
                  _buildProfileItem('Transaction History', null, Icons.history,
                      route: AppRoutes.purchaseHistory),
                  _buildProfileItem('Community 116', null, Icons.people),
                  _buildProfileItem('Following 4,234', null, Icons.person),
                  _buildProfileItem(
                      'Gift card/Voucher/Promocode', null, Icons.card_giftcard),
                  _buildProfileItem('Edit Account', null, Icons.person),
                ],
              ),

              const SizedBox(height: AppSize.appSize20),

              // Settings Section in Card
              _buildSectionCard(
                title: 'Settings',
                children: [
                  _buildProfileItem(
                      'Saved Payment Details', null, Icons.credit_card,
                      route: AppRoutes.savedPaymentDetails),
                  _buildProfileItem('Notifications', null, Icons.notifications,
                      route: AppRoutes.notification),
                  buildLightModeSwitch(),
                  // _buildProfileItem('Passwords', null, Icons.lock),
                  _buildProfileItem('Settings', null, Icons.settings,
                      route: AppRoutes.settings),
                  // _buildProfileItem('Language', null, Icons.language),
                ],
              ),

              const SizedBox(height: AppSize.appSize40),

              // Logout Button
              AppButton(
                onPressed: () {
                  _logoutConfirmationBottomSheet(Get.context!);
                },
                text: AppString.buttonTextLogOut,
                backgroundColor: AppColor.supportColor,
                margin: const EdgeInsets.only(top: AppSize.appSize18),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      {required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.backgroundColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: themedColor(Get.context!, (c) => c.text2Color),
                fontSize: AppSize.appSize16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSize.appSize10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildProfileItem(String title, int? badgeCount, IconData icon,
      {String route = ''}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon,
              color: themedColor(Get.context!, (c) => c.text2Color),
              size: AppSize.appSize20),
          title: Wrap(
            children: [
              Text(title,
                  style: TextStyle(
                      color: themedColor(Get.context!, (c) => c.text2Color),
                      fontSize: AppSize.appSize14)),
              const SizedBox(width: 8),
              if (badgeCount != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.appSize8, vertical: AppSize.appSize4),
                  decoration: BoxDecoration(
                    color: AppColor.supportColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.appSize12),
                  ),
                ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Colors.white54, size: AppSize.appSize14),
          onTap: () {
            if (route.isNotEmpty) {
              Get.toNamed(route);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            color: themedColor(Get.context!, (c) => c.lineColor),
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }

  void _logoutConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: themedColor(Get.context!, (c) => c.cardBackgroundColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontSize: AppSize.appSize15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.appSize16),
              Text(
                'You we be required to provide your passwords next you login again',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontSize: AppSize.appSize13),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: AppSize.appSize16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themedColor(
                            Get.context!, (c) => c.cardBackgroundColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.offAllNamed(AppRoutes.signUpView);
                      },
                      child: const Text('Log Out',
                          style: TextStyle(color: AppColor.supportColor)),
                    ),
                  ),
                  const SizedBox(width: AppSize.appSize12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.supportColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Get.offAllNamed(AppRoutes.buyerHomeView);
                      },
                      child: Text('No',
                          style: TextStyle(
                              color: themedColor(
                                  Get.context!, (c) => c.secondaryColor))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
