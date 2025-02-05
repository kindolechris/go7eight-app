
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go7eight/src/localization/app_localization.dart';
import 'package:go7eight/src/modules/global/controllers/global_controller.dart';
import 'package:go7eight/src/modules/splash/bindings/splash_binding.dart';
import 'package:go7eight/src/routes/app_pages.dart';
import 'package:go7eight/src/theme/controller/theme_controller.dart';
import 'package:go7eight/src/theme/theme_data/theme.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/routes/app_routes.dart';
import 'dart:io' show Platform;

final storageInstance = GetStorage();
final globalController = Get.put(GlobalController());


void main() async {
  await GetStorage.init();
  //useWindowsSpecificFunctionality();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController(),permanent: true);
    return  GetMaterialApp(
      title: "Go7eight",
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRouteNames.initialRoute,
      getPages: AppRoutePages.pages,
      supportedLocales: const [Locale('ar','AE')],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialBinding:
      SplashBinding(),
      themeMode: themeController
          .themeStateFromHiveSettingBox,
      theme: ThemeX.lightTheme,
      darkTheme: ThemeX.darkTheme,
    );
  }
}
