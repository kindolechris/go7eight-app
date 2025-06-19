import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/seller/post_tab.dart';
import 'package:share_plus/share_plus.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../helpers/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../../home/buyer/rating_tab.dart';
import '../../home/seller/deliveriables_tab.dart';
import '../../home/seller/followers_tab.dart';
import '../../home/seller/following_tab.dart';

class SellerProfilePage extends StatefulWidget {
  const SellerProfilePage({super.key});

  @override
  State<SellerProfilePage> createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  int selectedTabIndex = 0;

  final List<String> tabs = [
    '2 Posts',
    '123 Deriveries',
    'Analytics',
    '1 Follower',
    '50 Following',
  ];

  void _showPopupOptions() {
    final List<Map<String, String>> options = [
      {'name': 'Switch to Buyer'},
      {'name': 'Share Profile'},
      {'name': 'Show QR Code'},
      {'name': 'Copy Profile URL'},
      {'name': 'Deactivate Seller Account'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              ...options.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final option = entry.value;
                  final isLast = index == options.length - 1;

                  return ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      if (index == 0) {
                        Get.offAllNamed(AppRoutes.buyerHomeView);
                      } else if (index == 1) {
                        Share.share(
                            'check this seller profile https://example.com');
                      } else {
                        debugPrint('Selected: ${option['name']}');
                      }
                    },
                    title: Text(
                      option['name']!,
                      style: TextStyle(
                        fontSize: AppSize.appSize14,
                        fontFamily: AppFont.appFontRegular,
                        color: isLast
                            ? AppColor.supportColor
                            : themedColor(Get.context!,(c) => c.secondaryColor),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Eleanor_pena',
          style: TextStyle(
              color: themedColor(Get.context!, (c) => c.secondaryColor),
              fontSize: AppSize.appSize16,
              fontFamily: AppFont.appFontRegular),
        ),
        actions: [
          Center(
            child: Text(
              'Following',
              style: TextStyle(
                
                fontSize: AppSize.appSize14,
                fontFamily: AppFont.appFontRegular,
                color: themedColor(Get.context!,(c) => c.text2Color),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _showPopupOptions,
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(6),
              decoration:   BoxDecoration(
                shape: BoxShape.circle,
                color: themedColor(Get.context!, (c) => c.borderColor),
              ),
              child:   Icon(Icons.more_vert, color: themedColor(Get.context!, (c) => c.secondaryColor), size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/images/verified.png'),
            const SizedBox(height: AppSize.appSize12),
            Text(
              "Silver Star",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.appSize14,
                fontFamily: AppFont.appFontBold,
                color: themedColor(Get.context!,(c) => c.secondaryColor),
              ),
            ),
            const SizedBox(height: AppSize.appSize12),
              Text(
              "Silver Star is a verified seller who has been using Go7eight for 3 years and has a 4.9 rating",
              textAlign: TextAlign.center,
              style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color), fontSize: 14),
            ),
            const SizedBox(height: AppSize.appSize14),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedTabIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTabIndex = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.primaryColor
                              : themedColor(Get.context!, (c) => c.backgroundColor),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: themedColor(Get.context!, (c) => c.borderColor),),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : themedColor(Get.context!,(c) => c.text2Color),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: AppSize.appSize14),

            // Tab View
            if (selectedTabIndex == 0) ...[const PostTab()],
            if (selectedTabIndex == 1) ...[const DeliveriablesTab()],
            if (selectedTabIndex == 2) ...[const RatingsTab()],
            if (selectedTabIndex == 3) ...[const FollowersTab()],
            if (selectedTabIndex == 4) ...[const FollowingTab()],
          ],
        ),
      ),
    );
  }
}
