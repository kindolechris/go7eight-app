
import 'package:go7eight/src/core/app_export.dart';

class ChallengeUnpublishBottomSheet extends StatefulWidget {
  final String actionType;

  const ChallengeUnpublishBottomSheet({super.key, required this.actionType});
  @override
  State<ChallengeUnpublishBottomSheet> createState() =>
      _ChallengeUnpublishBottomSheetState();
}

class _ChallengeUnpublishBottomSheetState
    extends State<ChallengeUnpublishBottomSheet> {
  final TextEditingController _reasonTextEditingController = TextEditingController();
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
            child: AppTextField(
              showLabel: false,
              hintText: "reason_hint".tr,
              controller: _reasonTextEditingController,
              showBoarder: true,
              shadowOpacity: 0,
              maxLine: 20,
              boarderColor: AppColor.boarderBlueGrey,
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              showSuffixIcon: false,
              suffixWidget: Container(),
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
                    txtColor: AppColor.primary,
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceS(),
                Expanded(
                  child: AppButton(
                    action: () {
                      SnackBarX.showSuccess(
                          title: "unpublished_reason_snack_title",
                          message: "${widget.actionType.tr} ${"unpublished_reason_snack_message".tr}");
                      Navigator.pop(context);
                    },
                    text: "lbl_btn_confirm",
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
