import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';

class WarrantyWidget extends StatelessWidget {
  const WarrantyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWarrantyItem(
            context,
            'Official Warranty',
            '1 Year manufacturer warranty with authorized service centers',
            Icons.verified,
            Colors.blue,
          ),
          _buildWarrantyItem(
            context,
            'Return Policy',
            '7 Days easy return policy if product is defective or damaged',
            Icons.restore,
            Colors.orange,
          ),
          _buildWarrantyItem(
            context,
            'Buyer Protection',
            'Go7eight guarantees your purchase safety with secure payments',
            Icons.security,
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildWarrantyItem(BuildContext context, String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).brightness == Brightness.light
            ? color.withOpacity(0.1)
            : color.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.black
                        : AppColor.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}