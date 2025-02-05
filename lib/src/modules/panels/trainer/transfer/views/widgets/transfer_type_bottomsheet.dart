import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_transfer_controllers.dart';

class TransferMoneyBottomSheet extends GetView<TrainerTransferController> {
  const TransferMoneyBottomSheet({super.key});

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
                    "transfer_money_lbl".tr,
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
            child: Text("transfer_type_selection_lbl".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context)),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 32),
              child: Row(
                children: [
                  Expanded(
                      child: _withdrawalOptionWidget(context,
                          iconPath: AppIcon.bankIcon,
                          text: "bank_lbl", action: () {
                    Navigator.pop(context);
                    controller.gotoBankDetails();
                  })),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  Expanded(
                      child: _withdrawalOptionWidget(context,
                          iconPath: AppIcon.paypalTransferIcon,
                          text: "paypal_lbl", action: () {
                    Navigator.pop(context);
                    controller.gotoPaypalDetails();
                  }))
                ],
              )),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
    );
  }

  Widget _withdrawalOptionWidget(BuildContext context,
      {required String iconPath,
      required String text,
      required Function() action}) {
    return GestureDetector(
      onTap: action,
      child: Container(
          height: AppRatioSize.getRatioHeight() / 8,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.lightBlueGrey.withOpacity(0.1)
                  : AppColor.blackShade,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.lightBlueGrey.withOpacity(0.25)
                    : AppColor.darkGrey,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppRatioSize.getRatioWidth() / 12,
                width: AppRatioSize.getRatioWidth() / 12,
                child: Image.asset(
                  iconPath,
                  color: Theme.of(Get.context!).brightness == Brightness.light
                      ? AppColor.textBlueGrey
                      : AppColor.creamColor,
                ),
              ),
              AppRatioSpaces.verticalSectionSpaceXXXS(),
              Text(
                text.tr,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading3(context),
              ),
            ],
          )),
    );
  }
}
