import 'package:go7eight/src/data/dummy_dataset/payment_option_data.dart';
import 'package:go7eight/src/models/payment_option_model.dart';
import 'package:go7eight/src/modules/panels/student/payment/views/billing_address_view.dart';
import 'package:go7eight/src/modules/panels/student/payment/views/card_info_view.dart';
import 'package:go7eight/src/modules/panels/student/root/bindings/root_binding.dart';
import 'package:go7eight/src/modules/panels/student/root/views/root_view.dart';

import '../../../../../core/app_export.dart';

class PaymentController extends GetxController {
  RxList<PaymentOptionModel> paymentOptions = <PaymentOptionModel>[].obs;
  TextEditingController bFullNameTextController = TextEditingController();
  TextEditingController bEmailTextController = TextEditingController();
  TextEditingController bCountryTextController = TextEditingController();
  TextEditingController bStateTextController = TextEditingController();
  TextEditingController bZipTextController = TextEditingController();
  TextEditingController bAddressController = TextEditingController();
  TextEditingController bPhoneController = TextEditingController();

  TextEditingController dFullNameTextController = TextEditingController();
  TextEditingController dEmailTextController = TextEditingController();
  TextEditingController dCountryTextController = TextEditingController();
  TextEditingController dStateTextController = TextEditingController();
  TextEditingController dZipTextController = TextEditingController();
  TextEditingController dAddressController = TextEditingController();
  TextEditingController dPhoneController = TextEditingController();

  TextEditingController bCardNumberTextController = TextEditingController();
  TextEditingController bExpireTextController = TextEditingController();
  TextEditingController bCVVController = TextEditingController();
  TextEditingController bZipCodeController = TextEditingController();

  RxBool isDeliveryAndBillingAddressSame = false.obs;
  RxBool saveMyCard = false.obs;
  @override
  void onInit() async {
    paymentOptions.value = getPaymentOptionData();
    super.onInit();
  }

  onPaymentOptionSelection(PaymentOptionModel paymentOptionModel) {
    List<PaymentOptionModel> tempPaymentOptionList = <PaymentOptionModel>[];
    for (var pOption in paymentOptions) {
      if (pOption == paymentOptionModel) {
        pOption.isSelected = true;
      } else {
        pOption.isSelected = false;
      }
      tempPaymentOptionList.add(pOption);
    }
    paymentOptions.value = tempPaymentOptionList;
  }

  gotoAddressForm() {
    Get.to(() => const BillingAddressView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoCardForm() {
    Get.to(() => const CardInfoView(),
        duration: const Duration(milliseconds: 500), transition: Transition.fadeIn);
  }

  gotoHome() {
    Get.offAll(() => StudentRootView(),
        binding: RootBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  deliverySameAsBilling() {
    isDeliveryAndBillingAddressSame.value =
        !isDeliveryAndBillingAddressSame.value;
    if (isDeliveryAndBillingAddressSame.value) {
      dFullNameTextController.text = bFullNameTextController.text;
      dEmailTextController.text = bEmailTextController.text;
      dCountryTextController.text = bCountryTextController.text;
      dStateTextController.text = bStateTextController.text;
      dZipTextController.text = bZipTextController.text;
      dAddressController.text = bAddressController.text;
      dPhoneController.text = bPhoneController.text;
    } else {
      dFullNameTextController.text = "";
      dEmailTextController.text = "";
      dCountryTextController.text = "";
      dStateTextController.text = "";
      dZipTextController.text = "";
      dAddressController.text = "";
      dPhoneController.text = "";
    }
  }

  saveMyCardCheck() {
    saveMyCard.value = !saveMyCard.value;
    if (saveMyCard.value) {
      SnackBarX.showSuccess(
          title: "card_save_snack_title", message: "card_stored_snack_message");
    } else {
      SnackBarX.showWarning(
          title: "card_save_snack_title", message: "card_remove_snack_message");
    }
  }
}
