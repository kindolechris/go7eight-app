// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_icon.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/bottom_bar/buyer_controller.dart';

import '../../helpers/theme_helper.dart';

class BuyerHomeView extends StatelessWidget {
  BuyerHomeView({Key? key}) : super(key: key);

  BuyerController buyerController = Get.put(BuyerController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CustomTheme.bottomNavBarTheme,
      child: Scaffold(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        body: _body(context),
        bottomNavigationBar: _bottomBar(context),
      ),
    );
  }

  //Bottom Bar content
  _body(BuildContext context) {
    return Obx(() => PageView.builder(
          itemCount: buyerController.pages.length,
          controller: buyerController.pageController,
          onPageChanged: (index) {
            buyerController.changeSelectedIndex(context, index);
          },
          itemBuilder: (context, index) {
            return buyerController.pages[index];
          },
        ));
  }

  _bottomBar(BuildContext context) {
    return Obx(() => SizedBox(
          height: kIsWeb
              ? AppSize.appSize62
              : Platform.isIOS
                  ? AppSize.appSize90
                  : AppSize.appSize62,
          child: BottomNavigationBar(
            iconSize: AppSize.appSize22,
            backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: buyerController.selectedIndex.value,
            onTap: (index) {
              buyerController.changeSelectedIndex(context, index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  buyerController.selectedIndex.value == 0
                      ? AppIcon.profileFillIcon
                      : AppIcon.profileIcon,
                  width: AppSize.appSize22,color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  buyerController.selectedIndex.value == 1
                      ? AppIcon.homeFillIcon
                      : AppIcon.homeIcon,
                  width: AppSize.appSize22,color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   icon: Image.asset(
              //     buyerController.selectedIndex.value == 1
              //         ? AppIcon.notificationFillIcon
              //         : AppIcon.notificationIcon,
              //     width: AppSize.appSize22,
              //   ),
              //   label: '',
              // ),
              // BottomNavigationBarItem(
              //   icon: Image.asset(
              //     AppIcon.postIcon,
              //     width: AppSize.appSize22,
              //   ),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  buyerController.selectedIndex.value == 2
                      ? AppIcon.historyIconFill
                      : AppIcon.historyIcon,
                  width: AppSize.appSize22,color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                label: '',
              ),
            ],
          ),
        ));
  }
}

class CustomTheme {
  static ThemeData bottomNavBarTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
