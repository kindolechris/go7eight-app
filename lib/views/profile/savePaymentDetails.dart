import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';

class SavedPaymentDetailsPage extends StatefulWidget {
  const SavedPaymentDetailsPage({super.key});

  @override
  State<SavedPaymentDetailsPage> createState() =>
      _SavedPaymentDetailsPageState();
}

class _SavedPaymentDetailsPageState extends State<SavedPaymentDetailsPage> {
  List<Map<String, String>> paymentMethods = [
    {
      'type': 'MasterCard',
      'number': '**** **** **** 8910',
      'holder': 'Eleanor Pena',
      'expiry': '04/26',
    },
    {
      'type': 'Visa',
      'number': '**** **** **** 1283',
      'holder': 'Eleanor Pena',
      'expiry': '09/27',
    },
  ];

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
          "Saved Payment Details",
          style: TextStyle(
            fontSize: AppSize.appSize18,
            fontFamily: AppFont.appFontSemiBold,
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: paymentMethods.isEmpty
                ? Center(
                    child: Text(
                      "No saved payment methods.",
                      style: TextStyle(
                          color:
                              themedColor(Get.context!,(c) => c.secondaryColor)),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      final card = paymentMethods[index];
                      return _buildCardItem(card, index);
                    },
                  ),
          ),
          _buildAddNewButton(),
        ],
      ),
    );
  }

  Widget _buildCardItem(Map<String, String> card, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themedColor(Get.context!,(c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: themedColor(Get.context!,(c) => c.borderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card type and delete
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(card['type'] ?? '',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color:
                          themedColor(Get.context!,(c) => c.secondaryColor))),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () {
                  setState(() {
                    paymentMethods.removeAt(index);
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 6),

          // Masked card number
          Text(card['number'] ?? '',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: themedColor(Get.context!,(c) => c.secondaryColor))),
          const SizedBox(height: 4),

          // Card holder and expiry
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Card Holder: ${card['holder']}",
                  style: TextStyle(
                      fontSize: 12,
                      color: themedColor(Get.context!,(c) => c.text2Color))),
              Text("Expires: ${card['expiry']}",
                  style: TextStyle(
                      fontSize: 12,
                      color: themedColor(Get.context!,(c) => c.text2Color))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        onPressed: () {
          // Show add card form or navigation
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add New Payment Method",
            style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          minimumSize: const Size.fromHeight(50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
