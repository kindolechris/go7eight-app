import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';

class SpecificationsWidget extends StatelessWidget {
  const SpecificationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSpecificationItem(context, 'Processor', 'Intel Core i9, 11th Generation'),
          _buildSpecificationItem(context, 'Memory', '16GB DDR4 RAM'),
          _buildSpecificationItem(context, 'Storage', '1TB SSD'),
          _buildSpecificationItem(context, 'Display', '15.6" FHD (1920 x 1080) Anti-Glare'),
          _buildSpecificationItem(context, 'Graphics', 'NVIDIA GeForce RTX 3060, 6GB GDDR6'),
          _buildSpecificationItem(context, 'Operating System', 'Windows 11 Home'),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'View Full Specifications',
                style: TextStyle(
                  color: AppColor.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationItem(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.black
                    : AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}