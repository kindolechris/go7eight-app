import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/cart/controllers/cart_controller.dart';

class BottomPurchasedWidget extends GetView<CartController> {
  const BottomPurchasedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$${92.00}".tr,
                textAlign: TextAlign.start,
                style: TextStyleX.header6(context).copyWith(
                  color: AppColor.primary,
                ),
              ),
              Text(
                "total_lbl".tr,
                textAlign: TextAlign.start,
                style: TextStyleX.subHeading2(context),
              ),
            ],
          ),
          AppRatioSpaces.horizontalSectionSpaceS(),
          Expanded(
              child: AppButton(
            action: controller.proceedToCheckout,
            text: "proceed_to_checkout",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }
}
