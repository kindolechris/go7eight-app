import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/search/page/widget/filter_bottom_sheet.dart';

import '../../controllers/meal_controller.dart';

class MealSearchWidget extends GetView<MealController> {
  const MealSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: AppTextField(
              controller: controller.searchMealTextController,
              showLabel: false,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.grey.withOpacity(0.15)
                  : AppColor.blackShade,
              hintText: "Search here",
              showBoarder: false,
              boarderRadius: 12,
              showPrefixIcon: true,
              showSuffixIcon: false,
              shadowOpacity: 0,
              prefixIcon: Icons.search_rounded,
              labelColor: Colors.transparent,
              prefixIconColor: AppColor.primary,
              onSubmit: (value) {
                controller.addItemToRecentSearch(value);
              },
            ),
          ),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return const FilterBottomSheet();
                  },
                );
              },
              child: Container(
                width: AppRatioSize.getRatioWidth() / 9,
                height: AppRatioSize.getRatioWidth() / 9,
                // margin: EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 88),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary
                      : AppColor.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(AppIcon.filterIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
