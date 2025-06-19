import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';

class DeliveriesPage extends StatelessWidget {
  const DeliveriesPage({super.key});

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
          "Deliveries",
          style: TextStyle(
            fontSize: AppSize.appSize18,
            fontFamily: AppFont.appFontSemiBold,
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildDeliveryItem(index);
        },
      ),
    );
  }

  Widget _buildDeliveryItem(int index) {
    final delivery = {
      'orderId': 'GX2024${index + 1}',
      'product': 'Men T-shirt',
      'quantity': 2,
      'status': index % 2 == 0 ? 'Delivered' : 'On the way',
      'date': '2025-04-1${index + 1}',
      'image': 'assets/images/tshirt.png',
    };

    final isDelivered = delivery['status'] == 'Delivered';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: themedColor(Get.context!, (c) => c.borderColor)),
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              delivery['image']! as String,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order #${delivery['orderId']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.appSize14,
                      color: themedColor(Get.context!, (c) => c.secondaryColor),
                    )),
                const SizedBox(height: 4),
                Text("${delivery['quantity']}x ${delivery['product']}",
                    style: TextStyle(
                      fontSize: AppSize.appSize12,
                      color: themedColor(Get.context!, (c) => c.text2Color),
                    )),
                const SizedBox(height: 4),
                Text("Date: ${delivery['date']}",
                    style: TextStyle(
                      fontSize: AppSize.appSize12,
                      color: themedColor(Get.context!, (c) => c.text2Color),
                    )),
              ],
            ),
          ),

          // Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isDelivered ? Colors.green : Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              delivery['status']! as String,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
