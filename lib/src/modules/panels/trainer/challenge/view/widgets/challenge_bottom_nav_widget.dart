import 'package:go7eight/src/core/app_export.dart';
import '../../controllers/trainer_challenge_controller.dart';

class BottomChallengeNavWidget extends GetView<TrainerChallengeListController> {
  final bool isReadyToPublish;

  const BottomChallengeNavWidget({super.key, required this.isReadyToPublish});

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
        child: _bottomNavBarPurchaseButtons(context));
  }

  Widget _bottomNavBarPurchaseButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: isReadyToPublish
                ? () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                    SnackBarX.showSuccess(
                        title: "challenge_publish_snack_title",
                        message: "challenge_publish_snack_message");
                  }
                : controller.onChallengeEditClick,
            text: isReadyToPublish ? "publish_lbl" : "edit_btn_lbl",
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
