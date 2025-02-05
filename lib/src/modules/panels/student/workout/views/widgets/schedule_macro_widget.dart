import 'package:go7eight/src/core/app_export.dart';

class ScheduleMacroWidget extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String macroLabel;
  final String macroValue;
  final String macroUnit;

  const ScheduleMacroWidget(
      {super.key,
      required this.iconPath,
      required this.iconColor,
      required this.macroLabel,
      required this.macroValue,
      required this.macroUnit});

  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _scheduleMacroIconImageSection(),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            Flexible(child: _scheduleMacroTextSection(context)),
          ],
        ),
      ),
    );
  }

  Widget _scheduleMacroIconImageSection() {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width),
          color: AppColor.primary),
      child: Image.asset(
        iconPath,
        color: iconColor,
        width: AppRatioSize.getRatioHeight() / 24,
      ),
    );
  }

  Widget _scheduleMacroTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _scheduleMacroTextSectionLabel(context),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        _scheduleMacroTextSectionValue(context),
      ],
    );
  }

  Widget _scheduleMacroTextSectionLabel(BuildContext context) {
    return Text(
      macroLabel.tr,
      maxLines: 1,
      style: TextStyleX.subHeading2(context).copyWith(
        color: AppColor.lightBlueGrey,
      ),
    );
  }

  Widget _scheduleMacroTextSectionValue(BuildContext context) {
    return Text.rich(
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyleX.subHeading1(context).copyWith(
        fontSize: AppTextSizes.titleText4(),
      ),
      TextSpan(
        children: [
          TextSpan(
            text: macroValue.tr,
          ),
          TextSpan(
              text: ' $macroUnit',
              style: TextStyleX.subHeading1(context)
                  .copyWith(fontSize: AppTextSizes.headerText3()))
        ],
      ),
    );
  }
}
