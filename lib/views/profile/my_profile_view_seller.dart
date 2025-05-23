import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

import '../../config/app_font.dart';
import '../../config/app_string.dart';
import '../../controller/theme_controller.dart';
import '../../helpers/theme_helper.dart';
import '../../helpers/theme_switch.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class MyProfileViewSeller extends StatefulWidget {
  const MyProfileViewSeller({super.key});

  @override
  State<MyProfileViewSeller> createState() => _MyProfileViewSellerState();
}

class _MyProfileViewSellerState extends State<MyProfileViewSeller> {
  bool isCardNumberVisible = true;
  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        leading: Container(),
        title: Row(
          children: [
            Text(
              'Eleanor_pena',
              style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 6),
            Icon(Icons.verified, color: AppColor.primaryColor, size: 20),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.appSize16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileDetails(),
            _buildBalanceRow(),
            const SizedBox(height: 16),
            _buildWalletCard(isCardNumberVisible),
            const SizedBox(height: 16),
            _buildActionButtonsRow(),
            const SizedBox(height: 16),
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
                _buildProfileItem('Purchase History', null, Icons.history,
                    route: AppRoutes.purchaseHistory),
                _buildProfileItem('Edit Account', null, Icons.person),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionCard(
              title: 'Settings',
              children: [
                _buildProfileItem(
                    'Saved Payment Details', null, Icons.credit_card,
                    route: AppRoutes.savedPaymentDetails),
                _buildProfileItem(
                    'Currency preference', null, Icons.monetization_on),
                _buildProfileItem('Notifications', null, Icons.notifications,
                    route: AppRoutes.notification),
                buildLightModeSwitch(),
                // _buildProfileItem('Passwords', null, Icons.lock),
                _buildProfileItem('Settings', null, Icons.settings,
                    route: AppRoutes.settings),
                // _buildProfileItem('Language', null, Icons.language),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => _logoutConfirmationBottomSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.supportColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: AppSize.appSize14,
                      fontFamily: AppFont.appFontRegular,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
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
                color: themedColor(Get.context!, (c) => c.secondaryColor),
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
          trailing: Icon(Icons.arrow_forward_ios,
              color: themedColor(Get.context!, (c) => c.text2Color),
              size: AppSize.appSize14),
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
          padding: const EdgeInsets.all(24),
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
                        backgroundColor:
                            themedColor(Get.context!, (c) => c.chatColor),
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
                      child: Text(
                        'No',
                        style: TextStyle(
                            fontSize: AppSize.appSize14,
                            fontFamily: AppFont.appFontRegular,
                            color: Colors.white),
                      ),
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

  Widget _profileDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/profile1.png'),
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: themedColor(Get.context!, (c) => c.backgroundColor),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "will be required in info so you won't need to enter\nit the next time you log in.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppSize.appSize14,
            color: themedColor(Get.context!, (c) => c.text2Color),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.updateBusinessInfo);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.appSize16, vertical: 12),
          ),
          child: const Text("Update Business Info",
              style: TextStyle(
                  color: Colors.white, fontFamily: AppFont.appFontSemiBold)),
        ),
        const SizedBox(height: 8),
        Divider(
          color: themedColor(Get.context!, (c) => c.lineColor),
        ),
      ],
    );
  }

  Widget _buildBalanceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBalanceCard('Actual Balance', 'TZS 823,007,678.00'),
        _buildBalanceCard('Available Balance', 'TZS 123,007,678.00'),
      ],
    );
  }

  Widget _buildBalanceCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: themedColor(Get.context!, (c) => c.chatColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontFamily: AppFont.appFontRegular,
                  color: themedColor(Get.context!, (c) => c.text2Color)),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                  fontSize: AppSize.appSize16,
                  fontFamily: AppFont.appFontBold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletCard(bool isCardNumberVisible) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Go7eight Merchant Wallet',
              style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontFamily: AppFont.appFontSemiBold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: AppSize.appSize20),
          Text(
            isCardNumberVisible
                ? '1234 - 4567 - 8910 - A33Q'
                : '**** - **** - **** - ****',
            style: TextStyle(
                fontSize: AppSize.appSize22,
                fontFamily: AppFont.appFontRegular,
                color: Colors.white),
          ),
          const SizedBox(height: AppSize.appSize20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Antemeridian Limited',
                style: TextStyle(
                    fontSize: AppSize.appSize14,
                    fontFamily: AppFont.appFontRegular,
                    color: Colors.white),
              ),
              Text(
                'Created 22/04/2025',
                style: TextStyle(
                    fontSize: AppSize.appSize14,
                    fontFamily: AppFont.appFontRegular,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildToggleCardVisibilityButton(),
        _buildActionButton(Icons.account_balance_wallet, 'Withdraw'),
        _buildActionButton(Icons.compare_arrows, 'Transactions'),
      ],
    );
  }

  Widget _buildToggleCardVisibilityButton() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCardNumberVisible = !isCardNumberVisible;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(
                color: themedColor(Get.context!, (c) => c.borderColor)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                isCardNumberVisible
                    ? Icons.visibility_off
                    : Icons.remove_red_eye,
                color: themedColor(Get.context!, (c) => c.text2Color),
              ),
              const SizedBox(height: AppSize.appSize6),
              Text(
                'Card Details',
                style: TextStyle(
                    fontSize: AppSize.appSize14,
                    fontFamily: AppFont.appFontRegular,
                    color: themedColor(Get.context!, (c) => c.text2Color)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
              color: themedColor(Get.context!, (c) => c.borderColor)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: themedColor(Get.context!, (c) => c.text2Color)),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontFamily: AppFont.appFontRegular,
                  color: themedColor(Get.context!, (c) => c.text2Color)),
            ),
          ],
        ),
      ),
    );
  }
}
