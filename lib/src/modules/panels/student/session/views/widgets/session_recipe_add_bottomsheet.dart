import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/session_controllers.dart';
import 'bottomsheet_calender_widget.dart';
import 'add_recipe_meal_selection_widget.dart';

class RecipeAddBottomSheet extends GetView<SessionController> {
  const RecipeAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          _headerWidget(context),
          AppRatioSpaces.verticalSectionSpaceM(),
          const BottomsheetCalenderWidget(),
          const AddRecipeMealSelectionWidget(),
          AppRatioSpaces.verticalSectionSpaceXS(),
          _bottomAddButtonWidget(context),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 60,
            width: Get.width,
            alignment: Alignment.center,
            child: Text(
              "add_to_meal_plan_lbl".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading1(context).copyWith(
                fontSize: AppTextSizes.titleText5(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.centerRight,
                margin:
                    EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 32),
                child: Icon(
                  Icons.close,
                  size: AppRatioSize.getRatioWidth() / 16,
                )),
          )
        ],
      ),
    );
  }

  Widget _bottomAddButtonWidget(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: AppButton(
        action: () {
          Navigator.pop(context);
          SnackBarX.showSuccess(
              title: "meal_add_title", message: "recipe_add_message");
        },
        text: "add_lbl",
      ),
    );
  }
}
