import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_size.dart';
import '../helpers/theme_helper.dart';

class WarrantyCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const WarrantyCard({
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  TextStyle(
              fontSize: AppSize.appSize14,
              fontWeight: FontWeight.bold,
              color: themedColor(Get.context!, (c) => c.secondaryColor),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style:  TextStyle(
              fontSize: AppSize.appSize12,
              fontWeight: FontWeight.bold,
              color: themedColor(Get.context!, (c) => c.text2Color),
            ),
          ),
        ],
      ),
    );
  }
}
