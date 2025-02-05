import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';

Future rejectRepublishRequest(BuildContext context, String type) {
  return actionsAlertBox(
      context: context,
      title: "${"reject_message".tr} ${type.tr}?",
      description: "",
      icon: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.grey.withOpacity(0.2)),
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.block_outlined,
                color: AppColor.darkGrey,
                size: AppRatioSize.getRatioWidth() / 12,
              )),
        ],
      ),
      buttonWidget: SizedBox(
        height: AppRatioSize.getRatioHeight() / 18,
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
                  Navigator.pop(context);
                  SnackBarX.showWarning(
                      title: "${type.tr} ${"rejection_snack_title".tr}",
                      message:
                          "${type.tr} ${"reject_snack_message_one".tr}");
                },
                text: "lbl_btn_confirm",
              ),
            ),
          ],
        ),
      ));
}
