import 'package:quill_html_editor/quill_html_editor.dart';
import '../../../../../core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/gym_profile_controller.dart';

class GYMTermsNConditionView extends StatefulWidget {
  const GYMTermsNConditionView({super.key});

  @override
  State<GYMTermsNConditionView> createState() => _GYMTermsNConditionViewState();
}

class _GYMTermsNConditionViewState extends State<GYMTermsNConditionView> {
  GYMProfileController controller = Get.find();
  TextEditingController termsNConditionDescription = TextEditingController();
  late QuillEditorController termsNConditionDescriptionController;
  @override
  void initState() {
    termsNConditionDescriptionController = QuillEditorController();
    termsNConditionDescriptionController.onTextChanged((text) {
      debugPrint('listening to $text');
    });
    super.initState();
  }

  @override
  void dispose() {
    termsNConditionDescriptionController.dispose();
    termsNConditionDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        appBar: fitnofyGeneralAppBar(
          context,
          title: "terms_Conditions_lbl",
          showLeading: true,
        ),
        body: Container(
            height: Get.height,
            width: Get.width,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                AppRatioSpaces.verticalSectionSpaceM(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: _textField(context,
                      textEditingController: controller.termsNConditionTitle,
                      labelText: "title_lbl",
                      hint: "title_field_hint"),
                ),
                Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: Text(
                          "description_lbl".tr,
                          style: TextStyleX.subHeading1(context).copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.boarderBlueGrey),
                            borderRadius: BorderRadius.circular(12)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Column(
                            children: [
                              ToolBar(
                                toolBarColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.primary.withOpacity(0.15)
                                    : AppColor.primary.withOpacity(0.25),
                                activeIconColor: AppColor.primary,
                                padding: const EdgeInsets.all(8),
                                alignment: WrapAlignment.center,
                                direction: Axis.horizontal,
                                iconSize: 20,
                                controller:
                                    termsNConditionDescriptionController,
                              ),
                              SizedBox(
                                height: AppRatioSize.getRatioHeight() / 1.7,
                                width: Get.width,
                                child: QuillHtmlEditor(
                                    text: termsNConditionDescription.text,
                                    hintText: '  ${'terms_and_condition_description_hint'.tr}',
                                    controller:
                                        termsNConditionDescriptionController,
                                    isEnabled: true,
                                    minHeight: 300,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? AppColor.textBlueGrey
                                              : AppColor.creamColor,
                                          fontSize: AppTextSizes.headerText2(),
                                        ),
                                    hintTextStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: AppColor.lightBlueGrey,
                                          fontSize: AppTextSizes.headerText2(),
                                        ),
                                    hintTextAlign: TextAlign.start,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    hintTextPadding: EdgeInsets.zero,
                                    backgroundColor:
                                        Theme.of(context).brightness ==
                                                Brightness.light
                                            ? AppColor.textFieldBackground
                                            : AppColor.blackShade,
                                    onFocusChanged: (hasFocus) =>
                                        debugPrint('has focus $hasFocus'),
                                    onTextChanged: (text) {
                                      setState(() {
                                        termsNConditionDescription.text = text;
                                      });
                                    },
                                    onEditorCreated: () =>
                                        debugPrint('Editor has been loaded'),
                                    onEditorResized: (height) =>
                                        debugPrint('Editor resized $height'),
                                    onSelectionChanged: (sel) => debugPrint(
                                        '${sel.index},${sel.length}')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
            // PreferenceView(isEditMode: true,)
            ),
        bottomNavigationBar: _bottomNavBarButton(),
      ),
    );
  }

  Widget _textField(BuildContext context,
      {required TextEditingController textEditingController,
      required String hint,
      required String labelText}) {
    return AppTextField(
      hintText: hint.tr,
      controller: textEditingController,
      showLabel: true,
      labelText: labelText.tr,
      shadowOpacity: 0,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showBoarder: true,
      boarderColor: AppColor.boarderBlueGrey,
    );
  }

  _bottomNavBarButton() {
    return Container(
      margin: EdgeInsets.only(
        left: AppRatioSize.getRatioWidth() / 24,
        right: AppRatioSize.getRatioWidth() / 24,
        bottom: AppRatioSize.getRatioHeight() / 44,
        top: AppRatioSize.getRatioHeight() / 88,
      ),
      child: AppButton(
        action: controller.onTermsNConditionSave,
        text: "lbl_btn_change",
        fontSize: AppTextSizes.headerText(),
        buttonWidth: double.infinity,
        boarderRadius: 8,
      ),
    );
  }
}
