import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/gym_transfer_controllers.dart';

class GYMSaleHistoryView extends GetView<GYMTransferController> {
  const GYMSaleHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "sale_history_title",
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
                    itemCount: controller.saleHistories.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: AppContainerWidget(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      AppNetworkImage(
                                        height:
                                            AppRatioSize.getRatioWidth() / 7,
                                        width: AppRatioSize.getRatioWidth() / 5,
                                        imagePath: "${controller.saleHistories[index].isSessionType == true ? controller.saleHistories[index].session!.imagePath : controller.saleHistories[index].challenge!.imagePath}",
                                        borderRadius: 8,
                                      ),
                                      Text(
                                          controller.saleHistories[index].isSessionType == true ? "session_title".tr : "challenge_title".tr,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleX.subHeading2BlueGrey(
                                                  context)
                                              .copyWith(
                                                  color: AppColor.primary,
                                                  fontSize: AppTextSizes
                                                      .headerText4())),
                                    ],
                                  ),
                                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${controller.saleHistories[index].isSessionType == true ? controller.saleHistories[index].session!.title : controller.saleHistories[index].challenge!.title}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyleX.subHeading3(
                                                context)),
                                        Text("by ${trainerNameGet(id: index)}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                TextStyleX.subHeading2BlueGrey(
                                                    context)),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                '${controller.saleHistories[index].date}',
                                                style: TextStyleX.subHeading2(
                                                        context)
                                                    .copyWith(
                                                        fontSize: AppTextSizes
                                                            .bodyText3())),
                                            Container(
                                                margin: const EdgeInsets.symmetric(
                                                    horizontal: 4),
                                                child: Icon(
                                                  Icons
                                                      .fiber_manual_record_rounded,
                                                  color: AppColor.primary,
                                                  size: AppRatioSize
                                                          .getRatioWidth() /
                                                      66,
                                                )),
                                            Text(
                                                '${controller.saleHistories[index].time}',
                                                style: TextStyleX.subHeading2(
                                                        context)
                                                    .copyWith(
                                                        fontSize: AppTextSizes
                                                            .bodyText3())),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '\$${controller.saleHistories[index].amount}',
                                          style: TextStyleX.subHeading1(context)
                                              .copyWith(
                                            color: AppColor.primary,
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 2),
                                            child: Icon(
                                              Icons.arrow_circle_up_rounded,
                                              color: controller
                                                          .saleHistories[index]
                                                          .successStatus ==
                                                      true
                                                  ? AppColor.green
                                                  : AppColor.red,
                                              size:
                                                  AppRatioSize.getRatioWidth() /
                                                      32,
                                            ),
                                          ),
                                          Text('transfer_btn_lbl'.tr,
                                              style: TextStyleX.subHeading3(
                                                      context)
                                                  .copyWith(
                                                      color: controller
                                                                  .saleHistories[
                                                                      index]
                                                                  .successStatus ==
                                                              true
                                                          ? AppColor.green
                                                          : AppColor.red,
                                                      fontSize: AppTextSizes
                                                          .headerText4())),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
