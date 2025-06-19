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

showSallerProfileBottomSheet1(BuildContext context) {
  int selectedTabIndex = 0;

  final List<String> tabs = [
    '2 Posts',
    '123 Deriveries',
    '4.9 Stars Rates',
    '12 Affiliate Links',
    '1 Follower',
    '50 Following',
  ];

  Widget _buildPopupOptions() {
    final List<Map<String, String>> options = [
      {'name': 'Switch to Buyer'},
      {'name': 'Share Profile'},
      {'name': 'Show QR Code'},
      {'name': 'Copy Profile URL'},
      {'name': 'Deactivate Seller Account'},
    ];

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
                  Navigator.pop(context); // close popup
                  if (index == 0) {
                    Get.offAllNamed(AppRoutes.buyerHomeView);
                  } else if (index == 1) {
                    SharePlus.instance.share(ShareParams(
                        text: 'check this seller profile https://example.com'));
                  } else {
                    // Handle other actions if needed
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
                        : themedColor(Get.context!, (c) => c.secondaryColor),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.65,
            maxChildSize: 0.95,
            minChildSize: 0.6,
            builder: (_, scrollController) => Container(
              decoration:  BoxDecoration(
                color: themedColor(Get.context!, (c) => c.backgroundColor),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      height: 4,
                      width: 40,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const Text(
                              'Eleanor_pena',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Following',
                              style:  TextStyle(
                                  fontSize: AppSize.appSize14,
                                  fontFamily: AppFont.appFontRegular,
                                  color: themedColor(Get.context!, (c) => c.text2Color)),
                            ),
                            const SizedBox(width: AppSize.appSize6),
                            GestureDetector(
                              onTap: () async {
                                final result =
                                    await showModalBottomSheet<String>(
                                  context: context,
                                  backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16)),
                                  ),
                                  builder: (_) => _buildPopupOptions(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                ),
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Profile Image + Button
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          // decoration: BoxDecoration(
                          //   shape: BoxShape.circle,
                          //   gradient: LinearGradient(
                          //       colors: [Colors.pink, AppColor.primaryColor]),
                          // ),
                          child: Image.asset('assets/images/verified.png'),
                        ),
                        const SizedBox(height: AppSize.appSize12),
                         Text(
                          "Silver Star",
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                              fontSize: AppSize.appSize14,
                              fontFamily: AppFont.appFontBold,
                              color: themedColor(Get.context!, (c) => c.secondaryColor)),
                        ),
                        const SizedBox(height: AppSize.appSize12),
                        const Text(
                          "Silver Star is a verified seller who has been using Go7eight for 3 years and has a 4.9 rating",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
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
                              onTap: () =>
                                  setState(() => selectedTabIndex = index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColor.primaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white54),
                                ),
                                child: Text(
                                  tabs[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? themedColor(Get.context!, (c) => c.secondaryColor)
                                        : themedColor(Get.context!, (c) => c.text2Color),
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
                    if (selectedTabIndex == 0) ...[
                      const PostTab(),
                    ] else if (selectedTabIndex == 1) ...[
                      const DeliveriablesTab(),
                    ] else if (selectedTabIndex == 2) ...[
                      const RatingsTab(),
                    ] else if (selectedTabIndex == 3) ...[
                      Container(),
                    ] else if (selectedTabIndex == 4) ...[
                      const FollowersTab(),
                    ] else if (selectedTabIndex == 5) ...[
                      const FollowingTab(),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
