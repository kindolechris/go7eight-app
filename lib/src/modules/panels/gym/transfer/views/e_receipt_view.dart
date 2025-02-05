import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/gym_transfer_controllers.dart';

class EReceiptView extends GetView<GYMTransferController> {
  final bool isBankPayment;
  const EReceiptView({super.key, required this.isBankPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "e_receipt_lbl",
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
              Screenshot(
                controller: controller.screenshotController,
                child: AppContainerWidget(
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
                                color:
                                    AppColor.lightBlueGrey.withOpacity(0.25)),
                            image: DecorationImage(
                                image: AssetImage(isBankPayment
                                    ? AppIcon.bank2Icon
                                    : AppIcon.paypal2Icon),
                                fit: BoxFit.contain),
                          ),
                        ),
                        AppRatioSpaces.verticalSectionSpaceS(),
                        Divider(
                          color: AppColor.primary.withOpacity(0.8),
                        ),
                        AppRatioSpaces.verticalSectionSpaceS(),
                        isBankPayment
                            ? _detailItemWidget(context,
                                itemKey: "account_name_lbl",
                                itemValue:
                                    controller.accountHolderNameTextController.text == "" ? "Mr Baker" : controller.accountHolderNameTextController.text)
                            : _detailItemWidget(context,
                                itemKey: "card_holder_name_lbl",
                                itemValue:
                                    controller.cardHolderNameTextController.text == "" ? "Mr Baker" : controller.cardHolderNameTextController.text),
                        isBankPayment
                            ? _detailItemWidget(context,
                                itemKey: "bank_name_lbl",
                                itemValue: "Bank of America")
                            : _detailItemWidget(context,
                                itemKey: "payment_via_lbl",
                                itemValue: "Paypal"),
                        isBankPayment
                            ? _detailItemWidget(context,
                                itemKey: "account_no_lbl",
                                itemValue:
                                    controller.accountNoTextController.text == "" ? "654987987541" : controller.accountNoTextController.text)
                            : _detailItemWidget(context,
                                itemKey: "card_no_lbl",
                                itemValue:
                                    controller.cardNoTextController.text == "" ? "654987987541" : controller.cardNoTextController.text),
                        _detailItemWidget(context,
                            itemKey: "amount_lbl",
                            itemValue:
                                "\$${controller.amountTextController.text}"),
                        _detailItemWidget(context,
                            itemKey: "transaction_date_lbl",
                            itemValue:
                                DateFormat('MM/dd/yyyy').format(DateTime.now())),
                        _detailItemWidget(context,
                            itemKey: "status_lbl",
                            itemValue: "",
                            status: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "completed_lbl".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleX.subHeading3(context).copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              AppRatioSpaces.verticalSectionSpaceXL(),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 24),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        action: () {
                          Navigator.of(context).popUntil((route) {
                            return route.isFirst;
                          });
                          SnackBarX.showSuccess(
                              title: "money_transfer_lbl",
                              message: "money_transfer_message");
                        },
                        text: "back_to_home_lbl",
                        btnColor:
                            Theme.of(context).brightness == Brightness.light
                                ? AppColor.textBlueGrey
                                : AppColor.grey,
                        primary: false,
                        txtColor:
                            Theme.of(context).brightness == Brightness.light
                                ? AppColor.textBlueGrey
                                : AppColor.grey,
                      ),
                    ),
                    AppRatioSpaces.horizontalSectionSpaceS(),
                    Expanded(
                      child: AppButton(
                        action: () {
                          controller.onScreenshot();
                        },
                        text: "save_on_device_lbl",
                      ),
                    ),
                  ],
                ),
              ),
              AppRatioSpaces.verticalSectionSpaceM(),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }

  Widget _detailItemWidget(BuildContext context,
      {required String itemKey, required String itemValue, Widget? status}) {
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
          status ??
              Text(
                itemValue.tr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context),
              )
        ],
      ),
    );
  }
}
