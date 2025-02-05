



import '../../../../../../core/app_export.dart';
import '../../controllers/employee_controller.dart';

class EmployeeFormWidget extends GetView<GYMEmployeeController>{
  const EmployeeFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _textEditField(context,
            label: "lbl_first_name",
            hint: "trainer_first_name_hint",
            textEditingController: controller
                .firstNameTextController,
            showError: controller.showFirstNameError.value,
            showSuffix: false,
            suffixWidget: Container()
        ),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        _textEditField(context,
            label: "lbl_last_name",
            hint: "trainer_last_name_hint",
            textEditingController: controller
                .lastNameTextController,
            showError: controller.showLastNameError.value,
            showSuffix: false,
            suffixWidget: Container()
        ),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        _textEditField(context,
            label: "lbl_email",
            hint: "trainer_email_hint",
            textEditingController: controller
                .emailTextController,
            showError: controller.showEmailError.value,
            showSuffix: false,
            suffixWidget: Container()
        ),

        AppRatioSpaces.verticalSectionSpaceXXS(),
        _textEditField(context,
            label: "trainer_temp_pass_lbl",
            hint: "trainer_temp_pass_hint",
            textEditingController: controller
                .passwordTextController,
            showError: controller.showPasswordError.value,
            showSuffix: false,
            suffixWidget: Container()
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
      ],
    );
  }
  Widget _textEditField(BuildContext context, {
    required String label, required String hint,
    required TextEditingController textEditingController,
    required bool showError,
    required bool showSuffix,
    Widget? suffixWidget
  }) {
    return AppTextField(
      labelText: label.tr,
      hintText: hint.tr,
      controller: textEditingController,
      showBoarder: true,
      shadowOpacity: 0,
      boarderColor: AppColor.boarderBlueGrey,
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showSuffixIcon: showSuffix,
      suffixWidget: suffixWidget,
    );
  }
}