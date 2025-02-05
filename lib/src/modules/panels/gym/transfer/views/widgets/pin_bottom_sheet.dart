import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:go7eight/src/core/app_export.dart';
import '../../../../global_widgets/open_alert_box.dart';
import '../../controllers/gym_transfer_controllers.dart';

class PinCodeBottomSheet extends GetView<GYMTransferController> {
  final bool isBankPayment;

  const PinCodeBottomSheet({super.key, required this.isBankPayment});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 60,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    "pin_code_confirmation_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context).copyWith(
                      fontSize: AppTextSizes.titleText5(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          right: AppRatioSize.getRatioWidth() / 32),
                      child: Icon(
                        Icons.close,
                        size: AppRatioSize.getRatioWidth() / 16,
                      )),
                )
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 32),
            child: Text(
              "pin_code_confirmation_message".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading1(context).copyWith(
                fontSize: AppTextSizes.titleText8(),
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          _verificationPinField(context),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    action: () {
                      Navigator.pop(context);
                    },
                    text: "cancel_lbl",
                    btnColor: Theme.of(context).brightness == Brightness.light
                        ? AppColor.textBlueGrey
                        : AppColor.grey,
                    primary: false,
                    txtColor: Theme.of(context).brightness == Brightness.light
                        ? AppColor.textBlueGrey
                        : AppColor.grey,
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceS(),
                Expanded(
                  child: AppButton(
                    action: () {
                      // Navigator.pop(context);
                      openAlertBoxDualButton(
                          context: context,
                          title: "transfer_successful_lbl",
                          description: "transfer_successful_message",
                          icon: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.green),
                                child: Icon(Icons.check,
                                    color: AppColor.white,
                                    size: AppRatioSize.getRatioHeight() / 24),
                              ),
                            ],
                          ),
                          buttonText: "e_receipt_lbl",
                          buttonAction: () {
                            controller.gotoEReceiptView(isBankPayment);
                          },
                          button2Text: "back_to_home_lbl",
                          button2Action: () {
                            Navigator.of(context).popUntil((route) {
                              return route.isFirst;
                            });
                            SnackBarX.showSuccess(
                                title: "money_transfer_lbl",
                                message: "money_transfer_message");
                          });
                    },
                    text: "lbl_btn_confirm",
                  ),
                ),
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
    );
  }

  Widget _verificationPinField(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 12),
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: AppColor.lightBlueGrey.withOpacity(0.1),
          activeColor: AppColor.textBlueGrey.withOpacity(0.1),
          selectedFillColor: AppColor.primary.withOpacity(0.1),
          selectedColor: AppColor.primary,
          inactiveColor: AppColor.textBlueGrey.withOpacity(0.1),
          inactiveFillColor: AppColor.lightBlueGrey.withOpacity(0.1),
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        enableActiveFill: true,
        controller: controller.pinCodeTextController,
        onCompleted: (v) {
        },
        onChanged: (value) {
          
        },
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}
