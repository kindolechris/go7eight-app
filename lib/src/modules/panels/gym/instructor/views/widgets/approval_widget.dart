import 'package:go7eight/src/core/app_export.dart';

class ApprovalWidget extends StatefulWidget {
  final String title;

  const ApprovalWidget({super.key, required this.title});

  @override
  State<ApprovalWidget> createState() => _ApprovalWidgetState();
}

class _ApprovalWidgetState extends State<ApprovalWidget> {
  bool _isApproved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title.tr,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading2BlueGrey(context),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isApproved = !_isApproved;
              });
              if (_isApproved) {
                SnackBarX.showSuccess(
                    title: "info_approval_snack_title",
                    message: "info_approval_snack_approve_message");
              } else {
                SnackBarX.showWarning(
                    title: "info_approval_snack_title",
                    message: "info_approval_snack_disapprove_message");
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _isApproved ? AppColor.macroGreen : AppColor.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    _isApproved ? "${"approved_lbl".tr} " : "approve_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading2BlueGrey(context).copyWith(
                      color: AppColor.white,
                      fontSize: AppTextSizes.buttonText4(),
                    ),
                  ),
                  _isApproved
                      ? Image.asset(AppIcon.verifiedIcon,
                          color: AppColor.white, scale: 0.8)
                      : Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
