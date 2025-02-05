import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/search/controller/search_controller.dart';
import 'package:go7eight/src/modules/panels/global_widgets/option_widget.dart';

class FilterBottomSheet extends GetView<FitnofySearchController> {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 1.4,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                    "filter_lbl".tr,
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
                      margin: EdgeInsets.only(
                          right: AppRatioSize.getRatioWidth() / 32),
                      child: Icon(
                        Icons.close,
                        size: AppRatioSize.getRatioWidth() / 16,
                      )),
                )
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
          OptionWidget(
            filterOptions: controller.categoriesFilterOption,
            title: "Category",
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          OptionWidget(
            filterOptions: controller.durationFilterOption,
            title: "Duration",
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          OptionWidget(
            filterOptions: controller.intensityFilterOption,
            title: "Intensity",
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          OptionWidget(
            filterOptions: controller.mealFilterOption,
            title: "Meal",
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          OptionWidget(
            filterOptions: controller.goalFilterOption,
            title: "Fitness Goal",
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    action: () {
                      Navigator.pop(context);
                      SnackBarX.showSuccess(
                          title: "filter_reset_snack_title",
                          message: "filters_reset_snack_message");
                    },
                    text: "reset_lbl",
                    btnColor: Theme.of(context).brightness == Brightness.light
                        ? AppColor.textBlueGrey
                        : AppColor.grey,
                    primary: false,
                    txtColor: Theme.of(context).brightness == Brightness.light
                        ? AppColor.textBlueGrey
                        : AppColor.grey,
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceS(),
                Expanded(
                  child: AppButton(
                    action: () {
                      Navigator.pop(context);
                      controller.isSearchDone.value = true;
                      SnackBarX.showSuccess(
                          title: "filter_applied_snack_title",
                          message: "filters_applied_snack_message");
                    },
                    text: "apply_lbl",
                  ),
                ),
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
    );
  }
}
