import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import '../../controllers/challenge_detail_controller.dart';
import 'challenge_bottom_action_button.dart';

class BottomChallengeNavWidget extends GetView<ChallengeController> {
  final bool isPurchased;
  final SessionType sessionType;

  const BottomChallengeNavWidget(
      {super.key, required this.isPurchased, required this.sessionType});

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
      child: isPurchased == false
          ? _bottomNavBarPurchaseButtons(context)
          : Obx(() {
              return controller.challengeHasStarted.value
                  ? _onGoingChallengeBottomSheet(context)
                  : _startChallengeBottomSheet(context);
            }),
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

  _onGoingChallengeBottomSheet(BuildContext context) {
    return BottomChallengeActionButton(
      alertTitle: "challenge_complete_confirmation",
      alertbuttonText: "complete_lbl",
      alertIconPath: AppIcon.challengeStartWarningIcon,
      alertPrimaryText: "lbl_btn_confirm",
      alertPrimaryAction: controller.challengeCompleted,
      alertSecondaryText: "cancel_lbl",
      alertSecondaryAction: () {
        Navigator.pop(context);
      },
    );
  }

  _startChallengeBottomSheet(BuildContext context) {
    return BottomChallengeActionButton(
      alertTitle: "challenge_start_confirmation",
      alertDesc: "challenge_progress_deletion",
      alertbuttonText: "start_challenge_lbl",
      alertIconPath: AppIcon.challengeStartWarningIcon,
      alertPrimaryText: "lbl_btn_confirm",
      alertPrimaryAction: () {
        if (sessionType == SessionType.regular) {
          controller.allChallengeSessions.value = controller.challengeSessions;

        } else {
          controller.allChallengeSessions.value =
              controller.challengeNutritionSessions;

        }

        Navigator.pop(context);
        controller.challengeHasStarted.value = true;
        SnackBarX.showSuccess(
            title: "challenge_began_snack_title",
            message: "challenge_began_snack_message");
      },
      alertSecondaryText: "cancel_lbl",
      alertSecondaryAction: () {
        Navigator.pop(context);
      },
    );
  }
}
