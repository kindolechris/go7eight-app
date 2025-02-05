import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';

class ChallengeAdminMessageBottomSheet extends StatefulWidget {
  final String actionType;
  final int index;

  const ChallengeAdminMessageBottomSheet({
    super.key,
    required this.actionType,
    required this.index,
  });
  @override
  State<ChallengeAdminMessageBottomSheet> createState() =>
      _ChallengeAdminMessageBottomSheetState();
}

class _ChallengeAdminMessageBottomSheetState
    extends State<ChallengeAdminMessageBottomSheet> {
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
                "Reason".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.blackShade
                          : AppColor.creamColor,
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
              "Hello Admin,"
              "\n\nI hope this message finds you well."
              "\nI would like to submit this update for my session with the necessary changes that addresses the feedback from quality improvement as well as from our present clients."
              "\nI am committed to providing the best possible user experience for my clients, and this update reflects my dedication to continuous improvement."
              "\nThank you for your continued support."
              "\n\n\nRegards,"
              "\n${trainerNameGet(id: widget.index)}",
              textAlign: TextAlign.start,
              maxLines: 500,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.textBlueGrey
                        : AppColor.creamColor,
                    fontSize: AppTextSizes.headerText2(),
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
                      SnackBarX.showWarning(
                          title: "${widget.actionType.tr} ${"rejection_snack_title".tr}",
                          message: "${widget.actionType.tr} ${"reject_snack_message".tr}");
                    },
                    text: "reject_lbl",
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
                      SnackBarX.showSuccess(
                          title: "${widget.actionType.tr} ${"republishing_snack_title".tr}",
                          message: "${widget.actionType.tr} ${"republish_snack_message".tr}");
                    },
                    text: "accept_lbl",
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
