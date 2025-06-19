import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

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
          "Transaction History",
          style: TextStyle(
            fontSize: AppSize.appSize18,
            fontFamily: AppFont.appFontSemiBold,
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildTransactionItem(index);
        },
      ),
    );
  }

  Widget _buildTransactionItem(int index) {
    final transaction = {
      'id': 'TXN2025${100 + index}',
      'amount': index % 2 == 0 ? 25000 : 55000,
      'type': index % 2 == 0 ? 'Debit' : 'Credit',
      'status': index % 2 == 0 ? 'Completed' : 'Pending',
      'date': '2025-04-1${index + 1}',
    };

    final isCredit = transaction['type'] == 'Credit';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themedColor(Get.context!, (c) => c.borderColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Transaction ID",
                  style: TextStyle(
                      fontSize: 12,
                      color: themedColor(Get.context!, (c) => c.text2Color))),
              Text(transaction['id']! as String,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color:
                          themedColor(Get.context!, (c) => c.secondaryColor))),
            ],
          ),
          const SizedBox(height: 8),

          // Amount and Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${isCredit ? '+' : '-'} TZS ${transaction['amount']}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCredit ? Colors.green : Colors.redAccent,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isCredit
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  transaction['type']! as String,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isCredit ? Colors.green : Colors.red),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date: ${transaction['date']}",
                  style: TextStyle(
                      fontSize: 12,
                      color: themedColor(Get.context!, (c) => c.text2Color))),
              Text(transaction['status']! as String,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: transaction['status'] == 'Completed'
                          ? Colors.green
                          : Colors.orange)),
            ],
          ),
        ],
      ),
    );
  }
}
