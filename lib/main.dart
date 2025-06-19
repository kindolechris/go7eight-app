import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_string.dart';
import 'package:prime_social_media_flutter_ui_kit/translation/app_translation.dart';
import 'package:prime_social_media_flutter_ui_kit/views/splash/splash_screen.dart';

import 'controller/theme_controller.dart';
import 'controller/translation_controller.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage.init('cachedData');
  WidgetsFlutterBinding.ensureInitialized();
  await initTranslation();
  runApp(const MyApp());
}

Future<void> initTranslation() async {
  await Get.putAsync(() async => AppTranslations());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TranslationController translationController = Get.put(TranslationController());
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: AppString.primeSocialMedia,
      translations: AppTranslations(),
      locale: Locale(translationController.locale),
      fallbackLocale: const Locale(AppString.enText),

      // ✅ LIGHT THEME
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.light.backgroundColor,
        splashColor: AppColor.transparentColor,
        highlightColor: AppColor.transparentColor,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: AppSize.appSize0,
          backgroundColor: AppColor.light.backgroundColor,
          foregroundColor: AppColor.light.text1Color,
        ),
        cardColor: AppColor.light.cardBackgroundColor,
        textTheme:  TextTheme(
          bodyMedium: TextStyle(color: AppColor.light.text1Color),
        ),
      ),

      // ✅ DARK THEME
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.dark.backgroundColor,
        splashColor: AppColor.transparentColor,
        highlightColor: AppColor.transparentColor,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: AppSize.appSize0,
          backgroundColor: AppColor.dark.backgroundColor,
          foregroundColor: AppColor.dark.text1Color,
        ),
        cardColor: AppColor.dark.cardBackgroundColor,
        textTheme:  TextTheme(
          bodyMedium: TextStyle(color: AppColor.dark.text1Color),
        ),
      ),

      // ✅ System-based switching
      themeMode: themeController.themeMode.value,

      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
      defaultTransition: Transition.fade,
      getPages: AppRoutes.pages,

      // ✅ Use theme color instead of hardcoded one
      builder: (context, child) {
        final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
        return Container(
          color: backgroundColor,
          child: Center(
            child: Container(
              color: backgroundColor,
              width: kIsWeb ? AppSize.appSize800 : null,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
