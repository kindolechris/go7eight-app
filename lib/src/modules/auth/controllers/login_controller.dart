
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:go7eight/src/core/constants/app_api_repsonse_code.dart';
import 'package:go7eight/src/data/dataSource/remote/google_auth_service.dart';
import 'package:go7eight/src/modules/auth/views/registration/registration_email_otp_verification_view.dart';
import 'package:go7eight/src/modules/auth/views/registration/registration_google_basic_info_view.dart';
import 'package:go7eight/src/modules/auth/views/registration/registration_phone_otp_verification_view.dart';
import 'package:go7eight/src/modules/panels/student/root/bindings/root_binding.dart';
import 'package:go7eight/src/modules/panels/student/root/views/root_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../main.dart';
import '../../../core/app_export.dart';
import '../../../data/dataSource/remote/auth.dart';
import '../../../models/auth_user_model.dart';
import '../bindings/auth_binding.dart';
import '../views/additional/foreget_password_view.dart';
import '../views/additional/reset_password_view.dart';
import '../views/additional/verification_code_view.dart';
import '../views/login/login_view.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

enum LoginInputType {
  phone,
  email,
}

enum PasswordResetMethod {
  phone,
  email,
}

class LoginController extends GetxController{
    Rx<TextEditingController> emailTextController = TextEditingController().obs;
    Rx<TextEditingController> passwordTextController = TextEditingController().obs;
    Rx<TextEditingController> phoneTextController = TextEditingController().obs;
    TextEditingController confirmPasswordTextController = TextEditingController();
    Rx<AuthUserModel> authUser = AuthUserModel().obs;
    AuthApiService authApiService = AuthApiService();
    GoogleAuthService googleAuthService = GoogleAuthService();
    TextEditingController oldPasswordTextController = TextEditingController();
    TextEditingController newPasswordTextController = TextEditingController();
    TextEditingController newConfirmPasswordTextController = TextEditingController();
    TextEditingController pinCodeTextController = TextEditingController();
    RxBool isUserSelected = true.obs;
    RxBool isAdminSelected = false.obs;
    RxBool isTrainerSelected = false.obs;
    RxBool isLoading = false.obs;
    var inputType = LoginInputType.email.obs;
    var passwordResetMethod = PasswordResetMethod.email.obs;
    RxBool passwordObscure = true.obs;
    RxBool confirmPasswordObscure = true.obs;
    RxString selectedDialCode = '+255'.obs;
    RxString googleAuthToken = ''.obs;
    RxBool canUseBiometric = false.obs;

