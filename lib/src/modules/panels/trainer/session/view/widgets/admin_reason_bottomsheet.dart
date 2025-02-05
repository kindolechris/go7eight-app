import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_session_controller.dart';

class SessionAdminReasonBottomSheet extends StatefulWidget {
  final String actionType;
  final int index;

  const SessionAdminReasonBottomSheet({
    super.key,
    required this.actionType,
    required this.index,
  });
  @override
  State<SessionAdminReasonBottomSheet> createState() =>
      _SessionAdminReasonBottomSheetSheetState();
}

class _SessionAdminReasonBottomSheetSheetState
    extends State<SessionAdminReasonBottomSheet> {
  TrainerSessionController controller = Get.find();
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
            child: Container(
              height: 60,
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                "reason_lbl".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context).copyWith(
                  fontSize: AppTextSizes.titleText5(),
                ),
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Text(
              "Hello Trainer,"
              "\n\nI hope this message finds you well."
              "\nI would like to tell you that this session has few video segments that are against our rule and need improvement."
              "\nI am committed to providing the best possible experience to all the clients in this platform, and this quality assurance is just a part of that."
              "\nPlease make the necessary changes and resubmit. I would be happy to review your session again."
              "\n\n\nRegards,"
              "\nAdmin",
              textAlign: TextAlign.start,
              maxLines: 500,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading3(context).copyWith(
                fontSize: AppTextSizes.headerText3(),
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceMF(),
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
                    text: "close_lbl",
                    primary: false,
                    txtColor: AppColor.grey,
                    btnColor: AppColor.grey,
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceS(),
                Expanded(
                  child: AppButton(
                    action: () {
                      Navigator.pop(context);
                      controller.onSessionAddClick();
                    },
                    text: "edit_btn_lbl",
                    btnColor: AppColor.primary,
                    txtColor: AppColor.white,
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
}
