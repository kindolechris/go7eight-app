import 'package:go7eight/src/core/app_export.dart';

import '../../../global_widgets/general_app_bar.dart';
import '../controllers/trainer_advertisement_controller.dart';

class TrainerAdItemListView extends GetView<TrainerAdvertisementController> {
  const TrainerAdItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "${"select_lbl".tr} ${controller.selectedTypeOfAdvertisement.value.tr}",
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
                  child: Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.itemList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.bindSelectedItem(
                                  index: index,
                                  name: controller.getItemListName(index),
                                  subtext:
                                      controller.getItemListSecondaryText(index),
                                  imagePath:
                                      "${controller.itemList[index].imagePath}");
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
                                      width:
                                          AppRatioSize.getRatioWidth() / 7.5,
                                      height:
                                          AppRatioSize.getRatioWidth() / 7.5,
                                      showBoarder: false,
                                      borderRadius: 8,
                                      imagePath:
                                          "${controller.itemList[index].imagePath}"),
                                  AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.getItemListName(index)
                                              .tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyleX.subHeading2BlueGrey(
                                              context),
                                        ),
                                        Text(
                                          controller.getItemListSecondaryText(index)
                                              .tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyleX.subHeading2BlueGrey(
                                                  context)
                                              .copyWith(
                                            fontSize:
                                                AppTextSizes.headerText4(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppRatioSpaces.horizontalSectionSpaceXXSS(),
                                ],
                              ),
                            ),
                          );
                        });
                  })),
              AppRatioSpaces.verticalSectionSpaceMF(),
            ],
          )),
    );
  }
}
