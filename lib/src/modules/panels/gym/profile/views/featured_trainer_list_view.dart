import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';
import 'package:go7eight/src/modules/panels/gym/profile/controllers/gym_profile_controller.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../../global_widgets/gym_trainer_container.dart';
import 'widgets/add_trainer_to_feature.dart';

class GYMFeaturedTrainerView extends GetView<GYMProfileController> {
  const GYMFeaturedTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: true,
          title: "featured_trainers_lbl",
          showLeading: true, iconAction: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AdTrainerToFeatureBottomSheet(),
            );
          },
        );
      }),
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
              AppRatioSpaces.verticalSectionSpaceS(),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.featuredTrainers.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: TrainerContainer(
                              trainer: controller.featuredTrainers[index],
                              showActionButton: true,
                              icon: Icons.delete_outline_rounded,
                              iconBgColor: AppColor.grey.withOpacity(0.15),
                              iconColor: AppColor.grey,
                              imageBorderRadius: Get.width,
                              imageSize: AppRatioSize.getRatioWidth() / 8,
                              iconSize: AppRatioSize.getRatioWidth() / 18,
                              onClickAction: () {
                                actionsAlertBox(
                                    context: context,
                                    title: "feature_trainer_remove_message",
                                    description: "",
                                    icon: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: AppColor.grey
                                                    .withOpacity(0.2)),
                                            padding: const EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.radio_button_checked,
                                              color: AppColor.grey,
                                              size:
                                                  AppRatioSize.getRatioWidth() /
                                                      12,
                                            ))
                                      ],
                                    ),
                                    buttonWidget: SizedBox(
                                      height:
                                          AppRatioSize.getRatioHeight() / 18,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: AppButton(
                                              action: () {
                                                Navigator.pop(context);
                                              },
                                              text: "cancel_lbl",
                                              btnColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColor.textBlueGrey
                                                  : AppColor.grey,
                                              primary: false,
                                              txtColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColor.textBlueGrey
                                                  : AppColor.grey,
                                            ),
                                          ),
                                          AppRatioSpaces
                                              .horizontalSectionSpaceS(),
                                          Expanded(
                                            child: AppButton(
                                              action: () {
                                                Navigator.pop(context);
                                                controller.featuredTrainers
                                                    .remove(controller
                                                            .featuredTrainers[
                                                        index]);
                                                SnackBarX.showSuccess(
                                                    title:
                                                        "featured_trainer_snack_title",
                                                    message:
                                                        "featured_trainer_snack_message");
                                              },
                                              text: "lbl_btn_confirm",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            ),
                          );
                        });
                  }),
                  AppRatioSpaces.verticalSectionSpaceM(),
                ],
              )
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
