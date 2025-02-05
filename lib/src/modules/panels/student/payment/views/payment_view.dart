import 'package:go7eight/src/modules/panels/student/payment/views/widgets/billing_address_add.dart';
import 'package:go7eight/src/modules/panels/student/payment/views/widgets/order_price_info.dart';
import 'package:go7eight/src/modules/panels/student/payment/views/widgets/order_summary_info.dart';

import '../../../../../core/app_export.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/payment_controller.dart';
import 'widgets/payment_option_widget.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(context,
          showSaveIcon: false, title: "secure_checkout_title"),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceXS(),
              const AppSectionTitle(
                title: "payment_options_lbl",
                showViewAll: false,
              ),
              AppRatioSpaces.verticalSectionSpaceXXXS(),
              const PaymentOptionWidget(),
              AppRatioSpaces.verticalSectionSpaceXS(),
              BillingAddressAdd(
                buttonAction: controller.gotoAddressForm,
              ),
              AppRatioSpaces.verticalSectionSpaceS(),
              _orderSummaryWidget(),
              AppRatioSpaces.verticalSectionSpaceL(),
            ],
          )),
      bottomNavigationBar: _bottomNavBarButtons(context),
    );
  }

  Widget _orderSummaryWidget() {
    return Column(
      children: [
        const AppSectionTitle(
          title: "order_summary_lbl",
          showViewAll: false,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: const AppContainerWidget(
              child: Column(
            children: [
              OrderSummaryInfo(fieldKey: "total_item_lbl", fieldValue: "5"),
              OrderSummaryInfo(
                  fieldKey: "item_price_lbl", fieldValue: "\$92.00"),
              OrderSummaryInfo(
                  fieldKey: "vat_if_applicable_lbl", fieldValue: "\$0.00"),
              Divider(
                thickness: 1.5,
              ),
              OrderPriceInfo(fieldKey: "to_pay_lbl", fieldValue: "\$92.00"),
            ],
          )),
        ),
      ],
    );
  }

  Widget _bottomNavBarButtons(BuildContext context) {
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
            action: controller.gotoAddressForm,
            text: "lbl_next",
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
