

import '../../../core/app_export.dart';
import '../../../core/constants/app_padding.dart';
import '../../../core/constants/app_spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../controllers/splash_controller.dart';

class SplashScreenCopy extends GetView<SplashController>{
  const SplashScreenCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: AppPaddings.splashLogo(),
                  child: const Divider(color: AppColor.primary,thickness: 2.5,)),
                  AppRatioSpaces.verticalSectionSpaceM(),
                  Image.asset(
                    Theme
                        .of(context)
                        .brightness == Brightness.light
                        ?  AppImage.logoDark: AppImage.logoLight,
                    scale: 0.3,
                    fit: BoxFit.cover,
                  ),
                  AppRatioSpaces.verticalSectionSpaceM(),
                  Container(
                      padding: AppPaddings.splashLogo(),
                      child: const Divider(color: AppColor.primary,thickness: 2.5,)),
                ],
              ),
            )
        )
    );
  }

}
