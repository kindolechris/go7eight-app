import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../home/buyer/checkout/payment_methods.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: themedColor(Get.context!,(c) => c.secondaryColor)),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: AppSize.appSize18,
            fontFamily: AppFont.appFontSemiBold,
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address
            Text("Delivery Address", style: _sectionTitleStyle(context)),
            const SizedBox(height: 8),
            _checkoutBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Eleanor Pena", style: _contentTextStyle(context)),
                  Text("456 Nyerere Ave, Dar es Salaam",
                      style: _contentTextStyle(context)),
                  Text("+255 712 000 999", style: _contentTextStyle(context)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method
            // Text("Payment Method", style: _sectionTitleStyle(context)),
            PaymentSelectionWidget(),
            // const SizedBox(height: 8),
            // _checkoutBox(
            //   child: Row(
            //     children: [
            //       Icon(Icons.credit_card,
            //           color: themedColor(Get.context!,(c) => c.secondaryColor)),
            //       const SizedBox(width: 12),
            //       Text("MasterCard •••• 8910",
            //           style: _contentTextStyle(context)),
            //       const Spacer(),
            //       Icon(Icons.check_circle, color: AppColor.primaryColor),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),

            // Order Summary
            Text("Order Summary", style: _sectionTitleStyle(context)),
            const SizedBox(height: 8),
            _checkoutBox(
              child: Column(
                children: [
                  _summaryRow(context, "Items (3)", "TZS 66,000"),
                  _summaryRow(context, "Delivery", "TZS 5,000"),
                  _summaryRow(context, "VAT", "TZS 1,200"),
                  const Divider(),
                  _summaryRow(context, "Total", "TZS 72,200",
                      bold: true, fontSize: 16),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Checkout Button
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.orderConfirmation);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.supportColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Confirm & Pay",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkoutBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: themedColor(Get.context!, (c) => c.borderColor)),
      ),
      child: child,
    );
  }

  Widget _summaryRow(BuildContext context, String label, String value,
      {bool bold = false, double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                color: themedColor(Get.context!,(c) => c.text2Color),
              )),
          Text(value,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: bold ? FontWeight.bold : FontWeight.w600,
                color: themedColor(Get.context!,(c) => c.secondaryColor),
              )),
        ],
      ),
    );
  }

  TextStyle _sectionTitleStyle(BuildContext context) => TextStyle(
        fontSize: AppSize.appSize16,
        fontFamily: AppFont.appFontBold,
        color: themedColor(Get.context!,(c) => c.secondaryColor),
      );

  TextStyle _contentTextStyle(BuildContext context) => TextStyle(
        fontSize: AppSize.appSize13,
        color: themedColor(Get.context!,(c) => c.text2Color),
      );
}
