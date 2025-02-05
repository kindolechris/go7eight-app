import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/animated_alert_dialog.dart';

import '../../controllers/challenge_detail_controller.dart';

class BottomChallengeActionButton extends GetView<ChallengeController> {
  final String alertTitle;
  final String? alertDesc;
  final String alertbuttonText;
  final String alertIconPath;
  final String alertPrimaryText;
  final void Function() alertPrimaryAction;
  final String alertSecondaryText;
  final void Function() alertSecondaryAction;

  const BottomChallengeActionButton(
      {super.key, required this.alertTitle,
      this.alertDesc,
      required this.alertbuttonText,
      required this.alertIconPath,
      required this.alertPrimaryText,
      required this.alertPrimaryAction,
      required this.alertSecondaryText,
      required this.alertSecondaryAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AppButton(
          action: () {
            _openAlertBox(
                context: context,
                title: alertTitle,
                description: alertDesc ?? "",
                icon: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(alertIconPath)),
                  ],
                ),
                buttonWidget: SizedBox(
                  height: AppRatioSize.getRatioHeight() / 18,
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          action: alertSecondaryAction,
                          text: alertSecondaryText,
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
                          action: alertPrimaryAction,
                          text: alertPrimaryText,
                        ),
                      ),
                    ],
                  ),
                ));
          },
          text: alertbuttonText,
          fontSize: AppTextSizes.headerText1(),
          buttonWidth: double.infinity,
          boarderRadius: 8,
          txtColor: AppColor.white,
        )),
      ],
    );
  }

  Future _openAlertBox(
      {required BuildContext context,
      required Widget icon,
      required Widget buttonWidget,
      required String title,
      required String description}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: AppColor.black.withOpacity(0.7),
        builder: (_) {
          return AnimatedAlertDialog(
            title: title,
            description: description,
            icon: icon,
            titleColor: AppColor.primary,
            buttonWidget: buttonWidget,
          );
        });
  }
}
