import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

import '../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';

void showWishListersBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                // Drag handle
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wish Listers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Search Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.white54),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // List of users
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: demoUsers.length,
                    itemBuilder: (context, index) {
                      final user = demoUsers[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(user['image']),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user['username'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user['name'],
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: toggle follow state
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: user['isFollowing']
                                      ? Colors
                                          .grey[800] // Dark gray for Following
                                      : AppColor.primaryColor, // Blue for Follow
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets
                                      .zero, // Let SizedBox control the size
                                ),
                                child: Text(
                                  user['isFollowing'] ? 'Following' : 'Follow',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: user['isFollowing']
                                        ? Colors.white70
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

final List<Map<String, dynamic>> demoUsers = [
  {
    'image': 'assets/images/profile1.png',
    'username': 'eleanor_pena',
    'name': 'Eleanor Pena',
    'isFollowing': false
  },
  {
    'image': 'assets/images/profile2.png',
    'username': 'RR.00',
    'name': 'Ronald Richards',
    'isFollowing': true
  },
  {
    'image': 'assets/images/profile3.png',
    'username': 'De_von',
    'name': 'Devon Lane',
    'isFollowing': false
  },
  {
    'image': 'assets/images/profile4.png',
    'username': 'fox_roboert',
    'name': 'Robert Fox',
    'isFollowing': true
  },
  {
    'image': 'assets/images/profile5.png',
    'username': 'jenuuu.wilson',
    'name': 'Jenny Wilson',
    'isFollowing': false
  },
  {
    'image': 'assets/images/profile6.png',
    'username': 'marvin.mckinney.co',
    'name': 'Marvin Mckinney',
    'isFollowing': true
  },
  {
    'image': 'assets/images/profile7.png',
    'username': 'esther_howard_01',
    'name': 'Esther Howard',
    'isFollowing': true
  },
  {
    'image': 'assets/images/profile8.png',
    'username': 'wade_10',
    'name': 'Wade Warren',
    'isFollowing': false
  },
];
