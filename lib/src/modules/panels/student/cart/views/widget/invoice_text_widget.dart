import 'package:go7eight/src/core/app_export.dart';

class InvoiceTextWidget extends StatelessWidget {
  final String fieldKey;
  final String fieldValue;
  const InvoiceTextWidget({super.key, required this.fieldKey, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldKey.tr,
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading3(context).copyWith(
            color: AppColor.lightBlueGrey,
          ),
        ),
        Text(
          fieldValue.tr,
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading3(context).copyWith(
            color: AppColor.lightBlueGrey,
          ),
        ),
      ],
    );
  }
}
