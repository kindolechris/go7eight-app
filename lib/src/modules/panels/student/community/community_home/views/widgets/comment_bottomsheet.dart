import 'package:go7eight/src/core/app_export.dart';

import '../../controller/community_home_controller.dart';

class CommentBottomsheet extends GetView<CommunityHomeController> {
  const CommentBottomsheet({super.key});

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
              child: Stack(
                children: [
                  Container(
                    height: 60,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Text(
                      "write_a_comment_lbl".tr,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleX.subHeading1(context).copyWith(
                        fontSize: AppTextSizes.titleText5(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          right: AppRatioSize.getRatioWidth() / 44),
                      child: Image.asset(
                        AppIcon.closeIcon,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.blackShade
                            : AppColor.creamColor,
                        scale: 1.2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Column(
              children: [
                _textEditField(
                  context,
                  hint: "comment_post_hint".tr,
                  textEditingController: controller.commentTextController,
                ),
                AppRatioSpaces.verticalSectionSpaceXXS(),
              ],
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
          _bottomNavBarButtons(context)
        ],
      ),
    );
  }

  _bottomNavBarButtons(BuildContext context) {
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
        child: _bottomNavBarSaveChangesButtons(context));
  }

  Widget _bottomNavBarSaveChangesButtons(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppButton(
            action: () {
              SnackBarX.showSuccess(
                  title: "comment_post_snack_title",
                  message: "comment_post_snack_message");
              Navigator.pop(context);
            },
            text: "post_lbl",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }

  Widget _textEditField(
    BuildContext context, {
    required String hint,
    required TextEditingController textEditingController,
  }) {
    return AppTextField(
      hintText: hint.tr,
      controller: textEditingController,
      showBoarder: true,
      showLabel: false,
      shadowOpacity: 0,
      maxLine: 10,
      boarderColor: AppColor.boarderBlueGrey,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
    );
  }
}
