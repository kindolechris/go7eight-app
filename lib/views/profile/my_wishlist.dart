import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';

class MyWishlistPage extends StatefulWidget {
  const MyWishlistPage({super.key});

  @override
  State<MyWishlistPage> createState() => _MyWishlistPageState();
}

class _MyWishlistPageState extends State<MyWishlistPage> {
  List<Map<String, dynamic>> wishlistItems = [
    {
      'title': 'Men T-shirt',
      'price': 33000,
      'image': 'assets/images/tshirt.png',
    },
    {
      'title': 'Casual Sneakers',
      'price': 45000,
      'image': 'assets/images/tshirt.png',
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
          "My Wishlist",
          style: TextStyle(
            fontSize: AppSize.appSize18,
            fontFamily: AppFont.appFontSemiBold,
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
        ),
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Text("Your wishlist is empty",
                  style: TextStyle(
                      color: themedColor(Get.context!,(c) => c.secondaryColor))),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
                return _buildWishlistItem(item, index);
              },
            ),
    );
  }

  Widget _buildWishlistItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themedColor(Get.context!,(c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: themedColor(Get.context!,(c) => c.borderColor)),
      ),
      child: Row(
        children: [
          // Product Image
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

          // Product Info
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
                Text("TZS ${item['price']}",
                    style: TextStyle(
                      fontSize: AppSize.appSize13,
                      color: themedColor(Get.context!,(c) => c.secondaryColor),
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    minimumSize: const Size(80, 36),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Add to Cart",
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ],
            ),
          ),

          // Actions: Favorite & Delete
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.redAccent),
                onPressed: () {
                  // Toggle logic
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    wishlistItems.removeAt(index);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
