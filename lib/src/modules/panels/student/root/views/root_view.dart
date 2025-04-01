import 'package:go7eight/main.dart';
import 'package:go7eight/src/core/reusableComponents/app_status_bar.dart';
import 'package:go7eight/src/core/reusableComponents/bottom_nav_item.dart';
import 'package:go7eight/src/modules/auth/controllers/login_controller.dart';
import '../../../../../core/app_export.dart';
import '../controllers/root_controller.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class StudentRootView extends GetView<RootController> {
  final RxBool isBottomSheetVisible = false.obs; // Observable for bottom sheet visibility state
  final LoginController loginController = Get.put(LoginController());
  StudentRootView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print(storageInstance.read("didSetFingerPrint"));
      await Future.delayed(const Duration(seconds: 2));
      if(storageInstance.read("didSetFingerPrint") == false){
        if(!storageInstance.hasData("skipSettingFingerprint")){
          if(!isBottomSheetVisible.value){
            showBottomSheet(context);
          }
        }
      }
    });

    return AppStatusBar(
      systemNavigationBarColor: isBottomSheetVisible.value
          ? AppColor.white
          : Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: Brightness.light,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: PopScope(
            canPop: controller.onWillPop(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.primary,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Obx(() {
                    return Column(
                      children: [
                        Expanded(
                          child: controller.widgetOptions
                              .elementAt(controller.selectedIndex.value),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Obx(() {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.blackShade.withOpacity(0.05)
                        : AppColor.white.withOpacity(0.05),
                    spreadRadius: 1.5,
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  bottomNavItemX(context, iconPath: AppIcon.homeIcon),
                  bottomNavItemX(context, iconPath: AppIcon.analyticIcon),
                  bottomNavItemX(context, iconPath: AppIcon.addIcon),
                  bottomNavItemX(context, iconPath: AppIcon.messageIcon),
                  bottomNavItemX(context, iconPath: AppIcon.userProfileSettingIcon),
                ],
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.selectedIndex.value,
                selectedItemColor: AppColor.primary,
                unselectedItemColor: AppColor.grey,
                iconSize: 30,
                onTap: (index) {
                  if (index == 2) {
                    controller.pickImages();
                  }else{
                    controller.selectedIndex.value = index;
                  }
                },
                elevation: 0,
                backgroundColor: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                enableFeedback: true,
              ),
            );
          }),
        ),
      ),
    );
  }

  /// Show Bottom Sheet method
  void showBottomSheet(BuildContext context) async {
    isBottomSheetVisible.value = true; // Mark the sheet as visible
    _updateSystemNavigationBarColor(AppColor.white,Brightness.dark); // Update system navigation bar color

    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
          height: 300,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Use Fingerprint ?",
                        style: TextStyleX.header6(context),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        storageInstance.write("skipSettingFingerprint", true);
                      }, child: Text(
                        "Skip for now", style: TextStyleX.subHeading2(context).copyWith(
                        color: AppColor.primary,
                        fontSize: AppTextSizes.titleText8(),
                      ),
                      ))
                    ],
                  ),
                  AppRatioSpaces.verticalSectionSpaceM(),
                  const Icon(
                    Icons.fingerprint,
                    size: 60,
                    color: AppColor.primary,
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          "Use biometric login with your fingerprint for faster and easier access to your account",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppRatioSpaces.verticalSectionSpaceM(),
                    AppButton(text: "Set Up Fingerprint", action: () async {
                      Navigator.pop(context);
                      await loginController.setupBiometricAuthentication();
                    }, icon: const Icon(
                      Icons.fingerprint,
                      color: AppColor.white,
                    ),),
                  ],
                ),
              )
            ],
          )
        );
      },
    ).whenComplete(() {
      // Reset state when the bottom sheet is dismissed
      isBottomSheetVisible.value = false;
      _updateSystemNavigationBarColor(
        Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        Brightness.dark
      );
    });
  }

  /// Helper method to update system navigation bar color
  void _updateSystemNavigationBarColor(Color bgColor,Brightness iconBrightness ) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: bgColor,
        systemNavigationBarIconBrightness: iconBrightness,
      ),
    );
  }
}
