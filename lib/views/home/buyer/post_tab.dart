import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

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
            child:  TextField(
              style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: themedColor(Get.context!, (c) => c.text2Color)),
                hintText: 'Search',
                hintStyle: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color)),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: AppSize.appSize20),

          // Posts List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return _buildPostItem();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.appSize12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
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
                'assets/images/post1.png',
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: AppSize.appSize10),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppSize.appSize10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Caption',
                      style:  TextStyle(
                        fontSize: AppSize.appSize14,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont.appFontSemiBold,
                        color: themedColor(Get.context!, (c) => c.secondaryColor),
                      ),
                    ),
                    const SizedBox(height: AppSize.appSize5),
                     Text(
                      'Lorem Ipsum is simply dummy text of the pri.....',
                      style:  TextStyle(
                        fontSize: AppSize.appSize12,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont.appFontSemiBold,
                        color: themedColor(Get.context!, (c) => c.text2Color),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSize.appSize12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSize.appSize4,
                          horizontal: AppSize.appSize12),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye_outlined,
                              size: AppSize.appSize28,
                                  color: themedColor(Get.context!, (c) => c.secondaryColor))),
                          // Text(
                          //   'Monetize',
                          //   style: const TextStyle(
                          //     fontSize: AppSize.appSize14,
                          //     fontWeight: FontWeight.w600,
                          //     fontFamily: AppFont.appFontSemiBold,
                          //     color: AppColor.supportColor,
                          //   ),
                          // ),
                          Spacer(),
                          Text(
                            'In stock',
                            style:  TextStyle(
                              fontSize: AppSize.appSize14,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.appFontSemiBold,
                              color: themedColor(Get.context!, (c) => c.secondaryColor),
                            ),
                          ),
                        ],
                      ),
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
