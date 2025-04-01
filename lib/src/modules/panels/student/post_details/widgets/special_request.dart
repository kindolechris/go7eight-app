import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';

class SpecialRequestWidget extends StatelessWidget {
  const SpecialRequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Request',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : Colors.grey.shade800,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Add any special instructions or requests here...',
                hintStyle: TextStyle(color: AppColor.grey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(15),
              ),
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.black
                    : AppColor.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                size: 14,
                color: AppColor.grey,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Special requests are subject to availability and cannot be guaranteed.',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}