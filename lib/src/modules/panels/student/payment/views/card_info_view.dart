import 'package:go7eight/src/modules/panels/student/payment/views/widgets/final_payment_bottom_nav.dart';

import '../../../../../core/app_export.dart';
import '../../../global_widgets/app_bar_widget.dart';
import '../controllers/payment_controller.dart';
import 'widgets/card_info_form.dart';

class CardInfoView extends GetView<PaymentController> {
  const CardInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(context,
          showSaveIcon: false, title: "add_address_title"),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
            height: Get.height,
            width: Get.width,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                AppRatioSpaces.verticalSectionSpaceXS(),
                _cardInfoSectionTitle(context),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                const CardInfoForm(),
                AppRatioSpaces.verticalSectionSpaceXS(),
                GestureDetector(
                  onTap: controller.saveMyCardCheck,
                  child: Obx(() {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppRatioSize.getRatioWidth() / 24),
                      child: Row(
                        children: [
                          controller.saveMyCard.value == true
                              ? const Icon(
                                  Icons.check_box_rounded,
                                  color: AppColor.primary,
                                )
                              : const Icon(Icons.check_box_outline_blank_rounded,
                                  color: AppColor.primary),
                          AppRatioSpaces.horizontalSectionSpaceXXS(),
                          Expanded(
                            child: Text(
                              "save_my_card_lbl".tr,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: TextStyleX.subHeading2(context).copyWith(
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                AppRatioSpaces.verticalSectionSpaceL(),
              ],
            )),
      ),
      bottomNavigationBar: const FinalPaymentBottomNav(),
    );
  }

  Widget _cardInfoSectionTitle(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "card_info_lbl".tr,
            textAlign: TextAlign.start,
            style: TextStyleX.subHeading2BlueGrey(context).copyWith(
              fontSize: AppTextSizes.titleText8(),
            ),
          ),
          Image.asset(AppIcon.paymentIcon),
        ],
      ),
    );
  }
}
