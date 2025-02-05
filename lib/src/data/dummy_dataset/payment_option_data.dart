

import '../../core/app_export.dart';
import '../../models/payment_option_model.dart';

List<PaymentOptionModel> getPaymentOptionData() {
  final List<PaymentOptionModel> paymentOptions = [
    PaymentOptionModel(
      id: 0,
      name: "Debit or credit card",
      desc: "",
      iconPath: AppIcon.visaPayIcon,
    ),
    PaymentOptionModel(
      id: 1,
      name: "Apple Pay",
      desc: "",
      iconPath: AppIcon.applePayIcon,
    ),
    PaymentOptionModel(
      id: 2,
      name: "Google",
      desc: "",
      iconPath: AppIcon.googlePayIcon,
    ),
    PaymentOptionModel(
      id: 3,
      name: "Pay Pal",
      desc: "",
      iconPath: AppIcon.payPalIcon,
    ),

  ];

  return paymentOptions;
}