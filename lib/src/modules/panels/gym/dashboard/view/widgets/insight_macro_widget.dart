import 'package:go7eight/src/core/app_export.dart';

class InsightMacroWidget extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String macroLabel;
  final String macroValue;
  final String macroUnit;

  const InsightMacroWidget(
      {super.key,
      required this.iconPath,
      required this.iconColor,
      required this.macroLabel,
      required this.macroValue,
      required this.macroUnit});

  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _macroIconImageSection(),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          Flexible(child: _macroTextSection(context)),
        ],
      ),
    );
  }

  Widget _macroIconImageSection() {
    return Container(
      padding: const EdgeInsets.all(1.5),
      margin: const EdgeInsets.only(top: 3.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: iconColor.withOpacity(0.25)),
      child: Image.asset(
        iconPath,
        color: iconColor,
        width: AppRatioSize.getRatioHeight() / 38,
      ),
    );
  }

  Widget _macroTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _macroTextSectionLabel(context),
        _macroTextSectionValue(context),
      ],
    );
  }

  Widget _macroTextSectionLabel(BuildContext context) {
    return Text(
      macroLabel.tr,
      maxLines: 1,
      style: TextStyleX.subHeading2(context).copyWith(
        fontSize: AppTextSizes.bodyText1(),
      ),
    );
  }

  Widget _macroTextSectionValue(BuildContext context) {
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
                  .copyWith(fontSize: AppTextSizes.headerText1()))
        ],
      ),
    );
  }
}
