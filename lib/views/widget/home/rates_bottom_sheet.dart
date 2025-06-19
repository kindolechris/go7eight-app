import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/profile/settings_options/language_controller.dart';

import '../../../helpers/theme_helper.dart';

LanguageController languageController = Get.put(LanguageController());

ratesBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSize.appSize12),
        topRight: Radius.circular(AppSize.appSize12),
      ),
      borderSide: BorderSide.none,
    ),
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Container(
        height: AppSize.appSize715,
        padding: const EdgeInsets.only(top: AppSize.appSize12),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.appSize12),
            topRight: Radius.circular(AppSize.appSize12),
          ),
          color: themedColor(Get.context!, (c) => c.backgroundColor),
        ),
        child: Column(
          children: [
            // Drag handle
            Container(
              width: AppSize.appSize28,
              height: AppSize.appSize2,
              margin: const EdgeInsets.only(bottom: AppSize.appSize12),
              decoration: BoxDecoration(
                color: themedColor(Get.context!, (c) => c.lineColor),
                borderRadius: BorderRadius.circular(AppSize.appSize6),
              ),
            ),

            // Header with title and close
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSize.appSize20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Reviews & Ratings',
                    style: TextStyle(
                      fontSize: AppSize.appSize18,
                      fontWeight: FontWeight.bold,
                      color: themedColor(Get.context!, (c) => c.secondaryColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration:  BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                          BorderSide(color: themedColor(Get.context!, (c) => c.borderColor), width: 1),
                        ),
                      ),
                      child:  Icon(
                        Icons.close,
                        color: themedColor(Get.context!, (c) => c.secondaryColor),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.appSize12),

            // Rating summary
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSize.appSize20),
              child: Row(
                children: const [
                  Text(
                    '3.9',
                    style: TextStyle(
                      fontSize: AppSize.appSize32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star_half, color: Colors.amber, size: 16),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        '1,675',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.appSize20),
              child: Divider(color: themedColor(Get.context!, (c) => c.lineColor)),
            ),

            // Reviews list
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSize.appSize20),
                children: [
                  _ratingReviewTile(
                    image: 'assets/images/profile1.png',
                    name: 'Eleanor Pena',
                    time: '33m',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy.',
                    rating: 5,
                    likes: 1234,
                  ),
                  _ratingReviewTile(
                    image: 'assets/images/profile2.png',
                    name: 'Bessie Cooper',
                    time: '20m',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    rating: 4,
                    likes: 980,
                  ),
                  _ratingReviewTile(
                    image: 'assets/images/profile1.png',
                    name: 'Eleanor Pena',
                    time: '33m',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy.',
                    rating: 4,
                    likes: 1234,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _ratingReviewTile({
  required String image,
  required String name,
  required String time,
  required String comment,
  required double rating,
  required int likes,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(time,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      )),
                ],
              ),
              const SizedBox(height: 4),
              Text(comment,
                  style: const TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 6),
              Wrap(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    likes.toString(),
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  const Spacer(),
                  const Text(
                    'Was this review helpful?',
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
