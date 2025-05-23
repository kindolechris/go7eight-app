import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/views/reels/reels_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/widget/new_post/new_post_options_bottom_sheet.dart';

import '../../views/home/home_page.dart';
import '../../views/home/seller/seller_profile.dart';
import '../../views/home/story_page.dart';
import '../../views/profile/my_profile_view.dart';
import '../../views/profile/my_profile_view_seller.dart';

class SellerController extends GetxController {
  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  void changeSelectedIndex(BuildContext context, int index) {
    selectedIndex.value = index;
    // if (selectedIndex.value == 2) {
    //   selectedIndex.value = 0;
    //   newPostOptionsBottomSheet(context);
    // }
    pageController.jumpToPage(selectedIndex.value);
    update();
  }

  RxList<Widget> pages = [
    HomePage(),
    SellerProfilePage(),
    StoryListPage(),
    ReelsView(),
    MyProfileViewSeller(),
  ].obs;
}
