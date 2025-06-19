import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../helpers/theme_helper.dart';

class DeliveriablesTab extends StatelessWidget {
  const DeliveriablesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // Search Field
          Container(
            decoration: BoxDecoration(
              color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:  TextField(
              style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: themedColor(Get.context!, (c) => c.text2Color)),
                hintText: 'Search',
                hintStyle: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color)),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: AppSize.appSize20),

          // // Posts List
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     return _buildPostItem(

          //     );
          //   },
          // ),
          Column(
            children: [
              _buildPostItem(
                imagePath: 'assets/images/tshirt.png',
                title: 'GO78-250421-Q3ZB5K',
                status: 'Confirmed',
                subtitle: 'Special request during checkout, if any will apply.',
                timestamp: '11 mins Ago',
                statusColor: AppColor.primaryColor,
              ),
              _buildPostItem(
                imagePath: 'assets/images/post1.png',
                title: 'GO78-250421-Q6ZB5K',
                status: 'Reminder',
                subtitle: 'Lorem Ipsum is simply dummy text of the pri...',
                timestamp: 'in 6 days',
                statusColor: themedColor(Get.context!, (c) => c.container2Color),
              ),
              _buildPostItem(
                imagePath: 'assets/images/post2.png',
                title: 'Macbook Pro',
                status: 'Completed',
                subtitle: 'Lorem Ipsum is simply dummy text of the pri...',
                timestamp: '1 day Ago',
                statusColor: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPostItem({
    required String imagePath,
    required String title,
    required String status,
    required String subtitle,
    required String timestamp,
    required Color statusColor,
  }) {
    return GestureDetector(
      onTap: () => _showOrderOptions(Get.context!),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSize.appSize12),
        child: Container(
          decoration: BoxDecoration(
            color: themedColor(Get.context!, (c) => c.chatColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: AppSize.appSize10),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppSize.appSize10, horizontal: AppSize.appSize10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style:  TextStyle(
                                fontSize: AppSize.appSize14,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.appFontSemiBold,
                                color: themedColor(Get.context!, (c) => c.secondaryColor),
                              ),
                            ),
                          ),
                          Text(
                            timestamp,
                            style:  TextStyle(
                              fontSize: AppSize.appSize12,
                              color: themedColor(Get.context!, (c) => c.text2Color),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: AppSize.appSize5),
                      Text(
                        subtitle,
                        style:  TextStyle(
                          fontSize: AppSize.appSize12,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFont.appFontSemiBold,
                          color: themedColor(Get.context!, (c) => c.text2Color),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSize.appSize12),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: statusColor,
                                fontFamily: AppFont.appFontRegular,
                                fontSize: AppSize.appSize12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                           Icon(
                            Icons.arrow_forward_ios,
                            color: themedColor(Get.context!, (c) => c.text2Color),
                            size: 14,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOrderOptions(BuildContext context) {
  final List<String> options = [
    'Order Confirmed',
    'Processing/in Transit',
    'Out for delivery/pickup',
    'Completed',
    'View Order Details',
    'Report order',
  ];

  showModalBottomSheet(
    context: context,
    backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.85,
        minChildSize: 0.3,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: ListView.builder(
              controller: scrollController,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = option == 'Order Confirmed';
                final isLast = option == 'Report order';

                return ListTile(
                  leading: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  title: Text(
                    option,
                    style: TextStyle(
                      fontSize: AppSize.appSize14,
                      fontFamily: AppFont.appFontRegular,
                      color:
                          isLast ? AppColor.supportColor : themedColor(Get.context!, (c) => c.secondaryColor),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // handle option selection
                  },
                );
              },
            ),
          );
        },
      );
    },
  );
}

}
