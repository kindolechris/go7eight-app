// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_image.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/home/reels_play_controller.dart';
import 'package:video_player/video_player.dart';

import '../../../config/app_font.dart';
import '../../../config/app_icon.dart';
import '../../../config/app_size.dart';
import '../../../config/app_string.dart';
import '../../../helpers/theme_helper.dart';

class ReelsPlayFullView extends StatelessWidget {
  ReelsPlayFullView({Key? key}) : super(key: key);

  ReelsPlayController reelsPlayController = Get.put(ReelsPlayController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        body: _body(context),
      ),
    );
  }

  //Reel play full view content
  _body(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          return reelsPlayController.isInitialised.value
              ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: VideoPlayer(reelsPlayController.controller!),
          ) : Container();
        }),
        Padding(
          padding: const EdgeInsets.only(left: AppSize.appSize20, top: AppSize.appSize14),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppIcon.back,
              width: AppSize.appSize24,
            ),
          ),
        ),
        Positioned(
          bottom: AppSize.appSize0,
          child: Container(
            height: AppSize.appSize105,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: AppSize.appSize20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(AppSize.appSizePoint6),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: AppSize.appSize10),
                      child: Image.asset(
                        AppImage.profile4,
                        width: AppSize.appSize36,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                             Text(
                              AppString.marvinID,
                              style: TextStyle(
                                fontSize: AppSize.appSize14,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.appFontSemiBold,
                                color: themedColor(Get.context!, (c) => c.secondaryColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                reelsPlayController.toggleFollow();
                              },
                              child: Obx(() => Container(
                                height: AppSize.appSize26,
                                width: AppSize.appSize82,
                                margin: const EdgeInsets.only(left: AppSize.appSize8, top: AppSize.appSize4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                                  ),
                                  borderRadius: BorderRadius.circular(AppSize.appSize6),
                                ),
                                child: Center(
                                  child: Text(
                                    reelsPlayController.isFollow.value ? AppString.following : AppString.follow,
                                    style:  TextStyle(
                                      fontSize: AppSize.appSize12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFont.appFontSemiBold,
                                      color: themedColor(Get.context!, (c) => c.secondaryColor),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSize.appSize20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppSize.appSize6),
                        child: Image.asset(
                          AppIcon.arrowRightUp,
                          width: AppSize.appSize14,
                        ),
                      ),
                       Text(
                        AppString.martinGarrixSong,
                        style: TextStyle(
                          fontSize: AppSize.appSize12,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFont.appFontRegular,
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
        Positioned(
          bottom: AppSize.appSize0,
          right: AppSize.appSize0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: AppSize.appSize60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                tileMode: TileMode.mirror,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(AppSize.appSizePoint6),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: AppSize.appSize8,
          right: AppSize.appSize12,
          child: Padding(
            padding: const EdgeInsets.only(top: AppSize.appSize12, bottom: AppSize.appSize14),
            child: Column(
              children: [
                _photoOptionWidget(AppIcon.comment, AppSize.appSize24, AppString.comment10k),
                _photoOptionWidget(AppIcon.repost, AppSize.appSize27, AppString.repost15k),
                Obx(() {
                  bool isLiked = reelsPlayController.isLiked.value;
                  return _photoOptionWidget(
                    isLiked ? AppIcon.like : AppIcon.emptyLike,
                    AppSize.appSize26,
                    AppString.likes55k,
                    onTap: () {
                      reelsPlayController.toggleLike();
                    },
                  );
                }),
                _photoOptionWidget(AppIcon.share, AppSize.appSize24, AppString.share5k),
                _photoOptionWidget(AppIcon.save, AppSize.appSize24, AppString.save2k),
                Padding(
                  padding: const EdgeInsets.only(top: AppSize.appSize18),
                  child: Image.asset(
                    AppImage.musicWave,
                    width: AppSize.appSize30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _photoOptionWidget(String icon, double width, String text, {void Function() ? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.appSize14),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: AppSize.appSize2),
              child: Image.asset(
                icon,
                width: width,
              ),
            ),
            Text(
              text,
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
    );
  }
}
