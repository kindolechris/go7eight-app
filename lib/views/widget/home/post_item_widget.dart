import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../config/app_icon.dart';
import '../../../config/app_size.dart';
import '../../../config/app_string.dart';
import '../../../helpers/theme_helper.dart';
import '../../../routes/app_routes.dart';
import 'rates_bottom_sheet.dart';
import 'user_profile_sheet.dart';
import 'user_profile_sheet_seller.dart';
import 'wish_listers_bottom_sheet.dart';

class PostItemWidget extends StatelessWidget {
  final dynamic post;

  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: post.showActionsOnImage == true
          ? _buildImageOverlayPost(context)
          : _buildStandardPost(context),
    );
  }

  /// 📸 Layout for posts with action buttons over the image
  Widget _buildImageOverlayPost(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Image.asset(
            post.postImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 100,
          ),
        ),

        if (post.showVolumeIcon)
          Positioned(
            bottom: AppSize.appSize110,
            left: AppSize.appSize10,
            child: Row(
              children: [
                Image.asset(AppIcon.volume, width: AppSize.appSize24),
                const SizedBox(width: 6),
                Text("Indila - Love Story",
                    style: TextStyle(
                      fontSize: AppSize.appSize14,
                      color: themedColor(Get.context!, (c) => c.text1Color),
                    )),
              ],
            ),
          ),

        // 🔝 Top Row (Profile + Follow)
        Positioned(
          top: AppSize.appSize10,
          left: AppSize.appSize10,
          right: AppSize.appSize10,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.sellerProfile);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(post.profileImage),
                  radius: 20,
                ),
              ),
              const Spacer(),
              Text("Follow", style: TextStyle(color: Colors.white)),
              const SizedBox(width: 4),
              if (post.verifiedUserIcon)
                const Icon(Icons.verified,
                    size: 16, color: AppColor.primaryColor),
              const SizedBox(width: 8),
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ),

        // 🔻 Bottom Row (Actions + Book Now)
        Positioned(
          bottom: AppSize.appSize10,
          left: AppSize.appSize10,
          right: AppSize.appSize0,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _photoOptionWidget(
                          AppIcon.comment,
                          AppSize.appSize22,
                          AppString.comment10k,
                        ),
                        const SizedBox(width: 8),
                        _photoOptionWidget(
                          AppIcon.emptyLike,
                          AppSize.appSize22,
                          AppString.likes55k,
                          onTap: () {
                            showWishListersBottomSheet(context);
                          },
                          onTapText: () {},
                        ),
                        const SizedBox(width: 8),
                        _photoOptionWidget(
                          AppIcon.share,
                          AppSize.appSize22,
                          AppString.share5k,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        text: post.profileID,
                        style: TextStyle(
                            fontSize: AppSize.appSize14,
                            fontFamily: AppFont.appFontRegular,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor)),
                        children: [
                          TextSpan(
                            text: " ${post.postDescription}",
                            style: TextStyle(
                                fontSize: AppSize.appSize14,
                                fontFamily: AppFont.appFontRegular,
                                color: themedColor(
                                    Get.context!, (c) => c.text2Color)),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSize.appSize24),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 30,
                width: 110,
                child: TextButton(
                  onPressed: () {
                    // Get.toNamed(AppRoutes.productCheckout);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.supportColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  /// 🧱 Default layout with image then action buttons below
  Widget _buildStandardPost(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24), // gap between posts
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack for image + overlay info
          Padding(
            padding: const EdgeInsets.only(top: AppSize.appSize12),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    post.postImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                // Tag Icon
                if (post.showTagUserIcon)
                  Positioned(
                    bottom: AppSize.appSize10,
                    left: AppSize.appSize10,
                    child:
                        Image.asset(AppIcon.tagUser, width: AppSize.appSize24),
                  ),

                // Volume Icon
                if (post.showVolumeIcon)
                  Positioned(
                    bottom: AppSize.appSize10,
                    right: AppSize.appSize10,
                    child:
                        Image.asset(AppIcon.volume, width: AppSize.appSize24),
                  ),

                // Overlay Profile Row
                Positioned(
                  top: AppSize.appSize10,
                  left: AppSize.appSize10,
                  right: AppSize.appSize10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile Picture
                      InkWell(
                        onTap: () => showBuyerProfileBottomSheet(context),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(post.profileImage),
                          radius: 20,
                        ),
                      ),
                      const SizedBox(width: AppSize.appSize10),

                      // Username and Location

                      // Follow Button
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Follow',
                                style: TextStyle(color: Colors.white)),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert,
                                color: Colors.white),
                          ),
                        ],
                      ),

                      // More Options
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons (Like, Comment, etc.)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSize.appSize14,
                      horizontal: AppSize.appSize12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _photoOptionWidget(
                        AppIcon.comment,
                        AppSize.appSize22,
                        AppString.comment10k,
                        onTap: () {
                          ratesBottomSheet(context);
                        },
                        onTapText: () {
                          ratesBottomSheet(context);
                        },
                      ),
                      const SizedBox(width: AppSize.appSize8),
                      _photoOptionWidget(
                        AppIcon.emptyLike,
                        AppSize.appSize26,
                        AppString.likes55k,
                        onTap: () {
                          showWishListersBottomSheet(context);
                        },
                        onTapText: () {},
                      ),
                      const SizedBox(width: AppSize.appSize8),
                      _photoOptionWidget(
                          AppIcon.share, AppSize.appSize22, AppString.share5k),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 110,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.productCheckout);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.supportColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Post Description
          Padding(
            padding: const EdgeInsets.only(
                top: AppSize.appSize6,
                left: AppSize.appSize12,
                right: AppSize.appSize12),
            child: RichText(
              text: TextSpan(
                text: post.profileID,
                style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFont.appFontBold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                children: [
                  TextSpan(
                    text: post.postDescription,
                    style: TextStyle(
                      fontSize: AppSize.appSize14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFont.appFontRegular,
                      color: themedColor(Get.context!, (c) => c.secondaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔄 Icon + text widget
  Widget _photoOptionWidget(
    String icon,
    double width,
    String text, {
    void Function()? onTap,
    void Function()? onTapText,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            icon,
            width: width,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTapText,
          child: Text(
            text,
            style: TextStyle(
              color: themedColor(Get.context!, (c) => c.secondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
