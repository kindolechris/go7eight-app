import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_color.dart';
import '../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../../../widget/app_button.dart';

class MonitizePage1 extends StatelessWidget {
  const MonitizePage1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contentTypes = [
      {
        'title': 'Physical Products',
        'description':
            'Selling item like clothes, gadgets, or skincare? Choose this to set price, inventory, and delivery options.'
      },
      {
        'title': 'Digital Products',
        'description':
            'E-books, software, courses, or design files? Upload your file and set download access or delivery by email.'
      },
      {
        'title': 'Events',
        'description':
            'Hosting a concert, training, or online event? Use this to sell tickets, manage bookings, and add event details'
      },
      {
        'title': 'Donations',
        'description':
            'Collect offerings, donations, or community contributions for any cause.'
      },
      {
        'title': 'Service Offerings',
        'description':
            "Offer services like design, or coaching. Set your price, describe what's included, and get booked or paid"
      },
    ];

    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        title: const Text(
          'Post Checkout Form',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select content type',
              style: TextStyle(
                  fontSize: 16,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: contentTypes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = contentTypes[index];
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(AppRoutes.monitizePhysicalProduct);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF2A0D12)
                            : themedColor(
                                Get.context!, (c) => c.chatColor),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.red.shade900, width: 0.6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title']!,
                              style: TextStyle(
                                  color: themedColor(
                                      Get.context!, (c) => c.secondaryColor),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          const SizedBox(height: 8),
                          Text(item['description']!,
                              style: TextStyle(
                                  color: themedColor(
                                      Get.context!, (c) => c.text2Color),
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            AppButton(
              onPressed: () {},
              text: 'Start From Existing Checkout',
              backgroundColor: AppColor.supportColor,
              margin: const EdgeInsets.only(top: AppSize.appSize12),
            ),
          ],
        ),
      ),
    );
  }
}
