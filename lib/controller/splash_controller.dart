import 'dart:async';
import 'package:get/get.dart';

import '../config/local_storage.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 6), () {
      // Navigate to the login view after 4 seconds
      navigateToLoginView();
    });
  }

  void navigateToLoginView() {
    if (cachedData.read('isLoggedIn') == true) {
      Get.offAllNamed(AppRoutes.welcomeView);
    } else {
      if (cachedData.read('firstTime') == null) {
        Get.offAllNamed(AppRoutes.getStarted);
      } else {
        Get.offAllNamed(AppRoutes.loginView);
      }
    }
  }
}
