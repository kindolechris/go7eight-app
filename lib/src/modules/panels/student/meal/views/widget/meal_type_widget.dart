import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/meal_model.dart';

class MealTypeWidget extends StatelessWidget {
  final void Function() onMealClick;
  final MealModel meal;
  final Widget? mealItemWidget;
  final bool? showAddButton;
  final MainAxisAlignment mainAxisAlignment;

  const MealTypeWidget(
      {super.key,
      required this.onMealClick,
      required this.meal,
      this.mealItemWidget,
      this.showAddButton = true,
      this.mainAxisAlignment = MainAxisAlignment.start});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMealClick,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AppContainerWidget(
          disableDefaultHPadding: true,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() /
                        (showAddButton == false ? 24 : 24),
                    vertical: AppRatioSize.getRatioHeight() /
                        (showAddButton == false ? 400 : 120)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset(meal.iconPath, scale: 1.5),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          meal.name.tr,
                          style: TextStyleX.subHeading1(context),
                        ),
                        meal.desc == ""
                            ? Container()
                            : const SizedBox(
                                height: 8,
                              ),
                        meal.desc == ""
                            ? Container()
                            : Text(
                                meal.desc.tr,
                                style: TextStyleX.subHeading1(context)
                                    .copyWith(
                                        color: AppColor.grey,
                                        fontSize: AppTextSizes.headerText4()),
                              ),
                      ],
                    ),
                    showAddButton == false ? Container() : const Spacer(),
                    showAddButton == false
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: AppColor.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                Text(
                                  " ${"add_lbl".tr} ",
                                  style: TextStyleX.subHeading2(context)
                                      .copyWith(color: AppColor.primary),
                                ),
                                const Icon(
                                  Icons.add,
                                  color: AppColor.primary,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
              mealItemWidget ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}
