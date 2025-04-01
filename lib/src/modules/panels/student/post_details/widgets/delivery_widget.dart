import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDeliveryOption(
            context,
            'Go7eight Terminal',
            'We deliver your product to the nearest Go7eight Terminal free of charge.',
            true,
          ),
          _buildDeliveryOption(
            context,
            'Pickup at Seller\'s Location',
            'Collect your purchase directly from the seller\'s business location.',
            false,
          ),
          _buildDeliveryOption(
            context,
            'Door Delivery Service',
            'Have your items delivered straight to your doorstep.',
            false,
          ),

          const SizedBox(height: 20),

          Text(
            'Delivery Location',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
            ),
          ),

          const SizedBox(height: 10),

          _buildLocationSelector(),

          const SizedBox(height: 20),

          Text(
            'Estimated Delivery Time',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
            ),
          ),

          const SizedBox(height: 15),

          _buildDeliveryTimeline(context),
        ],
      ),
    );
  }

  Widget _buildLocationSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: AppColor.primaryBlue,
            size: 18,
          ),
          const SizedBox(width: 10),
          Builder(
            builder: (context) => Expanded(
              child: Text(
                'Mlimani City Mall, Dar es Salaam',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.white,
                ),
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColor.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOption(BuildContext context, String title, String description, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? AppColor.primaryBlue : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        color: isSelected
            ? Theme.of(context).brightness == Brightness.light
            ? Colors.blue.shade50
            : Colors.blue.shade900.withOpacity(0.2)
            : Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColor.primaryBlue : AppColor.grey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryBlue,
                ),
              ),
            )
                : null,
          ),
          const SizedBox(width: 12),
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

  Widget _buildDeliveryTimeline(BuildContext context) {
    return Row(
      children: [
        _buildTimelineItem('Processing', '(Today)', AppColor.green, true),
        _buildTimelineConnector(true),
        _buildTimelineItem('Shipping', '(+1 day)', AppColor.primaryBlue, false),
        _buildTimelineConnector(false),
        _buildTimelineItem('Delivery', '(+2 days)', AppColor.grey, false),
      ],
    );
  }

  Widget _buildTimelineItem(String label, String time, Color color, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? color : Colors.grey.shade300,
              border: isActive
                  ? Border.all(color: Colors.white, width: 2)
                  : null,
              boxShadow: isActive
                  ? [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
                  : null,
            ),
            child: isActive
                ? const Icon(
              Icons.check,
              color: AppColor.white,
              size: 16,
            )
                : null,
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? color : AppColor.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Builder(
            builder: (context) => Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? AppColor.black : AppColor.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineConnector(bool isActive) {
    return Container(
      width: 30,
      height: 2,
      color: isActive ? AppColor.green : Colors.grey.shade300,
    );
  }
}