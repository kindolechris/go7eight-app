import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final storage = GetStorage('cachedData');

  @override
  void onInit() {
    final stored = storage.read('themeMode');
    if (stored is String &&
        ThemeMode.values.any((e) => e.toString() == stored)) {
      themeMode.value =
          ThemeMode.values.firstWhere((e) => e.toString() == stored);
      Get.changeThemeMode(themeMode.value);
    }
    super.onInit();
  }

  void toggleTheme(bool isLight) {
    themeMode.value = isLight ? ThemeMode.light : ThemeMode.dark;
    storage.write('themeMode', themeMode.value.toString());
    Get.changeThemeMode(themeMode.value);
  }

  bool get isLightMode => themeMode.value == ThemeMode.light;
}
