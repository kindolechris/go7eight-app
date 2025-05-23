import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

import '../../../helpers/theme_helper.dart';
import 'followers_tab.dart';
import 'following_tab.dart';
import 'post_tab.dart';
import 'rating_tab.dart';

class BuyerDashboardPage extends StatefulWidget {
  const BuyerDashboardPage({super.key});

  @override
  State<BuyerDashboardPage> createState() => _BuyerDashboardPageState();
}

class _BuyerDashboardPageState extends State<BuyerDashboardPage> {
  int selectedTabIndex = 0; // Track which tab is selected

  final List<String> tabs = [
    '2 Posts',
    '3.9 Stars Rated',
    '1 Followers',
    '50 Following',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: themedColor(Get.context!, (c) => c.secondaryColor)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Text(
          'eleanor_pena',
          style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.more_vert, color: themedColor(Get.context!, (c) => c.secondaryColor)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Profile Image + Upgrade Button
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.pink, AppColor.primaryColor],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile1.png'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: AppColor.primaryColor,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'Upgrade to Seller',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Info Text
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "This account is currently set up for shopping only.\nTo start selling and earning on Go7eight, upgrade your account to a seller.",
                textAlign: TextAlign.center,
                style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color), fontSize: 14),
              ),
            ),

            const SizedBox(height: 20),

            // Counter Tabs (Dynamic)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return Row(
                    children: [
                      _buildCounterButton(tabs[index], index),
                      const SizedBox(width: 8),
                    ],
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            if (selectedTabIndex == 0) ...[
              const PostTab(),
            ] else if (selectedTabIndex == 1) ...[
              const RatingsTab(),
            ] else if (selectedTabIndex == 2) ...[
              const FollowersTab(),
            ] else if (selectedTabIndex == 3) ...[
              const FollowingTab(),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildCounterButton(String title, int index) {
    bool isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index; // Update selected tab
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white54),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : themedColor(Get.context!, (c) => c.text2Color),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  Widget _buildPostItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Post image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                'assets/images/post1.png',
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            // Post info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Caption',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                     Text(
                      'Lorem Ipsum is simply dummy text of the pri.....',
                      style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color), fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children:  [
                        Text(
                          'Monetize',
                          style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          '2k Views',
                          style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color), fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
