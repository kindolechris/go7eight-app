import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:go7eight/src/core/utils/snackbar.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_tags.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_video_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/data/dummy_dataset/transaction_data.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/sale_history_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/models/transaction_model.dart';

import '../views/bank/bank_details_view.dart';
import '../views/bank/confirm_transaction_view.dart';
import '../views/bank/enter_amount_view.dart';
import '../views/e_receipt_view.dart';
import '../views/paypal/confirm_transaction_view.dart';
import '../views/paypal/enter_amount_view.dart';
import '../views/paypal/paypal_details_view.dart';

class TrainerTransferController extends GetxController {
  final Random _randomGen = Random();
  TextEditingController accountHolderNameTextController =
      TextEditingController();
  TextEditingController bankNameTextController = TextEditingController();
  TextEditingController accountNoTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();

  TextEditingController pinCodeTextController = TextEditingController();
  TextEditingController cardNoTextController = TextEditingController();
  TextEditingController cardHolderNameTextController = TextEditingController();
  TextEditingController expiryTextController = TextEditingController();
  TextEditingController cvvTextController = TextEditingController();
  RxDouble accountMainBalance = 99678.86.obs;
  final ScreenshotController screenshotController = ScreenshotController();
  List<TransactionHistoryModel> transactionHistories =
      getTransactionHistoryData();
  List<SaleHistoryModel> saleHistories = <SaleHistoryModel>[];

  gotoBankDetails() {
    Get.to(() => const BankDetailsView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoBankAmountView() {
    amountTextController.text == "";
    Get.to(() => const BankEnterAmountViewView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoPaypalAmountView() {
    amountTextController.text == "";
    Get.to(() => const PaypalEnterAmountViewView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoEReceiptView(bool isBankPayment) {
    Get.to(() => EReceiptView(isBankPayment: isBankPayment),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoTransactionView() {
    Get.to(() => const ConfirmTransactionView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoPaypalTransactionView() {
    Get.to(() => const ConfirmPaypalTransactionView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoPaypalDetails() {
    Get.to(() => const PaypalDetailsView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  @override
  void onInit() {
    amountTextController.addListener(() {
      try {
        final double withdrawingAmount =
            double.parse(amountTextController.text);
        const double accountMainBalanceTotal = 99678.86;
        if (accountMainBalance >= withdrawingAmount) {
          accountMainBalance.value =
              accountMainBalanceTotal - withdrawingAmount;
        } else if (amountTextController.text.isEmpty) {
          accountMainBalance.value = accountMainBalanceTotal;
        } else {
          accountMainBalance.value = accountMainBalanceTotal;
        }
      } catch (e) {
        accountMainBalance.value = 99678.86;
      }
    });
    super.onInit();
    saleHistories = List.generate(22, (index) {
      return SaleHistoryModel(
        id: index,
        amount:
            "${_randomGen.nextInt(85).toString()}.${_randomGen.nextInt(99).toString()}",
        isSessionType: index % 2 == 0 ? true : false,
        date:
            DateFormat('MM/dd/yyyy').format(DateTime.now().subtract(Duration(days: index))),
        time:
            DateFormat('hh:mm').format(DateTime.now().subtract(Duration(hours: index * 2))),
        successStatus: index % 6 == 0 ? false : true,
        session: SessionModel(
            id: index,
            imagePath: sessionTrainingImageGet(id: 7 + index),
            videoUrl: sessionTrainingVideoGet(id: 14 + index),
            title: sessionTrainingTitleGet(id: 21 + index),
            desc: "",
            caloriesToBurn: "${150 + index}",
            duration: "${15 + index}",
            bre: "Bre",
            price: "${23 + index}",
            tags: List.generate(
                5,
                (tagIndex) => ProductTagModel(
                    id: tagIndex,
                    tag: getSessionTagNames(id: tagIndex + index + 5))),
            trainer: TrainerModel(
                id: index,
                imagePath: trainerImageGet(id: 11 + index),
                name: trainerNameGet(id: 11 + index),
                type: "Fitness Trainer"),
            rating: SessionRatingModel(
                id: index, rating: "4.8", totalCount: "${200 + index}")),
        challenge: ChallengeModel(
            id: index,
            imagePath: challengeTrainingImageGet(id: index + 4),
            title: sessionTrainingTitleGet(id: 8 + index),
            desc: "",
            trainer: TrainerModel(
                id: index,
                imagePath: trainerImageGet(id: 31 + index),
                name: trainerNameGet(id: index),
                type: "Fitness Trainer"),
            duration: "${15 + index}",
            timeRange: "15-30",
            isBookMarked: false,
            totalMembers: "${index + 9}K+",
            workoutFocus: "Full Body",
            workoutType: "Gym",
            price: "${150 + index}",
            tags: List.generate(
                5,
                (tagIndex) => ProductTagModel(
                    id: tagIndex,
                    tag: getSessionTagNames(id: tagIndex + index + 5))),
            rating: ChallengeRatingModel(
                id: index, rating: "4.2", totalCount: "${200 + index}")),
        trainer: TrainerModel(
            id: index,
            imagePath: trainerImageGet(id: 31 + index),
            name: trainerNameGet(id: index),
            type: "Fitness Trainer"),
      );
    });
  }

  onScreenshot() async {
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final directory = await _findLocalPath();
        final imagePath =
            '$directory/screenshot_${DateFormat('MM_dd_yyyy_mm_ss').format(DateTime.now())}.png';

        File imageFile = File(imagePath);
        await imageFile.writeAsBytes(image);
        SnackBarX.showSuccess(
            title: "save_e_receipt_snack_title",
            message: "save_e_receipt_snack_message");
      }
    });
  }

  Future<String?> _findLocalPath() async {
    if (Platform.isAndroid) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }
}
