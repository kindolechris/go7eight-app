

import '../../../../../../core/app_export.dart';
import '../../controllers/employee_controller.dart';
import 'employee_type_widget.dart';

class EmployeeTypeSelectionWidget extends GetView<GYMEmployeeController>{
  const EmployeeTypeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: AppRatioSize.getRatioHeight() / 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmployeeTypeCard(
              action: () {
                controller.onUserTypeSelection(
                    controller.userTypes[0]);
              },
              userType: controller.userTypes[0],
              isSelected: controller.userTypes[0].isSelected,
            ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            EmployeeTypeCard(
              action: () {
                controller.onUserTypeSelection(
                    controller.userTypes[1]);
              },
              userType: controller.userTypes[1],
              isSelected: controller.userTypes[1].isSelected,
            ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            EmployeeTypeCard(
              action: () {
                controller.onUserTypeSelection(
                    controller.userTypes[2]);
              },
              userType: controller.userTypes[2],
              isSelected: controller.userTypes[2].isSelected,
            )
          ],
        ),
      );
    });
  }



}