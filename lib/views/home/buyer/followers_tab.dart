import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

import '../../../config/app_font.dart';
import '../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';

class FollowersTab extends StatelessWidget {
  const FollowersTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> followers = [
      {
        'username': 'Ronny',
        'fullName': 'Eleanor Pena',
        'isFollowBack': true,
        'profileImage': 'assets/images/profile1.png',
      },
      {
        'username': 'RR.00',
        'fullName': 'Ronald Richards',
        'isFollowBack': false,
        'profileImage': 'assets/images/profile2.png',
      },
      {
        'username': 'De_von',
        'fullName': 'Devon Lane',
        'isFollowBack': false,
        'profileImage': 'assets/images/profile3.png',
      },
      {
        'username': 'fox_roboert',
        'fullName': 'Robert Fox',
        'isFollowBack': false,
        'profileImage': 'assets/images/profile4.png',
      },
      {
        'username': 'jenuuu.wilson',
        'fullName': 'Jenny Wilson',
        'isFollowBack': false,
        'profileImage': 'assets/images/profile5.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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

          // Followers List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: followers.length,
            itemBuilder: (context, index) {
              var follower = followers[index];
              return _buildFollowerItem(
                username: follower['username'],
                fullName: follower['fullName'],
                isFollowBack: follower['isFollowBack'],
                profileImage: follower['profileImage'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFollowerItem({
    required String username,
    required String fullName,
    required bool isFollowBack,
    required String profileImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          if (isFollowBack)
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
