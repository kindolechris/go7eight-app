import 'package:go7eight/src/core/app_export.dart';

import '../../../global_widgets/general_app_bar.dart';
import '../controllers/trainer_profile_controller.dart';

class TrainerUserListView extends GetView<TrainerProfileController> {
  const TrainerUserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "user_list_lbl",
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
              AppRatioSpaces.verticalSectionSpaceS(),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.userList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: AppContainerWidget(
                            child: Row(
                              children: [
                                AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                AppNetworkImage(
                                    width: AppRatioSize.getRatioWidth() / 7.5,
                                    height:
                                        AppRatioSize.getRatioWidth() / 7.5,
                                    showBoarder: false,
                                    borderRadius: Get.width,
                                    imagePath:
                                        "${controller.userList[index].imagePath}"),
                                AppRatioSpaces.horizontalSectionSpaceXS(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.userList[index].name}".tr,
                                        textAlign: TextAlign.start,
                                        style: TextStyleX.subHeading2BlueGrey(
                                            context),
                                      ),
                                      _keyValueWidget(context,
                                          fieldKey: "Height",
                                          fieldValue:
                                              "${controller.userList[index].height}"),
                                      _keyValueWidget(context,
                                          fieldKey: "Weight",
                                          fieldValue:
                                              "${controller.userList[index].weight}"),
                                      _keyValueWidget(context,
                                          fieldKey: "Community Member",
                                          fieldValue:
                                              controller.userList[index].isInCommunity == true ? "Yes" : "No"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
              AppRatioSpaces.verticalSectionSpaceS(),
            ],
          )),
    );
  }

  Widget _keyValueWidget(BuildContext context,
      {required String fieldKey, required String fieldValue}) {
    return Row(
      children: [
        Text(
          "$fieldKey: ".tr,
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading2(context).copyWith(
            fontSize: AppTextSizes.headerText4(),
          ),
        ),
        Text(
          fieldValue.tr,
          textAlign: TextAlign.start,
          style: TextStyleX.subHeading2BlueGrey(context).copyWith(
            fontSize: AppTextSizes.headerText4(),
          ),
        ),
      ],
    );
  }
}
