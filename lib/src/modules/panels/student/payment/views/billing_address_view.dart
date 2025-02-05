
import '../../../../../core/app_export.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/payment_controller.dart';
import 'widgets/billing_address_form.dart';
import 'widgets/billing_delivery_same__check_text.dart';
import 'widgets/deilivery_address_form.dart';

class BillingAddressView extends GetView<PaymentController> {
  const BillingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,

      appBar: sessionAppBar(
          context, showSaveIcon: false, title: "add_address_title"),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
            height: Get.height,
            width: Get.width,
            color: Theme
                .of(context)
                .brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                const BillingAddressForm(),
                AppRatioSpaces.verticalSectionSpaceXS(),
                const BillingDeliverySameCheckText(),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                const DeliveryAddressForm(),
                AppRatioSpaces.verticalSectionSpaceL(),
              ],
            )
        ),
      ),
      bottomNavigationBar: _bottomNavBarButtons(context),
    );
  }



  _bottomNavBarButtons(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .brightness == Brightness.light
              ? AppColor.white : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1) : AppColor.white
                  .withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarPurchaseButtons(context)
    );
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
                action: controller.gotoCardForm,
                text: "lbl_next",
                fontSize: AppTextSizes.headerText1(),
                buttonWidth: double.infinity,
                boarderRadius: 8,
                txtColor: AppColor.white,
              )
          ),
        ],
      ),
    );
  }
}