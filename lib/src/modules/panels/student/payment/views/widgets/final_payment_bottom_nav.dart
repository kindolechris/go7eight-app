import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/open_alert_box.dart';

import '../../controllers/payment_controller.dart';

class FinalPaymentBottomNav extends GetView<PaymentController> {
  const FinalPaymentBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1)
                  : AppColor.white.withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarPurchaseButtons(context));
  }

  Widget _bottomNavBarPurchaseButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: () {
              openAlertBox(
                  context: context,
                  title: "payment_successful_text",
                  description: "",
                  icon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.green),
                        child: Icon(Icons.check,
                            color: AppColor.white,
                            size: AppRatioSize.getRatioHeight() / 24),
                      ),
                    ],
                  ),
                  buttonText: "back_to_home_lbl",
                  buttonAction: controller.gotoHome);
            },
            text: "payment_lbl",
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
