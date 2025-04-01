

import 'dart:convert';
import 'dart:math';

import 'package:go7eight/src/core/constants/app_api_repsonse_code.dart';
import 'package:go7eight/src/core/constants/app_constants.dart';
import 'package:go7eight/src/core/reusableComponents/app_custom_toast.dart';
import 'package:go7eight/src/modules/auth/views/registration/registration_google_basic_info_view.dart';
import 'package:go7eight/src/modules/auth/views/registration/registration_nickname_password_view.dart';

import '../../../../main.dart';
import '../../../core/app_export.dart';
import '../../../data/dataSource/local/user_type_data.dart';
import '../../../data/dataSource/remote/auth.dart';
import '../../../models/country_model.dart';
import '../../../models/user.dart';
import '../../global/bindings/global_binding.dart';
import '../../global/views/countries_view.dart';
import '../../panels/gym/root/bindings/root_binding.dart';
import '../../panels/gym/root/views/root_view.dart';
import '../../panels/student/preference/bindings/preference_binding.dart';
import '../../panels/student/preference/views/preference_view.dart';
import '../../panels/student/root/bindings/root_binding.dart';
import '../../panels/student/root/views/root_view.dart';
import '../bindings/auth_binding.dart';
import '../views/login/login_view.dart';
import '../views/registration/registration_basic_info_view.dart';
import 'login_controller.dart';

class RegistrationController extends GetxController{

  TextEditingController emailTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController pinCodeTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  Rx<TextEditingController> dateOfBirthTextController = TextEditingController().obs;
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController(text: storageInstance.hasData("email") ? storageInstance.read("phone") : "");
  Rx<TextEditingController> countryTextController = TextEditingController().obs;
  Rx<TextEditingController> googleCountryTextController = TextEditingController().obs;
  Rx<TextEditingController> gooleDateOfBirthTextController = TextEditingController().obs;
  Rx<TextEditingController> googleNickNameTextController = TextEditingController().obs;
  Rx<TextEditingController> phoneTextController = TextEditingController(text: storageInstance.hasData("phone") ? storageInstance.read("phone") : "").obs;
  RxList<UserTypeModel> userTypes = <UserTypeModel>[].obs;
  RxBool passwordObscure = true.obs;
  RxBool confirmPasswordObscure = true.obs;
  RxBool isLoading = false.obs;

  var isForm1Valid = false.obs;
  var isForm2Valid = false.obs;
  var isGoogleFormValid = false.obs;

  final loginController = Get.put(LoginController());

  AuthApiService authApiService = AuthApiService();

  void updateForm1Validity() {
    isForm1Valid.value =
        firstNameTextController.text.isNotEmpty &&
            lastNameTextController.text.isNotEmpty &&
            countryTextController.value.text.isNotEmpty &&
            dateOfBirthTextController.value.text.isNotEmpty;
  }

  void updateForm2Validity() {
    isForm2Valid.value =
        nickNameTextController.text.isNotEmpty &&
            passwordTextController.text.isNotEmpty &&
            confirmPasswordTextController.value.text.isNotEmpty;
  }

  void updateGoogleFormValidity() {
    isGoogleFormValid.value =
        googleNickNameTextController.value.text.isNotEmpty &&
            gooleDateOfBirthTextController.value.text.isNotEmpty &&
            googleCountryTextController.value.text.isNotEmpty;
  }

  void setLoading(value) {
    isLoading.value = value;
  }

  @override
  void onInit() {
    userTypes.value=getUserTypeData();
    super.onInit();
    //setPresetFields();
    // Attach listeners to update form validity
    firstNameTextController.addListener(updateForm1Validity);
    lastNameTextController.addListener(updateForm1Validity);
    countryTextController.value.addListener(updateForm1Validity);
    dateOfBirthTextController.value.addListener(updateForm1Validity);

    nickNameTextController.addListener(updateForm2Validity);
    passwordTextController.addListener(updateForm2Validity);
    confirmPasswordTextController.addListener(updateForm2Validity);

    googleCountryTextController.value.addListener(updateGoogleFormValidity);
    googleNickNameTextController.value.addListener(updateGoogleFormValidity);
    gooleDateOfBirthTextController.value.addListener(updateGoogleFormValidity);
  }

