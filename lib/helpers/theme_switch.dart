import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/theme_controller.dart';

import '../config/app_color.dart';
import '../config/app_size.dart';
import 'theme_helper.dart';

Widget buildLightModeSwitch() {
  final themeController = Get.find<ThemeController>();

  return Obx(() => Column(
        children: [
          ListTile(
            leading:  Icon(
              Icons.brightness_2,
              color: themedColor(Get.context!, (c) => c.text2Color),
              size: AppSize.appSize20,
            ),
            title:  Text(
              'Light Mode',
              style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color), fontSize: AppSize.appSize15),
            ),
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: themeController.isLightMode,
                onChanged: (bool value) {
                  themeController.toggleTheme(value);
                },
                activeColor: AppColor.supportColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: themedColor(Get.context!, (c) => c.lineColor),
              thickness: 1,
              height: 1,
            ),
          ),
        ],
      ));
}
