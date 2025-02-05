import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/payment_controller.dart';
import 'address_text_field.dart';

class BillingAddressForm extends GetView<PaymentController> {
  const BillingAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppRatioSpaces.verticalSectionSpaceXS(),
        const AppSectionTitle(
          title: "billing_address_lbl",
          showViewAll: false,
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: Column(
            children: [
              AddressTextField(
                  textEditingController: controller.bFullNameTextController,
                  hint: "full_name_hint"),
              AddressTextField(
                  textEditingController: controller.bEmailTextController,
                  hint: "email_address_hint"),
              AddressTextField(
                  textEditingController: controller.bCountryTextController,
                  hint: "country_hint"),
              Row(
                children: [
                  Expanded(
                    child: AddressTextField(
                        textEditingController: controller.bStateTextController,
                        hint: "state_province_hint"),
                  ),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Expanded(
                    child: AddressTextField(
                        textEditingController: controller.bZipTextController,
                        hint: "zip_code_hint"),
                  ),
                ],
              ),
              AddressTextField(
                  textEditingController: controller.bAddressController,
                  hint: "Address (Ex: 326, Hoffman Avenue, New Your"),
              AddressTextField(
                  textEditingController: controller.bPhoneController,
                  hint: "phone_number_hint"),
            ],
          ),
        ),
      ],
    );
  }
}
