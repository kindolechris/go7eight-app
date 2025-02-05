import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/payment_controller.dart';

class BillingDeliverySameCheckText extends GetView<PaymentController> {
  const BillingDeliverySameCheckText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        controller.deliverySameAsBilling();
      },
      child: Obx(() {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: Row(
            children: [
              controller.isDeliveryAndBillingAddressSame.value == true
                  ? const Icon(
                      Icons.check_box_rounded,
                      color: AppColor.primary,
                    )
                  : const Icon(Icons.check_box_outline_blank_rounded,
                      color: AppColor.primary),
              AppRatioSpaces.horizontalSectionSpaceXXS(),
              Expanded(
                child: Text(
                  "billing_same_delivery".tr,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyleX.subHeading2(context).copyWith(
                    color: AppColor.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
