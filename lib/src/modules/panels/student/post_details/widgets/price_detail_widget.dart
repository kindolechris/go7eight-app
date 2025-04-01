import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';

class PriceDetailsWidget extends StatefulWidget {
  const PriceDetailsWidget({Key? key}) : super(key: key);

  @override
  State<PriceDetailsWidget> createState() => _PriceDetailsWidgetState();
}

class _PriceDetailsWidgetState extends State<PriceDetailsWidget> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade50
            : Colors.grey.shade900,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
            ),
          ),
          const SizedBox(height: 20),
          _buildPriceRow('Product Price', 'TSh 690,000'),
          _buildPriceRow('Quantity', '1', showTopBorder: true),
          _buildPriceRow('Delivery Charges', 'Free', valueColor: AppColor.green),
          _buildPriceRow('Discount', 'TSh 0.00'),

          const SizedBox(height: 15),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.white,
                ),
              ),
              Text(
                'TSh 690,000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary
                      : AppColor.primaryLight,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Quantity selector
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quantity: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.white,
                ),
              ),
              const SizedBox(width: 15),
              _buildQuantityControl(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {Color? valueColor, bool showTopBorder = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: AppColor.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: valueColor ?? (Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Decrement button
          InkWell(
            onTap: () {
              if (_quantity > 1) {
                setState(() {
                  _quantity--;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Icon(
                Icons.remove,
                size: 16,
                color: _quantity > 1 ? AppColor.primaryBlue : Colors.grey,
              ),
            ),
          ),

          // Quantity display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$_quantity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.black
                    : AppColor.white,
              ),
            ),
          ),

          // Increment button
          InkWell(
            onTap: () {
              setState(() {
                _quantity++;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppColor.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}