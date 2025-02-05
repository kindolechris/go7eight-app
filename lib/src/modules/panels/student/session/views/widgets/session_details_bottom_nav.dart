import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/session_controllers.dart';
import 'session_schedule_bottom_sheet.dart';

class SessionDetailsBottomNav extends GetView<SessionController> {
  final bool mySession;

  const SessionDetailsBottomNav({super.key, required this.mySession});
  @override
  Widget build(BuildContext context) {
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
      child: mySession == false
          ? _bottomNavBarPurchaseButtons(context)
          : Obx(() {
              return controller.videoIsReady.value
                  ? _videoIsReadyBottomSheet()
                  : _videoIsNotReadyBottomSheet(context);
            }),
    );
  }

  _videoIsNotReadyBottomSheet(BuildContext context) {
    return Row(
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
              builder: (context) {
                return const SessionBookingBottomSheet();
              },
            );
          },
          text: "schedule_lbl",
          fontSize: AppTextSizes.headerText1(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
          primary: false,
          txtColor: AppColor.primary,
        )),
        AppRatioSpaces.horizontalSectionSpaceXS(),
        Expanded(
            child: AppButton(
          action: controller.gotoSessionCounterView,
          text: "get_ready_lbl",
          fontSize: AppTextSizes.headerText1(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
          txtColor: AppColor.white,
        )),
      ],
    );
  }

  Widget _bottomNavBarPurchaseButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$${23.25}".tr,
                textAlign: TextAlign.start,
                style: TextStyleX.header6(context).copyWith(
                  color: AppColor.primary,
                ),
              ),
              Text(
                "total_lbl".tr,
                textAlign: TextAlign.start,
                style: TextStyleX.subHeading2(context),
              ),
            ],
          ),
          AppRatioSpaces.horizontalSectionSpaceS(),
          Expanded(
              child: AppButton(
            action: controller.gotoCartView,
            text: "add_to_cart",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }

  _videoIsReadyBottomSheet() {
    return Row(
      children: [
        Expanded(
            child: AppButton(
          action: controller.sessionIsCompleted,
          text: "complete_lbl",
          fontSize: AppTextSizes.headerText1(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
          txtColor: AppColor.white,
        )),
      ],
    );
  }
}
