import 'package:go7eight/src/core/app_export.dart';

class BillingAddressAdd extends StatelessWidget {
  final String? buttonText;
  final void Function() buttonAction;

  const BillingAddressAdd(
      {super.key, this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "billing_address_lbl".tr,
            textAlign: TextAlign.start,
            style: TextStyleX.subHeading3(context),
          ),
          GestureDetector(
            onTap: buttonAction,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  color: AppColor.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Text(
                    buttonText ?? "add_lbl".tr,
                    textAlign: TextAlign.start,
                    style: TextStyleX.subHeading3(context)
                        .copyWith(color: AppColor.primary),
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColor.primary,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
