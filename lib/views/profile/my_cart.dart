import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Men T-shirt',
      'size': 'L',
      'color': 'Blue',
      'price': 33000,
      'quantity': 2,
      'image': 'assets/images/tshirt.png'
    },
    {
      'title': 'Denim Jacket',
      'size': 'M',
      'color': 'Black',
      'price': 45000,
      'quantity': 1,
      'image': 'assets/images/tshirt.png'
    },
  ];

  int get totalPrice => cartItems.fold(0,
      (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int));

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
          "My Cart",
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
            child: cartItems.isEmpty
                ? Center(
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(
                        fontSize: AppSize.appSize14,
                        color: themedColor(Get.context!,(c) => c.secondaryColor),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return _buildCartItem(item, index);
                    },
                  ),
          ),
          if (cartItems.isNotEmpty) _buildCartSummary()
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themedColor(Get.context!,(c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themedColor(Get.context!,(c) => c.borderColor)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.appSize14,
                      color: themedColor(Get.context!,(c) => c.secondaryColor),
                    )),
                const SizedBox(height: 4),
                Text("Size: ${item['size']} • Color: ${item['color']}",
                    style: TextStyle(
                      fontSize: AppSize.appSize12,
                      color: themedColor(Get.context!,(c) => c.text2Color),
                    )),
                const SizedBox(height: 4),
                Text("TZS ${item['price']}",
                    style: TextStyle(
                      fontSize: AppSize.appSize13,
                      color: themedColor(Get.context!,(c) => c.secondaryColor),
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text("x${item['quantity']}",
                    style: const TextStyle(color: Colors.white)),
              ),
              IconButton(
                icon:
                    const Icon(Icons.delete, size: 18, color: Colors.redAccent),
                onPressed: () {
                  setState(() {
                    cartItems.removeAt(index);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCartSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: themedColor(Get.context!,(c) => c.cardBackgroundColor),
        border: Border(
            top: BorderSide(color: themedColor(Get.context!,(c) => c.borderColor))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
                  style: TextStyle(
                      fontSize: AppSize.appSize14,
                      fontFamily: AppFont.appFontSemiBold,
                      color: themedColor(Get.context!,(c) => c.secondaryColor))),
              Text("TZS $totalPrice",
                  style: TextStyle(
                      fontSize: AppSize.appSize16,
                      fontWeight: FontWeight.bold,
                      color: themedColor(Get.context!,(c) => c.secondaryColor))),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.myCartCheckout);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.supportColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Proceed to Checkout",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
