import 'package:go7eight/src/core/app_export.dart';

class MacroProgressWidget extends StatelessWidget {
  final int completedCount;
  final int totalCount;
  final String macroName;
  final Color progressColor;

  const MacroProgressWidget(
      {super.key,
      required this.completedCount,
      required this.totalCount,
      required this.macroName,
      required this.progressColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyleX.subHeading1(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.grey
                  : AppColor.darkGrey,
              fontSize: AppTextSizes.headerText3()),
          TextSpan(
            children: [
              TextSpan(
                text: "$completedCount".tr,
                style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.black
                        : AppColor.creamColor,
                    fontSize: AppTextSizes.titleText4()),
              ),
              TextSpan(
                text: '/$totalCount'.tr,
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppRatioSize.getRatioHeight() / 88,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColor.offWhite
                : AppColor.blackShade,
            color: progressColor,
            minHeight: 5,
            value: completedCount / totalCount,
            semanticsLabel: macroName,
          ),
        ),
        SizedBox(
          height: AppRatioSize.getRatioHeight() / 88,
        ),
        Text(
          macroName.tr.toUpperCase(),
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading1(context).copyWith(
              fontSize: AppTextSizes.headerText2(),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.grey
                  : AppColor.darkGrey),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
