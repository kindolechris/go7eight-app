// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_icon.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/bottom_bar/buyer_controller.dart';

import '../../controller/bottom_bar/seller_controller.dart';
import '../../helpers/theme_helper.dart';

class SallerHomeView extends StatelessWidget {
  SallerHomeView({Key? key}) : super(key: key);

  SellerController sellerController = Get.put(SellerController());

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
          itemCount: sellerController.pages.length,
          controller: sellerController.pageController,
          onPageChanged: (index) {
            sellerController.changeSelectedIndex(context, index);
          },
          itemBuilder: (context, index) {
            return sellerController.pages[index];
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
            currentIndex: sellerController.selectedIndex.value,
            onTap: (index) {
              sellerController.changeSelectedIndex(context, index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  sellerController.selectedIndex.value == 0
                      ? AppIcon.homeFillIcon
                      : AppIcon.homeIcon,
                  width: AppSize.appSize22,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  sellerController.selectedIndex.value == 1
                      ? AppIcon.dashboardFilled
                      : AppIcon.dashboard,
                  width: AppSize.appSize22,color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcon.postIcon,
                  width: AppSize.appSize22,
                ),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   icon: Image.asset(
              //     sellerController.selectedIndex.value == 1
              //         ? AppIcon.notificationFillIcon
              //         : AppIcon.notificationIcon,
              //     width: AppSize.appSize22,
              //   ),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  sellerController.selectedIndex.value == 3
                      ? AppIcon.historyIconFill
                      : AppIcon.historyIcon,
                  width: AppSize.appSize22,color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  sellerController.selectedIndex.value == 4
                      ? AppIcon.profileFillIcon
                      : AppIcon.profileIcon,
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
