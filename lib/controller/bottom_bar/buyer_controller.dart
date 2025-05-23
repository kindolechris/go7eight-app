import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home/home_page.dart';
import '../../views/home/story_page.dart';
import '../../views/profile/my_profile_view.dart';

class BuyerController extends GetxController {
  RxInt selectedIndex = 1.obs;
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
    MyProfileView(),
    HomePage(),
    StoryListPage(),

    // HomeView(),

    // NotificationsView(),
    // Container(),
    // ReelsView(),
    // ProfileView(),
  ].obs;
}
