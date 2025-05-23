import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';

class RatingsTab extends StatelessWidget {
  const RatingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.appSize12),

          // Top Note
           Text(
            "Ratings and Reviews are verified are from sellers who use the same platform, Go7eight",
            style:  TextStyle(
              fontSize: AppSize.appSize14,
              fontWeight: FontWeight.w600,
              fontFamily: AppFont.appFontSemiBold,
              color: themedColor(Get.context!, (c) => c.text2Color),
            ),
          ),

          const SizedBox(height: AppSize.appSize12),

          // Rating Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Average Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "3.9",
                    style:  TextStyle(
                      fontSize: AppSize.appSize48,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFont.appFontSemiBold,
                      color: themedColor(Get.context!, (c) => c.secondaryColor),
                    ),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(Icons.star,
                          color: AppColor.primaryColor, size: 20);
                    }),
                  ),
                  const SizedBox(height: AppSize.appSize4),
                   Text(
                    "1,675",
                    style:  TextStyle(
                      fontSize: AppSize.appSize14,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFont.appFontSemiBold,
                      color: themedColor(Get.context!, (c) => c.text2Color),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppSize.appSize30),

              // Rating Bar
              Expanded(
                child: Column(
                  children: List.generate(5, (index) {
                    int star = 5 - index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Text(
                            "$star",
                            style:  TextStyle(
                              fontSize: AppSize.appSize12,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.appFontSemiBold,
                              color: themedColor(Get.context!, (c) => c.secondaryColor),
                            ),
                          ),
                          const SizedBox(width: AppSize.appSize4),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: _getRatingBarValue(star),
                              backgroundColor: Colors.white12,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColor.primaryColor),
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSize.appSize30),

          // Reviews List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return _buildReviewItem();
            },
          ),
        ],
      ),
    );
  }

  double _getRatingBarValue(int star) {
    switch (star) {
      case 5:
        return 1.0;
      case 4:
        return 0.8;
      case 3:
        return 0.6;
      case 2:
        return 0.4;
      case 1:
        return 0.2;
      default:
        return 0.0;
    }
  }

  Widget _buildReviewItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.appSize14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/profile1.png'),
          ),
          const SizedBox(width: AppSize.appSize12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'De_von',
                  style:  TextStyle(
                    fontSize: AppSize.appSize14,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.appFontSemiBold,
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                  ),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return const Icon(Icons.star, color: AppColor.primaryColor, size: 16);
                  }),
                ),
                const SizedBox(height: 5),
                 Text(
                  'Pena was such a wonderful person and Reviews are verified are from sellers who use the same platform, Go7eight',
                  style:  TextStyle(
                    fontSize: AppSize.appSize12,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFont.appFontSemiBold,
                    color: themedColor(Get.context!, (c) => c.text2Color),
                  ),
                ),
                const SizedBox(height: 5),
                 Text(
                  '17/04/2025',
                  style:  TextStyle(
                    fontSize: AppSize.appSize10,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.appFontSemiBold,
                    color: themedColor(Get.context!, (c) => c.text2Color),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
