import 'package:flutter/services.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../controllers/gym_transfer_controllers.dart';

class PaypalEnterAmountViewView extends GetView<GYMTransferController> {
  const PaypalEnterAmountViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: false, title: "enter_amount_lbl", showLeading: true
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  Text(
                    "paypal_lbl".tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context).copyWith(
                      fontSize: AppTextSizes.headerText(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "654987987541".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading1(context).copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.lightBlueGrey
                                  : AppColor.blueGrey,
                          fontSize: AppTextSizes.headerText2(),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Icon(
                            Icons.fiber_manual_record_rounded,
                            color: AppColor.primary,
                            size: 4,
                          )),
                      Text(
                        "Mr Baker".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading1(context).copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.lightBlueGrey
                                  : AppColor.blueGrey,
                          fontSize: AppTextSizes.headerText2(),
                        ),
                      ),
                    ],
                  ),
                  AppRatioSpaces.verticalSectionSpaceM(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 44),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      // Adjust the border radius as needed
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.primary
                            : AppColor.primary,
                      ), // Adjust the border color as needed
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColor.primary),
                          child: Row(
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: AppColor.white,
                                size: AppRatioSize.getRatioWidth() / 32,
                              ),
                              AppRatioSpaces.horizontalSectionSpaceXXXS(),
                              Text(
                                "USD".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleX.subHeading1(context).copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.white
                                      : AppColor.white,
                                  fontSize: AppTextSizes.headerText4(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppRatioSpaces.horizontalSectionSpaceXS(),
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            controller: controller.amountTextController,
                            cursorColor: AppColor.primary,
                            style: TextStyleX.subHeading1(context).copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColor.blackShade
                                  : AppColor.creamColor,
                              fontSize: AppTextSizes.titleText4(),
                            ),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                border: InputBorder.none,
                                hintText: "amount_lbl".tr,
                                hintStyle:
                                    TextStyleX.subHeading1(context).copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.grey.withOpacity(0.4)
                                      : AppColor.grey.withOpacity(0.6),
                                  fontSize: AppTextSizes.titleText6(),
                                )),
                            keyboardType:
                                const TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^(\d+)?\.?\d{0,2}'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppRatioSpaces.verticalSectionSpaceXS(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${"your_main_balance".tr}:",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading1(context).copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.lightBlueGrey
                                  : AppColor.blueGrey,
                          fontSize: AppTextSizes.headerText1(),
                        ),
                      ),
                      Obx(() {
                        return Text(
                          "\$${controller.accountMainBalance}".tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleX.subHeading1(context).copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.lightBlueGrey
                                    : AppColor.blueGrey,
                            fontSize: AppTextSizes.headerText1(),
                          ),
                        );
                      }),
                    ],
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
            action: controller.gotoPaypalTransactionView,
            text: "Continue",
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