    final LocalAuthentication auth = LocalAuthentication();
    RxList<BiometricType> availableBiometrics = <BiometricType>[].obs;
    Rx<BiometricType> biometricType = BiometricType.weak.obs;

    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );


    Future<void> canDeviceUseBiometric() async {
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      if(canAuthenticate){
        print("Can use biometric");
        canUseBiometric.value = true;
        storageInstance.write("canUseFingerPrint", true);
        if(!storageInstance.hasData("didSetFingerPrint")){
         storageInstance.write("didSetFingerPrint", false);
         print("Setting didSetFingerPrint to false");
        }else{
          print("Not setting didSetFingerPrint to false, user already set");
        }
      }
    }

    getBiometricLists() async {
       availableBiometrics.value = await auth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty) {
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          biometricType.value = BiometricType.fingerprint;
        }else if(availableBiometrics.contains(BiometricType.face)) {
          biometricType.value = BiometricType.face;
        }else if(availableBiometrics.contains(BiometricType.face)) {
          biometricType.value = BiometricType.face;
        }
      }
    }

    setupBiometricAuthentication() async {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate for initial setup',
            options: const AuthenticationOptions(useErrorDialogs: false));
        if(didAuthenticate){
          SnackBarX.showSuccess(title: "Success", message: "Finger print setup successfully");
          print("User authenticated with biometric");
          storageInstance.write("didSetFingerPrint", true);
        }else{
          print("User did not authenticated with biometric");
          storageInstance.write("didSetFingerPrint", false);
        }
      } on PlatformException catch (e) {
        if (e.code == auth_error.notEnrolled) {
          print(e.toString());
        } else if (e.code == auth_error.lockedOut ||
            e.code == auth_error.permanentlyLockedOut) {
          print(e.toString());
        } else {
          print(e.toString());
        }
      }
    }

    authenticateWithBiometric() async {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please scan your fingerprint to login to Go7eight',
            options: const AuthenticationOptions(useErrorDialogs: false));
        if(didAuthenticate){
          bool success =  await loginClick(storageInstance.read("username"), storageInstance.read("password"));
          if(success){
            Get.off(()=>StudentRootView(),binding: RootBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
            await Future.delayed(const Duration(milliseconds: 800));
            setLoading(false);
          }
        }else{
          print("User cancelled authenticating with biometric");
        }
      } on PlatformException catch (e) {
        if (e.code == auth_error.notEnrolled) {
          print(e.toString());
        } else if (e.code == auth_error.lockedOut ||
            e.code == auth_error.permanentlyLockedOut) {
          print(e.toString());
        } else {
          print(e.toString());
        }
      }
    }

    Future<void> signOutGoogle() async {
      await _googleSignIn.signOut();
      // Clear local storage, state, etc.
    }

    Future<bool> loginWithGoogle(accessToken) async {
      isLoading.value = true;
      var payload = {
        "username" : "google",
        "password" : "google",
        "grant_type" : "password",
        "googleAccessToken" : accessToken,
      };
      var response = await authApiService.loginUser(payload);
      if(response.code == AppResponseCode.SUCCESS){
        storageInstance.write("accessToken", response.data['access_token']);
        storageInstance.write("expiresAt", response.data['expires_in']);
        var customerResponse = await authApiService.getCustomerLogged();
        if(customerResponse.code == AppResponseCode.SUCCESS){
          storageInstance.write("customer", jsonEncode(customerResponse.data));
          Get.off(()=>StudentRootView(),binding: RootBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
          await Future.delayed(const Duration(milliseconds: 800));
          setLoading(false);
          return true;
        }
        setLoading(false);
        return false;
      }else if(response.code == 401){
        SnackBarX.showError(
            title: "Failure",
            message: response.message);
        setLoading(false);
        return false;
      }
      setLoading(false);
      return false;
    }

    authenticateWithGoogle() async {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null){
        isLoading.value = false;
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      var response = await authApiService.checkUser(googleUser.email, "EMAIL", "GOOGLE");
      if(response.code == AppResponseCode.SUCCESS){
        if(response.data['authenticationMethod'] == "GOOGLE"){
          storageInstance.write("googleAccessToken", googleAuth.accessToken!);
          googleAuthToken.value = googleAuth.accessToken!;
          loginWithGoogle(googleAuth.accessToken!);
        }else{
          SnackBarX.showWarning(
              title: "Info",
              message: response.message);
          isLoading.value = false;
        }
      }

      if(response.code == AppResponseCode.FAILURE){
        SnackBarX.showWarning(
            title: "Info",
            message: response.message);
        isLoading.value = false;
      }

      if(response.code == AppResponseCode.RECORD_DOES_NOT_EXISTS){
        storageInstance.write("googleAccessToken", googleAuth.accessToken!);
        googleAuthToken.value = googleAuth.accessToken!;
        Get.to(()=> RegistrationGoogleBasicInfoView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
        isLoading.value = false;
      }

    }

    setDialCode(value){
      selectedDialCode.value = value;
    }

    void switchToPhone() {
      inputType.value = LoginInputType.phone;
    }

    void switchToEmail() {
      inputType.value = LoginInputType.email;
    }

    void setResetToEmail() {
      passwordResetMethod.value = PasswordResetMethod.email;
    }

    void setResetToPhone() {
      passwordResetMethod.value = PasswordResetMethod.phone;
    }

    @override
    void onInit() {
      onUserSelection();
      canDeviceUseBiometric();
      super.onInit();
    }


    void setLoading(value) {
      isLoading.value = value;
    }


  changeObscure(){
        passwordObscure.value=!passwordObscure.value;
    }
    changeConfirmPasswordObscure(){
        confirmPasswordObscure.value=!confirmPasswordObscure.value;
    }

    Future<void> signUpClick() async {
      storageInstance.write("identifier", inputType.value == LoginInputType.email ? "email" : "phone");
      setLoading(true);
      var response = await authApiService.checkUser(storageInstance.read("identifier") == "email" ?
      emailTextController.value.text :
      phoneTextController.value.text.startsWith("0") ? selectedDialCode+phoneTextController.value.text.substring(1) :
      selectedDialCode+phoneTextController.value.text,storageInstance.read("identifier") == "email" ? "EMAIL" : "PHONE_NUMBER", "NORMAL");
        if(response.code == AppResponseCode.SUCCESS){
          Get.to(()=> const LoginView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
        }else if(response.code == AppResponseCode.RECORD_DOES_NOT_EXISTS){
          if(storageInstance.read("identifier") == "email"){
            storageInstance.write("email", emailTextController.value.text);
            Get.to(()=> const RegistrationEmailOtpVerification(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
          }else{
            storageInstance.write("phone", phoneTextController.value.text.startsWith("0") ? selectedDialCode+phoneTextController.value.text.substring(1) : selectedDialCode+phoneTextController.value.text);
            print(storageInstance.read("phone"));
            Get.to(()=> const RegistrationPhoneOtpVerification(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
          }
        }else{
          SnackBarX.showError(
              title: "Failure",
              message: response.message);
        }
       setLoading(false);
    }


    void loginContinueClick() {
      Get.to(()=> const LoginView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }

    Future<bool> loginClick(username,password) async {
      try{
        setLoading(true);
        var payload = {
          "username" : username,
          "password" : password,
          "grant_type" : "password"
        };
        var response = await authApiService.loginUser(payload);
        if(response.code == AppResponseCode.SUCCESS){
          storageInstance.write("username", username);
          storageInstance.write("password", password);
          storageInstance.write("accessToken", response.data['access_token']);
          storageInstance.write("expiresAt", response.data['expires_in']);
          var customerResponse = await authApiService.getCustomerLogged();
          if(customerResponse.code == AppResponseCode.SUCCESS){
            storageInstance.write("isLogged",true);
            storageInstance.write("customer", jsonEncode(customerResponse.data));
            return true;
          }
          setLoading(false);
          return false;
        }else if(response.code == 401){
          SnackBarX.showError(
              title: "Failure",
              message: response.message);
          setLoading(false);
          return false;
        }else{
          SnackBarX.showError(
              title: "Failure",
              message: response.message);
          setLoading(false);
          return false;
        }
     }catch(ex) {
        SnackBarX.showError(
            title: "Failure",
            message: ex.toString());
        setLoading(false);
        return false;
      }
    }
    void forgotPasswordClick() {
        Get.to(()=>const ForgotPasswordView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }

    void sendCodeClick() {
        Get.to(()=>const VerificationCodeView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }

    void confirmCodeClick() {
        Get.to(()=>const ResetPasswordView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }
    void onClickResend() {
        }

    void onClickChangePassword() {
        Get.to(()=>const LoginView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);

    }
    void onClickAuthChangePassword() {
        Get.back();
    }

    onUserSelection(){
        isAdminSelected.value=false;
        isTrainerSelected.value=false;
        isUserSelected.value=true;
        emailTextController.value.text= storageInstance.read("user_email") ?? "";
    }
    onAdminSelection(){
        isAdminSelected.value=true;
        isTrainerSelected.value=false;
        isUserSelected.value=false;
        emailTextController.value.text= storageInstance.read("admin_email") ?? "";
    }
    onTrainerSelection(){
        isAdminSelected.value=false;
        isTrainerSelected.value=true;
        isUserSelected.value=false;
        emailTextController.value.text= storageInstance.read("trainer_email") ?? "";
    }
}