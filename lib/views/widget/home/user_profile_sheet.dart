import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

import '../../../config/app_color.dart';
import '../../../helpers/theme_helper.dart';
import '../../home/buyer/followers_tab.dart';
import '../../home/buyer/following_tab.dart';
import '../../home/buyer/post_tab.dart';

showBuyerProfileBottomSheet(BuildContext context) {
  int selectedTabIndex = 0;

  final List<String> tabs = [
    '2 Posts',
    '1 Community',
    '50 Following',
  ];

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
                        GestureDetector(
                          onTap: () {
                            // Define your action for more options here
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
                        const SizedBox(height: 12),
                        const Text(
                          "Verified Sellers are reputable for shopping only.\nTo start selling and earning on Go7eight, upgrade your account to a seller.",
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
                      const FollowersTab(),
                    ] else if (selectedTabIndex == 2) ...[
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
