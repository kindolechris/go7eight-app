import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/payment_controller.dart';
import 'address_text_field.dart';

class DeliveryAddressForm extends GetView<PaymentController> {
  const DeliveryAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionTitle(
          title: "delivery_address_lbl",
          showViewAll: false,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: Column(
            children: [
              AddressTextField(
                  textEditingController: controller.dFullNameTextController,
                  hint: "full_name_hint"),
              AddressTextField(
                  textEditingController: controller.dEmailTextController,
                  hint: "email_address_hint"),
              AddressTextField(
                  textEditingController: controller.dCountryTextController,
                  hint: "country_hint"),
              Row(
                children: [
                  Expanded(
                    child: AddressTextField(
                        textEditingController: controller.dStateTextController,
                        hint: "state_province_hint"),
                  ),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Expanded(
                    child: AddressTextField(
                        textEditingController: controller.dZipTextController,
                        hint: "zip_code_hint"),
                  ),
                ],
              ),
              AddressTextField(
                  textEditingController: controller.dAddressController,
                  hint: "Address (Ex: 326, Hoffman Avenue, New Your"),
              AddressTextField(
                  textEditingController: controller.dPhoneController,
                  hint: "phone_number_hint"),
            ],
          ),
        ),
      ],
    );
  }
}