  setPresetFields(){
    emailTextController.text = storageInstance.hasData("email") ? storageInstance.read("email") : "";
    phoneTextController.value.text = storageInstance.hasData("phone") ? storageInstance.read("phone") : "";
    update();
  }

  changePasswordObscure(){
    passwordObscure.value=!passwordObscure.value;
  }
  changeConfirmPasswordObscure(){
    confirmPasswordObscure.value=!confirmPasswordObscure.value;
  }

  onUserTypeSelection(UserTypeModel userType){
    List<UserTypeModel> tempUserType = <UserTypeModel>[];
    for(var user in userTypes){
      if(user==userType){
        user.isSelected=true;
      }else{
        user.isSelected=false;
      }
      tempUserType.add(user);
    }
    userTypes.value=tempUserType;
  }

  void registerUser() async {
   try{
      var newUser = Customer(
        firstName: firstNameTextController.text,
        lastName: lastNameTextController.text,
        country: countryTextController.value.text,
        phone: storageInstance.hasData("phone") ? storageInstance.read("phone") : "",
        address: addressTextController.text,
        dateOfBirth: dateOfBirthTextController.value.text,
        username: storageInstance.read("identifier") == "email" ? storageInstance.read("email") : storageInstance.read("phone"),
        nickName: nickNameTextController.text,
        password: passwordTextController.text,
        email: storageInstance.hasData("email") ? storageInstance.read("email") : "",
        registrationRef: storageInstance.read("registrationRef"),
      );
      print(newUser.toJson());
      setLoading(true);
      var response =  await authApiService.register(newUser);
      if(response.code == AppResponseCode.SUCCESS){
        //print(response.data);
        storageInstance.write("customer", response.data);
        if(storageInstance.read("identifier") == "email"){
          loginController.switchToEmail();
        }else{
          loginController.switchToPhone();
        }
        var success = await loginController.loginClick(storageInstance.read("identifier") == "email" ? newUser.email : newUser.phone, newUser.password);
        if(success){
          CustomToast.showToast(
            "Your account was registered successfully.",
            duration: const Duration(seconds: 5), // How long it stays visible
            animationDuration: const Duration(milliseconds: 400), // Slower animation
          );
          Get.offAll(()=>StudentRootView(),binding: RootBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
          loginController.setLoading(false);
        }else{
          CustomToast.showToast(
            "Your account was registered successfully,you may proceed to login",
            duration: const Duration(seconds: 5), // How long it stays visible
            animationDuration: const Duration(milliseconds: 400), // Slower animation
          );
          Get.offAll(()=> const LoginView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
          loginController.setLoading(false);
        }
       await Future.delayed(Duration(milliseconds: 900));
       setLoading(false);
      }else{
        CustomToast.showToast(
          response.message.toString(),
          duration: const Duration(seconds: 5), // How long it stays visible
          animationDuration: const Duration(milliseconds: 400), // Slower animation
        );
        setLoading(false);
      }
    }catch(ex){
     CustomToast.showToast(
       ex.toString(),
       duration: const Duration(seconds: 5), // How long it stays visible
       animationDuration: const Duration(milliseconds: 400), // Slower animation
     );
      setLoading(false);
    }
  }

  Future<bool> registerWithGoogle() async {
    isLoading.value = true;
    var payload = {
      "username" : "google",
      "password" : "google",
      "grant_type" : "password",
      "googleAccessToken" : storageInstance.read("googleAccessToken"),
      "phoneNumber" : "",
      "dob" : gooleDateOfBirthTextController.value.text,
      "country" : googleCountryTextController.value.text,
      "nickname" : googleNickNameTextController.value.text,
    };
    var response = await authApiService.loginUser(payload);
    if(response.code == AppResponseCode.SUCCESS){
      storageInstance.write("accessToken", response.data['access_token']);
      storageInstance.write("expiresAt", response.data['expires_in']);
      var customerResponse = await authApiService.getCustomerLogged();
      if(customerResponse.code == AppResponseCode.SUCCESS){
        storageInstance.write("customer", jsonEncode(customerResponse.data));
        Get.to(()=> StudentRootView(),binding: RootBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
        storageInstance.write("isLogged",true);
        await Future.delayed(const Duration(milliseconds: 800));
        setLoading(false);
        return true;
      }
      setLoading(false);
      return false;
    }else if(response.code == 401){
      CustomToast.showToast(
        response.message,
        duration: const Duration(seconds: 5), // How long it stays visible
        animationDuration: const Duration(milliseconds: 400), // Slower animation
      );
      setLoading(false);
      return false;
    }
    setLoading(false);
    return false;
  }

  onFinalClick() async {
    try{
      setLoading(false);
    }catch(ex){
      CustomToast.showToast(
        ex.toString(),
        duration: const Duration(seconds: 5), // How long it stays visible
        animationDuration: const Duration(milliseconds: 400), // Slower animation
      );
      setLoading(false);
    }
  }

  Future<String> onCountryClick() async {
    var data = await Get.to(()=>const CountryPickerView(),binding: GlobalBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    if(data !=null && data !=""){
      var countryModel = (data as CountryModel);
      return countryModel.name.toString();
    }
    return "";
  }

  onRegistrationNext(){
    Get.to(()=> RegistrationBasicInfoView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
  }

  onNickNamePinNext(){
    Get.to(()=> RegistrationNicknamePasssowrdView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
  }

  onRegistrationBack(){
    Get.off(()=> RegistrationBasicInfoView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
  }

  onVerifyPhoneOtpClick(otp) async {
    setLoading(true);
    var response = await authApiService.verifyPhone(storageInstance.read("phone"), otp);
    if(response.code == AppResponseCode.SUCCESS){
      setLoading(false);
      print(response.data);
      storageInstance.write("registrationRef", response.data['registrationRef']);
      Get.off(()=> RegistrationBasicInfoView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }else{
      setLoading(false);
      CustomToast.showToast(
        response.message,
        duration: const Duration(seconds: 5), // How long it stays visible
        animationDuration: const Duration(milliseconds: 400), // Slower animation
      );
    }
  }

  onVerifyEmailOtpClick(otp) async {
    setLoading(true);
    var response = await authApiService.verifyEmail(storageInstance.read("email"), otp);
    if(response.code == AppResponseCode.SUCCESS){
      setLoading(false);
      storageInstance.write("registrationRef", response.data['registrationRef']);
      Get.off(()=> RegistrationBasicInfoView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }else{
      setLoading(false);
      CustomToast.showToast(
        response.message,
        duration: const Duration(seconds: 5), // How long it stays visible
        animationDuration: const Duration(milliseconds: 400), // Slower animation
      );
    }
  }

  onLoginClick(){
    Get.off(()=>const LoginView(),binding: AuthBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
  }
  onSignUpClick(){
    if(_fieldValidation()){
      Get.to(()=>const PreferenceView(),binding: PreferenceBinding(),duration: const Duration(milliseconds: 400),transition: Transition.fadeIn);
    }
  }
  _fieldValidation(){
    if(_formEmptyValidation()){
      if(_emailValidation() && _passwordValidation()){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }
  _formEmptyValidation(){
    if(emailTextController.text.isEmpty && passwordTextController.text.isEmpty){
      SnackBarX.showError(title: "registration_validation_snack_title", message: "registration_validation_snack_message");
      return false;
    }else{
      return true;
    }
  }
  _emailValidation(){
    if(!emailTextController.text.isEmail){
      SnackBarX.showError(title: "email_validation_snack_title", message: "email_validation_snack_message");
      return false;
    }else{
      return true;
    }
  }
  _passwordValidation(){
    if(passwordTextController.text.length<6){
      SnackBarX.showError(title: "password_validation_snack_title", message: "password_validation_snack_message");
      return false;
    }else{
      if(passwordTextController.text!=confirmPasswordTextController.text){
        SnackBarX.showError(title: "password_mismatch_snack_title", message: "password_mismatch_snack_message");
        return false;
      }else{
        return true;
      }
    }
  }

  confirmCodeClick(){

  }

  onClickResend(){

  }

  onNextClick(){
    Get.to(() =>  RegistrationBasicInfoView(), binding: AuthBinding(),
        duration: const Duration(milliseconds: 600),
        transition: Transition.circularReveal);
  }

}
