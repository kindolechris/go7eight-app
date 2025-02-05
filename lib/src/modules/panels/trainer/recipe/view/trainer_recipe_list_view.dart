import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/animated_alert_dialog.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../../global_widgets/recipe_widget.dart';
import '../controllers/trainer_recipe_controller.dart';

class TrainerRecipeView extends GetView<TrainerRecipeController> {
  const TrainerRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: true,
          title: "recipes_lbl",
          iconAction: controller.onAddRecipe),
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
              AppRatioSpaces.verticalSectionSpaceXXS(),
              Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.recipes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.gotoRecipeDetailsView(
                              recipe: controller.recipes[index],
                              isCreate: false);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: AppRatioSize.getRatioWidth() / 32,
                          ),
                          child: RecipeWidget(
                            addAction: () {
                              _openAlertBox(
                                  context: context,
                                  title: "recipe_remove_message",
                                  description: "",
                                  icon: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(2),
                                          child: Image.asset(
                                            AppIcon.deleteAlertIcon,
                                            scale: 2.5,
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
                                            btnColor:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? AppColor.textBlueGrey
                                                    : AppColor.white,
                                            primary: false,
                                            txtColor:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? AppColor.textBlueGrey
                                                    : AppColor.white,
                                          ),
                                        ),
                                        AppRatioSpaces
                                            .horizontalSectionSpaceS(),
                                        Expanded(
                                          child: AppButton(
                                            action: () {
                                              controller.recipes.remove(
                                                  controller.recipes[index]);
                                              Navigator.pop(context);
                                            },
                                            text: "lbl_btn_confirm",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                            recipe: controller.recipes[index],
                            width: Get.width,
                            isTrainerView: true,
                          ),
                        ),
                      );
                    });
              }),
              AppRatioSpaces.verticalSectionSpaceXXS(),
            ],
          )),
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
