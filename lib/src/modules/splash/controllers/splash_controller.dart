
import 'dart:ui';
import 'package:get/get.dart';
import 'package:go7eight/src/modules/auth/views/login_or_sign_up_view/login_or_sign_up_view.dart';
import '../../../../main.dart';
import '../../../core/constants/app_constants.dart';
import '../../../theme/controller/theme_controller.dart';
import '../../auth/bindings/auth_binding.dart';
import '../../auth/views/login/login_view.dart';
import '../../onboarding/bindings/onBoarding_binding.dart';
import '../../onboarding/pages/onBoarding_view.dart';
import '../../panels/gym/root/bindings/root_binding.dart';
import '../../panels/gym/root/views/root_view.dart';
import '../../panels/student/root/bindings/root_binding.dart';
import '../../panels/student/root/views/root_view.dart';
import '../../panels/trainer/root/bindings/trainer_root_binding.dart';
import '../../panels/trainer/root/views/trainer_root_view.dart';


class SplashController extends GetxController {
  final ThemeController _themeController = Get.find();

  Future getLocaleData()async{
    Locale locale=await _themeController.getLocale();
    Get.updateLocale( locale);
  }

  @override
  void onReady() {
    super.onReady();
    getLocaleData().then((value) async {
      try{
        Future.delayed(const Duration(seconds: 3), () {
          if(storageInstance.hasData("isLogged")){
            Get.off(()=>StudentRootView(),binding: RootBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
          }else if(!storageInstance.hasData("launched")){
            Get.off(()=>const OnBoardingView(),binding: OnBoardingBinding(),duration: const Duration(milliseconds: 1500),transition: Transition.circularReveal);
          }else{
            Get.off(()=>const LoginOrSignUpView(),binding: AuthBinding(),duration: const Duration(milliseconds: 1500),transition: Transition.circularReveal);
          }
        });
      }catch(ex){
        print(ex.toString());
      }
    });
  }
}
