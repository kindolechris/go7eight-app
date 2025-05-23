import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_font.dart';

import '../../../../helpers/theme_helper.dart';

class PaymentSelectionWidget extends StatefulWidget {
  const PaymentSelectionWidget({super.key});

  @override
  State<PaymentSelectionWidget> createState() => _PaymentSelectionWidgetState();
}

class _PaymentSelectionWidgetState extends State<PaymentSelectionWidget> {
  String? selectedMethod;
  String? selectedMobileNetwork;
  String? selectedCardType;
  String? enteredPhoneNumber;
  String? enteredCardNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPaymentOption(
          title: 'Mobile Money Payments',
          methodKey: 'mobile_money',
          backgroundColor: themedColor(Get.context!, (c) => c.chatColor),
          icons: [
            'assets/images/mpesa.png',
            'assets/images/tigopesa.png',
            'assets/images/halopesa.png',
            'assets/images/airtelmoney.png',
          ],
        ),
        const SizedBox(height: 16),
        _buildPaymentOption(
          title: 'Card Payments',
          methodKey: 'card',
          backgroundColor: themedColor(Get.context!, (c) => c.chatColor),
          icons: [
            'assets/images/mastercard.png',
            'assets/images/visa.png',
          ],
          border: true,
        ),
        // Input for mobile money
        if (selectedMobileNetwork != null && selectedMethod == 'mobile_money')
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextField(
              keyboardType: TextInputType.phone,
              onChanged: (val) => enteredPhoneNumber = val,
              decoration: InputDecoration(
                hintText: 'Enter phone number for $selectedMobileNetwork',
                hintStyle: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
                filled: true,
                fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: TextStyle(
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
          ),

        // Input for card
        if (selectedCardType != null && selectedMethod == 'card')
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) => enteredCardNumber = val,
              decoration: InputDecoration(
                hintText: 'Enter your $selectedCardType card number',
                hintStyle: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
                filled: true,
                fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: TextStyle(
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required String methodKey,
    required Color backgroundColor,
    required List<String> icons,
    bool border = false,
  }) {
    final isSelected = selectedMethod == methodKey;

    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedMethod = methodKey;
        });

        if (methodKey == 'mobile_money') {
          final result = await showModalBottomSheet<String>(
            context: context,
            backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) => _buildMobileMoneyPopup(),
          );

          if (result != null) {
            setState(() {
              selectedMobileNetwork = result;
              selectedCardType = null;
              enteredCardNumber = null;
            });
          }
        }

        if (methodKey == 'card') {
          final result = await showModalBottomSheet<String>(
            context: context,
            backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) => _buildCardPopup(),
          );

          if (result != null) {
            setState(() {
              selectedCardType = result;
              selectedMobileNetwork = null;
              enteredPhoneNumber = null;
            });
          }
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: border
              ? Border.all(
                  color: themedColor(Get.context!, (c) => c.borderColor),
                )
              : null,
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: themedColor(Get.context!, (c) => c.secondaryColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle,
                      color: AppColor.primaryColor, size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: icons
                  .map((icon) => Image.asset(icon, width: 50, height: 30))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMoneyPopup() {
    final List<Map<String, String>> options = [
      {'name': 'M-Pesa', 'logo': 'assets/images/mpesa.png'},
      {'name': 'TigoPesa', 'logo': 'assets/images/tigopesa.png'},
      {'name': 'HaloPesa', 'logo': 'assets/images/halopesa.png'},
      {'name': 'Airtel Money', 'logo': 'assets/images/airtelmoney.png'},
    ];

    return Card(
      color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Mobile Network',
              style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...options.map(
              (option) => ListTile(
                onTap: () => Navigator.pop(context, option['name']),
                leading: Image.asset(option['logo']!, width: 40),
                title: Text(option['name']!,
                    style:   TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor),)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPopup() {
    final List<Map<String, String>> options = [
      {'name': 'Visa', 'logo': 'assets/images/visa.png'},
      {'name': 'Mastercard', 'logo': 'assets/images/mastercard.png'},
      {
        'name': 'Amex',
        'logo': 'assets/images/visa.png'
      }, // Replace with real logo
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Card Type',
            style: TextStyle(
                fontFamily: AppFont.appFontRegular,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...options.map(
            (option) => ListTile(
              onTap: () => Navigator.pop(context, option['name']),
              leading: Image.asset(option['logo']!, width: 40),
              title: Text(option['name']!,
                  style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontFamily: AppFont.appFontRegular,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
