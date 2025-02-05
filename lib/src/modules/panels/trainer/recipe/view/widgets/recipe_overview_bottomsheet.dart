

import 'package:quill_html_editor/quill_html_editor.dart';
import '../../../../../../core/app_export.dart';
import '../../controllers/trainer_add_recipe_controller.dart';

class RecipeAddOverviewBottomsheet extends GetView<TrainerAddRecipeController>{
  const RecipeAddOverviewBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .brightness == Brightness.light
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
              color: Theme
                  .of(context)
                  .brightness == Brightness.light
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
                      "add_overview_lbl".tr,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyleX.subHeading1(context).copyWith(
                        fontSize: AppTextSizes
                            .titleText5(),),
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
                        color: Theme
                            .of(context)
                            .brightness ==
                            Brightness.light
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
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.boarderBlueGrey),
                borderRadius: BorderRadius.circular(12)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  ToolBar(
                    toolBarColor: Theme
                        .of(context)
                        .brightness == Brightness.light
                        ? AppColor.primary.withOpacity(0.15) : AppColor
                        .primary.withOpacity(0.25),
                    activeIconColor: AppColor.primary,
                    padding: const EdgeInsets.all(8),
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    iconSize: 20,
                    controller: controller.overviewDescriptionController,
                  ),
                  SizedBox(
                    height: AppRatioSize.getRatioHeight() / 2.2,
                    width: Get.width,
                    child: QuillHtmlEditor(
                        text: controller.overviewDescription.text,
                        hintText: '  ${'item_overview_hint'.tr}',
                        controller: controller.overviewDescriptionController,
                        isEnabled: true,
                        minHeight: 300,
                        textStyle: TextStyleX.subHeading1(context).copyWith(
                          fontSize: AppTextSizes.headerText2(),
                        ),
                        hintTextStyle: TextStyleX.subHeading1(context).copyWith(
                          color: AppColor.lightBlueGrey,
                          fontSize: AppTextSizes.headerText2(),
                        ),
                        hintTextAlign: TextAlign.start,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        hintTextPadding: EdgeInsets.zero,
                        backgroundColor: Theme
                            .of(context)
                            .brightness == Brightness.light
                            ? AppColor.textFieldBackground : AppColor
                            .blackShade,
                        onFocusChanged: (hasFocus) =>
                            debugPrint('has focus $hasFocus'),
                        onTextChanged: (text) {

                          controller.overviewDescription.text = text;

                        },
                        onEditorCreated: () =>
                            debugPrint('Editor has been loaded'),
                        onEditorResized: (height) =>
                            debugPrint('Editor resized $height'),
                        onSelectionChanged: (sel) =>
                            debugPrint('${sel.index},${sel.length}')
                    ),
                  ),
                ],
              ),
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
          color: Theme
              .of(context)
              .brightness == Brightness.light
              ? AppColor.white : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme
                  .of(context)
                  .brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1) : AppColor.white
                  .withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: _bottomNavBarSaveChangesButtons(context)
    );
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
                  Navigator.pop(context);
                },
                text: "cancel_lbl",
                fontSize: AppTextSizes.headerText1(),
                buttonWidth: double.infinity,
                boarderRadius: 8,
                txtColor: AppColor.primary,
                primary: false,
              )
          ),
          AppRatioSpaces.horizontalSectionSpaceXS(),
          Expanded(
              child:
              AppButton(
                action: () {
                  _overviewTextAssigning();
                  Navigator.pop(context);

                },
                text: "save_btn_lbl",
                fontSize: AppTextSizes.headerText1(),
                buttonWidth: double.infinity,
                boarderRadius: 8,
                txtColor: AppColor.white,
              )
          ),
        ],
      ),
    );
  }

  void _overviewTextAssigning()async{
    controller.overviewText.value =
    await  controller.overviewDescriptionController.getPlainText();
    controller.overviewText.refresh();
  }
}