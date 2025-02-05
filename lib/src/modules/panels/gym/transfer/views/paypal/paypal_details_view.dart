import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../controllers/gym_transfer_controllers.dart';

class PaypalDetailsView extends GetView<GYMTransferController> {
  const PaypalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: false, title: "paypal_details_lbl", showLeading: true
          ),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceM(),
              _textEditField(
                context,
                label: "card_number_lbl",
                hint: "card_number_payment_hint",
                textEditingController: controller.cardNoTextController,
              ),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              _textEditField(
                context,
                label: "card_holder_name_lbl",
                hint: "card_holder_name_hint",
                textEditingController: controller.cardHolderNameTextController,
              ),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              Row(
                children: [
                  Expanded(
                    child: _textEditField(
                      context,
                      label: "expiry_lbl",
                      hint: "expiry_hint",
                      textEditingController: controller.expiryTextController,
                    ),
                  ),
                  AppRatioSpaces.horizontalSectionSpaceXS(),
                  Expanded(
                    child: _textEditField(
                      context,
                      label: "CVV",
                      hint: "444",
                      textEditingController: controller.cvvTextController,
                    ),
                  ),
                ],
              ),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              AppRatioSpaces.verticalSectionSpaceM(),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
      bottomNavigationBar: _bottomNavBarButtons(context),
    );
  }

  _bottomNavBarButtons(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1)
                  : AppColor.white.withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarNextButtons(context));
  }

  Widget _bottomNavBarNextButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: controller.gotoPaypalAmountView,
            text: "lbl_next",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }

  Widget _textEditField(
    BuildContext context, {
    required String label,
    required String hint,
    required TextEditingController textEditingController,
  }) {
    return AppTextField(
      labelText: label.tr,
      hintText: hint.tr,
      controller: textEditingController,
      showBoarder: true,
      boarderColor: AppColor.boarderBlueGrey,
      shadowOpacity: 0,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
    );
  }
}
