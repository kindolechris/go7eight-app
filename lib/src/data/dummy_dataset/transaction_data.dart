import 'package:intl/intl.dart';

import '../../core/app_export.dart';
import '../../models/transaction_model.dart';

List<TransactionHistoryModel> getTransactionHistoryData() {
  final List<TransactionHistoryModel> transactionHistories = [
    TransactionHistoryModel(
        id: 0,
        type: "Paypal",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        iconPath: AppIcon.paypal2Icon,
        amount: "98,621",
      successStatus: true
    ),
    TransactionHistoryModel(
        id: 1,
        type: "Bank of America",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(const Duration(days: 45))),
        time:DateFormat('hh:mm').format(DateTime.now().subtract(const Duration(hours: 4))),
        iconPath: AppIcon.bank2Icon,
        amount: "5,285",
        successStatus: true
    ),
    TransactionHistoryModel(
        id: 2,
        type: "Paypal",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(const Duration(days: 65))),
        time:DateFormat('hh:mm').format(DateTime.now().subtract(const Duration(hours: 2))),
        iconPath: AppIcon.paypal2Icon,
        amount: "621",
        successStatus: true
    ),
    TransactionHistoryModel(
        id: 3,
        type: "Bank of America",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(const Duration(days: 120))),
        time:DateFormat('hh:mm').format(DateTime.now().subtract(const Duration(hours: 8))),
        iconPath: AppIcon.bank2Icon,
        amount: "133,225",
        successStatus: true
    ),
    TransactionHistoryModel(
        id: 4,
        type: "Bank of America",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(const Duration(days: 235))),
        time:DateFormat('hh:mm').format(DateTime.now().subtract(const Duration(hours: 2))),
        iconPath: AppIcon.bank2Icon,
        amount: "6,961",
        successStatus: false
    ),
    TransactionHistoryModel(
        id: 5,
        type: "Paypal",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(const Duration(days: 235))),
        time:DateFormat('hh:mm').format(DateTime.now().subtract(const Duration(hours: 9))),
        iconPath: AppIcon.paypal2Icon,
        amount: "55,000",
        successStatus: true
    ),
    TransactionHistoryModel(
        id: 6,
        type: "Paypal",
        date: DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(const Duration(days: 239))),
        time:DateFormat('hh:mm').format(DateTime.now().subtract(const Duration(hours: 1))),
        iconPath: AppIcon.paypal2Icon,
        amount: "98,021",
        successStatus: true
    ),

  ];

  return transactionHistories;
}