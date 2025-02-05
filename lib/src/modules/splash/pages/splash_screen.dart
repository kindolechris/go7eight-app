import 'dart:ui';
import 'package:go7eight/src/core/reusableComponents/app_status_bar.dart';
import '../../../core/app_export.dart';
import '../../../core/constants/app_padding.dart';
import '../../../core/constants/app_spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define gradient colors for consistent use
    final List<Color> gradientColors = [
      Theme.of(context).brightness == Brightness.light
          ? AppColor.primary.withOpacity(0.1)
          : AppColor.primary.withOpacity(0.05),
      Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    ];

    return AppStatusBar(
      // Make status bar transparent to show gradient
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      // Make system navigation bar transparent to show gradient
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      child: Container(
        // Wrap everything in a container with the gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.transparent, // Make scaffold transparent
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                // Animated circles for background effect
                Positioned(
                  top: -Get.height * 0.2,
                  left: -Get.width * 0.2,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 2),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          height: Get.width * 0.8,
                          width: Get.width * 0.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primary.withOpacity(0.1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Content with backdrop filter
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.white.withOpacity(0.5)
                        : AppColor.black.withOpacity(0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppRatioSpaces.verticalSectionSpaceM(),
                        // Animated logo text
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 800),
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: const Text(
                                "Go7eight",
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primary,
                                  shadows: [
                                    BoxShadow(
                                      color: AppColor.primary,
                                      blurRadius: 20,
                                      spreadRadius: -5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        AppRatioSpaces.verticalSectionSpaceM(),
                        // Optional: Add a subtle loading indicator
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColor.primary.withOpacity(0.5),
                            ),
                            strokeWidth: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}