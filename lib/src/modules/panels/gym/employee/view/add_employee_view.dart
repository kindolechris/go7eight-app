import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/bottom_nav_action.dart';
import 'package:go7eight/src/modules/panels/global_widgets/open_alert_box.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/employee_controller.dart';
import 'widgets/employee_form_widget.dart';
import 'widgets/employee_type_section_widget.dart';

class AddEmployeeView extends GetView<GYMEmployeeController> {
  const AddEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        appBar: fitnofyGeneralAppBar(context,
            showAddIcon: false, title: "add_trainer_title", showLeading: true),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceXXS(),
              const EmployeeTypeSelectionWidget(),
              AppRatioSpaces.verticalSectionSpaceM(),
              const EmployeeFormWidget()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavAction(
          actionText: "add_trainer_title",
          action: () {
            openAlertBox(
                context: context,
                title: "trainer_added_success_message",
                description: "",
                icon: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.green),
                      child: Icon(Icons.check,
                          color: AppColor.white,
                          size: AppRatioSize.getRatioHeight() / 24),
                    ),
                  ],
                ),
                buttonText: "back_to_home_lbl",
                buttonAction: () {
                  Navigator.pop(context);
                });
          },
        ),
      ),
    );
  }
}
