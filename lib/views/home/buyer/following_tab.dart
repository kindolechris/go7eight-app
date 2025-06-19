import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';

class FollowingTab extends StatelessWidget {
  const FollowingTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> following = [
      {
        'username': 'Ronny',
        'fullName': 'Eleanor Pena',
        'profileImage': 'assets/images/profile1.png',
      },
      {
        'username': 'RR.00',
        'fullName': 'Ronald Richards',
        'profileImage': 'assets/images/profile2.png',
      },
      {
        'username': 'De_von',
        'fullName': 'Devon Lane',
        'profileImage': 'assets/images/profile3.png',
      },
      {
        'username': 'fox_roboert',
        'fullName': 'Robert Fox',
        'profileImage': 'assets/images/profile4.png',
      },
      {
        'username': 'jenuuu.wilson',
        'fullName': 'Jenny Wilson',
        'profileImage': 'assets/images/profile5.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 10),

          // Search Field
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.white54),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Following List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: following.length,
            itemBuilder: (context, index) {
              var user = following[index];
              return _buildFollowingItem(
                username: user['username'],
                fullName: user['fullName'],
                profileImage: user['profileImage'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingItem({
    required String username,
    required String fullName,
    required String profileImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(profileImage),
          ),
          const SizedBox(width: AppSize.appSize12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style:  TextStyle(
                    fontSize: AppSize.appSize14,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.appFontSemiBold,
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  fullName,
                  style:  TextStyle(
                    fontSize: AppSize.appSize12,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.appFontSemiBold,
                    color: themedColor(Get.context!, (c) => c.text2Color),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child:  Text(
                'Follow',
                style:  TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFont.appFontSemiBold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
              ))
        ],
      ),
    );
  }
}
