
import 'package:go7eight/main.dart';
import 'package:go7eight/src/core/reusableComponents/app_bottom_sheet_country_picker.dart';
import 'package:go7eight/src/core/reusableComponents/app_date_picker.dart';
import 'package:go7eight/src/models/user.dart';
import 'package:go7eight/src/modules/auth/views/widget/auth_bottom_option_section_terms.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_export.dart';
import '../../../../core/reusableComponents/app_drop_down_text.dart';
import '../../controllers/registration_controller.dart';
import '../widget/auth_title_section.dart';

class RegistrationBasicInfoView extends GetView<RegistrationController> {
  RegistrationBasicInfoView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.setPresetFields();
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light ? AppColor.offWhite : AppColor
          .blackShade,
      appBar: appBarWithBackButton(

      ),
      body: SafeArea(
        child: SizedBox(
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
                      titleText: "Finish Signing up!",
                      subtitleText: "Fill in below details to complete your sign up",
                    ),
                    AppRatioSpaces.titleToNext(),
                    _formSectionTwo(context),
                    AppRatioSpaces.verticalSectionSpaceXXL(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavBarButton(),
    );
  }

  _formSectionTwo(BuildContext context){
    return Column(
      children: [
        _firstNameField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _lastNameField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _countryField(context),
        AppRatioSpaces.verticalSectionSpaceXS(),
        _dobField(context),
        Visibility(
          visible: storageInstance.read("identifier") == "email",
          child: Column(
            children: [
              AppRatioSpaces.verticalSectionSpaceXS(),
              _email(context),
            ],
          )
        ),
        Visibility(
          visible: storageInstance.read("identifier") == "phone",
          child: Column(
            children: [
              AppRatioSpaces.verticalSectionSpaceXS(),
              _phone(context),
            ],
          ),
        ),
        AppRatioSpaces.verticalSectionSpaceMF(),
        AuthBottomOptionSectionTerms(
          preText: "terms_and_conditions_description",
          onTermsAndPrivacyTap: () {},
        ),
        AppRatioSpaces.verticalSectionSpaceMF(),
      ],
    );
  }

  Widget _firstNameField(BuildContext context) {
    return AppTextField(
      labelText: "First name",
      hintText: "Enter your first name",
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller.firstNameTextController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'First name field is required';
        }
        return null;
      },
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

  Widget _lastNameField(BuildContext context) {
    return AppTextField(
      labelText: "Last name",
      hintText: "Enter your last name",
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      controller: controller.lastNameTextController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Last name field is required';
        }
        return null;
      },
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

  Widget _email(BuildContext context) {
    return AppTextField(
      labelText: "Email",
      hintText: "Enter your email",
      hintFormatText: "Verified",
      showHintFormat: true,
      textInputType: TextInputType.emailAddress,
      controller: controller.emailTextController,
      showSuffixIcon: true,
      enabled: false,
      suffixWidget: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.check_circle,
          color: AppColor.green,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email field is required';
        }
        return null;
      },
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
    );
  }

  Widget _phone(BuildContext context) {
    return AppTextField(
      labelText: "Phone",
      hintText: "Enter your phone",
      hintFormatText: "Verified",
      showHintFormat: true,
      controller: controller.phoneTextController.value,
      showSuffixIcon: true,
      enabled: false,
      suffixWidget: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.check_circle,
          color: AppColor.green,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone field is required';
        }
        return null;
      },
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
        controller: controller.countryTextController.value,
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
         controller.countryTextController.value.text = data;
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
        controller: controller.dateOfBirthTextController.value,
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
            controller.dateOfBirthTextController.value.text = pickedDate!.toIso8601String().substring(0,10);
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
            return AppButton(
              action: (){
                if (formKey.currentState!.validate()) {
                  controller.onNickNamePinNext();
                }
              },
              isLoading: controller.isLoading.value,
              text: "Agree and Continue",
              fontSize: AppTextSizes.headerText(),
              buttonWidth: double.infinity,
              boarderRadius: 8,
              enabled: controller.isForm1Valid.value,
            );
          })
        ),
      ),
    );
  }

}