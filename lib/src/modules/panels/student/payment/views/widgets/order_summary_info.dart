import 'package:go7eight/src/core/app_export.dart';

class OrderSummaryInfo extends StatelessWidget {
  final String fieldKey;
  final String fieldValue;

  const OrderSummaryInfo(
      {super.key, required this.fieldKey, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppRatioSize.getRatioHeight() / 120),
      child: Row(
        children: [
          Text(
            fieldKey.tr,
            textAlign: TextAlign.start,
            style: TextStyleX.subHeading2(context),
          ),
          AppRatioSpaces.horizontalSectionSpaceXXXS(),
          Expanded(
            child: Text(
              "---------------------------------------------------------------"
                  .tr,
              textAlign: TextAlign.start,
              style: TextStyleX.subHeading2(context),
              maxLines: 1,
            ),
          ),
          AppRatioSpaces.horizontalSectionSpaceXXXS(),
          Text(
            fieldValue.tr,
            textAlign: TextAlign.start,
            style: TextStyleX.subHeading2(context),
          ),
        ],
      ),
    );
  }
}
