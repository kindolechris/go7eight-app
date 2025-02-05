import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../controllers/gym_profile_controller.dart';

class GYMTrainerListView extends GetView<GYMProfileController> {
  const GYMTrainerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "select_trainer_title",
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
              AppRatioSpaces.verticalSectionSpaceXXXS(),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.trainers.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.featuredTrainers
                                .add(controller.trainers[index]);
                            Navigator.pop(context);
                            SnackBarX.showSuccess(
                                title: "featured_trainer_lbl",
                                message: "featured_trainer_message");
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                              AppRatioSize.getRatioWidth() / 44,
                            ),
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: AppColor.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                AppNetworkImage(
                                    width: AppRatioSize.getRatioWidth() / 7.5,
                                    height:
                                        AppRatioSize.getRatioWidth() / 7.5,
                                    showBoarder: false,
                                    borderRadius: 8,
                                    imagePath:
                                        "${controller.trainers[index].imagePath}"),
                                AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.trainers[index].name}".tr,
                                        textAlign: TextAlign.start,
                                        style: TextStyleX.subHeading3(context),
                                      ),
                                      Text(
                                        "${controller.trainers[index].type}".tr,
                                        textAlign: TextAlign.start,
                                        style: TextStyleX.subHeading3(context)
                                            .copyWith(
                                          fontSize: AppTextSizes.headerText4(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColor.primary),
                                  child: Text(
                                    "add_lbl".tr,
                                    textAlign: TextAlign.start,
                                    style: TextStyleX.header3(context).copyWith(
                                      color: AppColor.white,
                                      fontSize: AppTextSizes.headerText4(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
              AppRatioSpaces.verticalSectionSpaceMF(),
            ],
          )),
    );
  }
}
