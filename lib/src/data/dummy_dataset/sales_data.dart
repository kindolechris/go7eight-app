import 'package:go7eight/src/data/dummy_dataset/session_data_by_category.dart';
import 'package:intl/intl.dart';

import '../../models/sale_history_model.dart';
import 'challenge_data_by_category.dart';

List<SaleHistoryModel> getSaleHistoryData() {
  final List<SaleHistoryModel> saleHistories = [
    SaleHistoryModel(
        id: 0,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "23.55",
        session: getNutritionSessionListData()[0],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 1,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "18.99",
        session: getNutritionSessionListData()[5],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 2,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "12.50",
        session: getGymSessionListData()[2],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 3,
        isSessionType: false,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "66.80",
        challenge: getHIITChallengeListData()[3],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 4,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "29.00",
        session: getNutritionSessionListData()[0],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 5,
        isSessionType: false,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "48.99",
        challenge: getNutritionChallengeListData()[1],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 6,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "32.00",
        session: getGymSessionListData()[2],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 7,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "25.00",
        session: getGymSessionListData()[3],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 8,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "9.99",
        session: getCardioSessionListData()[0],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 9,
        isSessionType: false,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "72.50",
        challenge: getCardioChallengeListData()[2],
        successStatus: true
    ),
    SaleHistoryModel(
        id: 10,
        isSessionType: true,
        date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
        time:DateFormat('hh:mm').format(DateTime.now()),
        amount: "18.99",
        session: getDietSessionListData()[2],
        successStatus: true
    ),

  ];

  return saleHistories;
}