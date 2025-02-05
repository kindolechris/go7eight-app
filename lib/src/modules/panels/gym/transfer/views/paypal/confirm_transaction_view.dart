import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../controllers/gym_transfer_controllers.dart';
import 'package:go7eight/src/core/app_export.dart';

import '../widgets/pin_bottom_sheet.dart';

class ConfirmPaypalTransactionView extends GetView<GYMTransferController> {
  const ConfirmPaypalTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: false,
          title: "confirm_transaction_title",
          showLeading: true
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
              AppContainerWidget(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 44),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppRatioSpaces.verticalSectionSpaceM(),
                      Container(
                        height: AppRatioSize.getRatioWidth() / 5,
                        width: AppRatioSize.getRatioWidth() / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width),
                          border: Border.all(
                              color: AppColor.lightBlueGrey.withOpacity(0.25)),
                          image: const DecorationImage(
                              image: AssetImage(AppIcon.paypal2Icon),
                              fit: BoxFit.contain),
                        ),
                      ),
                      AppRatioSpaces.verticalSectionSpaceS(),
                      Divider(
                        color: AppColor.primary.withOpacity(0.8),
                      ),
                      AppRatioSpaces.verticalSectionSpaceS(),
                      _detailItemWidget(context,
                          itemKey: "card_holder_name_lbl",
                          itemValue: "Mr Baker"),
                      _detailItemWidget(context,
                          itemKey: "payment_via_lbl", itemValue: "Paypal"),
                      _detailItemWidget(context,
                          itemKey: "card_no_lbl",
                          itemValue: controller.cardNoTextController.text),
                      _detailItemWidget(context,
                          itemKey: "amount_lbl",
                          itemValue:
                              "\$${controller.amountTextController.text}"),
                    ],
                  ),
                ),
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

  Widget _detailItemWidget(BuildContext context,
      {required String itemKey, required String itemValue}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemKey.tr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading3(context).copyWith(
              color: AppColor.lightBlueGrey,
            ),
          ),
          Text(
            itemValue.tr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading3(context),
          )
        ],
      ),
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
            action: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                isDismissible: false,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const PinCodeBottomSheet(isBankPayment: false),
                  );
                },
              );
            },
            text: "lbl_btn_confirm",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }
}
