import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/animated_alert_dialog.dart';
import 'package:go7eight/src/modules/panels/global_widgets/macro_widget.dart';

class QuickMacroWidget extends StatelessWidget {
  const QuickMacroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                  onTap: () {
                    _openAlertBox(
                      context: context,
                      title: "weekly_workout_lbl",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. It has been the industry's standard dummy text ever since the 1500s",
                      icon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.green.withOpacity(0.25)),
                            child: Image.asset(
                              AppIcon.workoutIcon,
                              color: AppColor.green,
                              scale: 0.7,
                              width: AppRatioSize.getRatioHeight() / 24,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: const MacroWidget(
                      iconPath: AppIcon.workoutIcon,
                      iconColor: AppColor.green,
                      macroLabel: "weekly_workout_lbl",
                      macroValue: "59",
                      macroUnit: "m"))),
          AppRatioSpaces.horizontalSectionSpaceS(),
          Expanded(
              child: InkWell(
                  onTap: () {
                    _openAlertBox(
                      context: context,
                      title: "calories_burned_lbl",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting system. It has been the industry's standard dummy text ever since the 1500s",
                      icon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.red.withOpacity(0.25)),
                            child: Image.asset(
                              AppIcon.burnIcon,
                              color: AppColor.red,
                              scale: 0.7,
                              width: AppRatioSize.getRatioHeight() / 24,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: const MacroWidget(
                      iconPath: AppIcon.burnIcon,
                      iconColor: AppColor.red,
                      macroLabel: "calories_burned_lbl",
                      macroValue: "178",
                      macroUnit: "cal"))),
        ],
      ),
    );
  }

  Future _openAlertBox(
      {required BuildContext context,
      required Widget icon,
      required String title,
      required String description}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: AppColor.black.withOpacity(0.7),
        builder: (_) {
          return AnimatedAlertDialog(
              title: title, description: description, icon: icon);
        });
  }
}
