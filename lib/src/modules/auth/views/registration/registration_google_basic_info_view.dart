
import 'package:go7eight/main.dart';
import 'package:go7eight/src/core/reusableComponents/app_country_code_picker.dart';
import 'package:go7eight/src/core/reusableComponents/app_date_picker.dart';
import 'package:go7eight/src/core/reusableComponents/app_progress_indicator.dart';
import 'package:go7eight/src/core/reusableComponents/app_will_pop_scope.dart';
import 'package:go7eight/src/models/user.dart';
import 'package:go7eight/src/modules/auth/views/widget/auth_bottom_option_section_terms.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_export.dart';
import '../../../../core/reusableComponents/app_drop_down_text.dart';
import '../../controllers/registration_controller.dart';
import '../widget/auth_title_section.dart';

class RegistrationGoogleBasicInfoView extends GetView<RegistrationController> {
  RegistrationGoogleBasicInfoView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light ? AppColor.offWhite : AppColor
            .blackShade,
        appBar: appBarWithBackButton(

        ),
        body: Obx((){
          return SafeArea(
            child: !controller.isLoading.value ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppRatioSpaces.appbarToTitle(),
                        const AuthTitleSection(
                          titleText: "Almost done!",
                          subtitleText: "Fill in your extra details to continue",
                        ),
                        AppRatioSpaces.titleToNext(),
                        _formSectionTwo(context),
                        AppRatioSpaces.verticalSectionSpaceXXL(),
                      ],
                    ),
                  ),
                ),
              ),
            ) :  const Center(child: AppProgressIndicator()),
          );
        }),
        bottomNavigationBar: _bottomNavBarButton(),
      ),
    );
  }

  _formSectionTwo(BuildContext context){
    return Column(
      children: [
        _nickNameField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _dobField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _countryField(context),
        AppRatioSpaces.verticalSectionSpaceMF(),
      ],
    );
  }

  Widget _nickNameField(BuildContext context) {
    return AppTextField(
      labelText: "Nickname",
      hintText: "Enter your nickname",
      showHintFormat: false,
      textInputType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nick name field is required';
        }
        return null;
      },
      controller: controller.googleNickNameTextController.value,
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

  Widget _countryField(BuildContext context) {
    return Obx(() {
      return AppDropDownTextField(
        labelText: "Country",
        hintText: "Enter your country",
        controller: controller.googleCountryTextController.value,
        readOnly: true,
        showSuffixIcon: true,
        suffixIcon: Icons.arrow_drop_down,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Country field is required';
          }
          return null;
        },
        onClick: () async {
         var data = await controller.onCountryClick();
         controller.googleCountryTextController.value.text = data;
        },
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  Widget _dobField(BuildContext context) {
    return Obx(() {
      return AppDropDownTextField(
        labelText: "Date of birth",
        hintText: "Choose your date of birth",
        controller: controller.gooleDateOfBirthTextController.value,
        readOnly: true,
        showSuffixIcon: true,
        suffixIcon: Icons.calendar_month,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Date of field is required';
          }
          return null;
        },
        onClick: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now().subtract(Duration(
              days: 365 * 13,
            )),
            firstDate: DateTime(1900),
            lastDate: DateTime.now().subtract(Duration(
              days: 365 * 13,
            )),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColor.primary, // header background color
                    onPrimary: Colors.white, // header text color
                    onSurface: Colors.black, // body text color
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColor.primary,
                        textStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        )
                    ),
                  ),
                ),
                child: child!,
              );
            },
            locale: Locale('en', 'US'),
          );
          if(pickedDate != null){
            controller.gooleDateOfBirthTextController.value.text = pickedDate!.toIso8601String().substring(0,10);
          }
        },
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
      );
    });
  }

  _bottomNavBarButton(){
    return SafeArea(
      child: Container(
        margin: AppPaddings.bottomBarButton(),
        child: Hero(
            tag: "auth_button",
            child: Obx((){
              return Visibility(
                visible: !controller.isLoading.value,
                child: AppButton(
                  action: (){
                    if (formKey.currentState!.validate()) {
                      controller.registerWithGoogle();
                    }
                  },
                  text: "Finish",
                  fontSize: AppTextSizes.headerText(),
                  buttonWidth: double.infinity,
                  boarderRadius: 8,
                  enabled: controller.isGoogleFormValid.value,
                ),
              );
            })
        ),
      ),
    );
  }
}