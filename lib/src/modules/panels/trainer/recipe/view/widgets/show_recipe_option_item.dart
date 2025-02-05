import 'package:go7eight/src/core/app_export.dart';

class ShowRecipeOptionItem extends StatelessWidget {
  final void Function() action;
  final String optionTitle;
  final bool isChecked;

  const ShowRecipeOptionItem(
      {super.key,
      required this.action,
      required this.optionTitle,
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppRatioSize.getRatioWidth() / 88, vertical: 3),
        decoration: BoxDecoration(
            color: isChecked == true
                ? Theme.of(context).brightness == Brightness.light
                    ? AppColor.primary.withOpacity(0.15)
                    : AppColor.primary.withOpacity(0.5)
                : Theme.of(context).brightness == Brightness.light
                    ? AppColor.lightBlueGrey.withOpacity(0.1)
                    : AppColor.blackShade,
            border: Border.all(
              width: 1.2,
              color: isChecked == true
                  ? Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary
                      : AppColor.primary
                  : Theme.of(context).brightness == Brightness.light
                      ? AppColor.lightBlueGrey
                      : AppColor.blueGrey,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                optionTitle.tr,
                style: TextStyleX.subHeading3(context),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: isChecked == true
                  ? Icon(
                      Icons.check_box_rounded,
                      color: AppColor.primary,
                      size: AppRatioSize.getRatioWidth() / 14,
                    )
                  : Icon(Icons.check_box_outline_blank,
                      color: AppColor.grey,
                      size: AppRatioSize.getRatioWidth() / 14),
            )
          ],
        ),
      ),
    );
  }
}
