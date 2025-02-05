import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/payment_controller.dart';
import 'address_text_field.dart';

class CardInfoForm extends GetView<PaymentController> {
  const CardInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Column(
        children: [
          AddressTextField(
              textEditingController: controller.bCardNumberTextController,
              hint: "card_number_hint"),
          Row(
            children: [
              Expanded(
                child: AddressTextField(
                    textEditingController: controller.bExpireTextController,
                    hint: "MM/YY*"),
              ),
              AppRatioSpaces.horizontalSectionSpaceXXS(),
              Expanded(
                child: AddressTextField(
                    textEditingController: controller.bCVVController,
                    hint: "CCV*"),
              ),
            ],
          ),
          AddressTextField(
              textEditingController: controller.bZipCodeController,
              hint: "zip_code_hint"),
        ],
      ),
    );
  }
}
