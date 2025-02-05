import 'package:go7eight/src/core/app_export.dart';

class OrderPriceInfo extends StatelessWidget {
  final String fieldKey;
  final String fieldValue;

  const OrderPriceInfo(
      {super.key, required this.fieldKey, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldKey.tr,
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading2(context),
        ),
        Text(
          fieldValue.tr,
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading1(context)
              .copyWith(color: AppColor.primary),
        ),
      ],
    );
  }
}
