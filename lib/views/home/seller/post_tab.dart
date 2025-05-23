import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../helpers/theme_helper.dart';

class PostTab extends StatelessWidget {
  const PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // Search Field
          Container(
            decoration: BoxDecoration(
              color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor)),
              decoration: InputDecoration(
                icon: Icon(Icons.search,
                    color: themedColor(Get.context!, (c) => c.text2Color)),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: themedColor(Get.context!, (c) => c.text2Color)),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: AppSize.appSize20),

          // Posts List
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     return _buildPostItem()
          //     ;
          //   },
          // ),
          Column(
            children: [
              _buildPostItem(
                imagePath: 'assets/images/tshirt.png',
                title: 'Macbook Pro',
                subtitle: 'Lorem Ipsum is simply dummy text of the pri.....',
                rightLabel: 'Out of stock!',
                rightColor: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
              _buildPostItem(
                imagePath: 'assets/images/post3.png',
                title: 'Macbook Pro',
                subtitle: 'Lorem Ipsum is simply dummy text of the pri.....',
                leftLabel: 'Promote',
                leftColor: AppColor.primaryColor,
                rightLabel: 'In stock',
                rightColor: Colors.green,
                letfRoute: AppRoutes.postPromote,
              ),
              _buildPostItem(
                imagePath: 'assets/images/post4.png',
                title: 'Caption',
                subtitle: 'Lorem Ipsum is simply dummy text of the pri.....',
                leftLabel: 'Monetize',
                leftColor: AppColor.supportColor,
                rightLabel: '2k Views',
                rightColor: themedColor(Get.context!, (c) => c.secondaryColor),
                letfRoute: AppRoutes.monitizePageFirst,
              ),
              _buildPostItem(
                imagePath: 'assets/images/post5.png',
                title: 'Caption',
                subtitle: 'Lorem Ipsum is simply dummy text of the pri.....',
                leftLabel: 'Monetize',
                leftColor: AppColor.supportColor,
                rightLabel: '2k Views',
                rightColor: themedColor(Get.context!, (c) => c.secondaryColor),
                letfRoute: AppRoutes.monitizePageFirst,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPostItem({
    required String imagePath,
    required String title,
    required String subtitle,
    String? leftLabel,
    Color? leftColor,
    String? rightLabel,
    Color? rightColor,
    String letfRoute = '',
    String rightRoute = '',
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.appSize12),
      child: Container(
        decoration: BoxDecoration(
          color: themedColor(Get.context!, (c) => c.chatColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: AppSize.appSize10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSize.appSize10, horizontal: AppSize.appSize10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: AppSize.appSize14,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont.appFontSemiBold,
                        color:
                            themedColor(Get.context!, (c) => c.secondaryColor),
                      ),
                    ),
                    const SizedBox(height: AppSize.appSize5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: AppSize.appSize12,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont.appFontSemiBold,
                        color: themedColor(Get.context!, (c) => c.text2Color),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSize.appSize12),
                    Row(
                      children: [
                        if (leftLabel != null)
                          InkWell(
                            onTap: () => Get.toNamed(letfRoute),
                            child: Text(
                              leftLabel,
                              style: TextStyle(
                                fontSize: AppSize.appSize14,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.appFontSemiBold,
                                color: leftColor ??
                                    themedColor(
                                        Get.context!, (c) => c.secondaryColor),
                              ),
                            ),
                          ),
                        const Spacer(),
                        if (rightLabel != null)
                          Text(
                            rightLabel,
                            style: TextStyle(
                              fontSize: AppSize.appSize14,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.appFontSemiBold,
                              color: rightColor ??
                                  themedColor(
                                      Get.context!, (c) => c.secondaryColor),
                            ),
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

// Example usage:
// _buildPostItem(
//   imagePath: 'assets/images/post1.png',
//   title: 'Macbook Pro',
//   subtitle: 'Lorem Ipsum is simply dummy text of the pri.....',
//   leftLabel: 'Promote',
//   leftColor: Colors.blue,
//   rightLabel: 'In stock',
//   rightColor: Colors.green,
// );
}
