import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        title: Text(
          "Active Orders",
          style: TextStyle(
            fontSize: AppSize.appSize18,
            fontFamily: AppFont.appFontSemiBold,
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: themedColor(Get.context!,(c) => c.secondaryColor)),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildOrderItem();
        },
      ),
    );
  }

  Widget _buildOrderItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themedColor(Get.context!, (c) => c.borderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order #GXT9038",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.appSize14,
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                  )),
              Text("14 Apr 2025",
                  style: TextStyle(
                    fontSize: AppSize.appSize12,
                    color: themedColor(Get.context!, (c) => c.text2Color),
                  )),
            ],
          ),
          const SizedBox(height: 8),
          // Product Name
          Text("2x Men T-shirt (Blue, L)",
              style: TextStyle(
                fontSize: AppSize.appSize13,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              )),
          const SizedBox(height: 4),
          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange.shade800,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Processing",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:",
                  style: TextStyle(
                      color: themedColor(Get.context!, (c) => c.text2Color),
                      fontSize: AppSize.appSize13)),
              Text("TZS 66,000",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.appSize14,
                      color: themedColor(Get.context!, (c) => c.secondaryColor))),
            ],
          )
        ],
      ),
    );
  }
}
