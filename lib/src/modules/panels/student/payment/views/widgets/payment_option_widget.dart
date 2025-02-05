import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/payment_controller.dart';

class PaymentOptionWidget extends GetView<PaymentController> {
  const PaymentOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.paymentOptions.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Obx(() {
            return GestureDetector(
              onTap: () {
                controller
                    .onPaymentOptionSelection(controller.paymentOptions[index]);
              },
              child: Container(
                margin: EdgeInsets.only(
                    bottom: AppRatioSize.getRatioHeight() / 120,
                    right: AppRatioSize.getRatioWidth() / 24,
                    left: AppRatioSize.getRatioWidth() / 24),
                padding: EdgeInsets.symmetric(
                    vertical: AppRatioSize.getRatioHeight() / 110,
                    horizontal: AppRatioSize.getRatioWidth() / 32),
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? (controller.paymentOptions[index].isSelected == true
                            ? AppColor.primary.withOpacity(0.2)
                            : AppColor.white)
                        : (controller.paymentOptions[index].isSelected == true
                            ? AppColor.primary.withOpacity(0.4)
                            : AppColor.black),
                    border: Border.all(
                        color:
                            controller.paymentOptions[index].isSelected == true
                                ? AppColor.primary
                                : AppColor.lightGrey),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                            "${controller.paymentOptions[index].iconPath}"),
                        AppRatioSpaces.horizontalSectionSpaceXS(),
                        Text(
                          "${controller.paymentOptions[index].name}".tr,
                          textAlign: TextAlign.start,
                          style: TextStyleX.subHeading2BlueGrey(context),
                        ),
                      ],
                    ),
                    controller.paymentOptions[index].isSelected == true
                        ? const Icon(
                            Icons.radio_button_checked_rounded,
                            color: AppColor.primary,
                          )
                        : const Icon(Icons.radio_button_off_rounded,
                            color: AppColor.grey),
                  ],
                ),
              ),
            );
          });
        });
  }
}
