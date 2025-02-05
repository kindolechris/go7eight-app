import '../../../../../core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/trainer_transfer_controllers.dart';

class TrainerTransactionHistoryView extends GetView<TrainerTransferController> {
  const TrainerTransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "transaction_history_lbl",
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
                    itemCount: controller.transactionHistories.length,
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
                                  Container(
                                    height: AppRatioSize.getRatioWidth() / 9,
                                    width: AppRatioSize.getRatioWidth() / 9,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(Get.width),
                                      border: Border.all(
                                          color: AppColor.lightBlueGrey
                                              .withOpacity(0.25)),
                                      image: DecorationImage(
                                          image: AssetImage(controller
                                              .transactionHistories[index]
                                              .iconPath!),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${controller.transactionHistories[index].type}',
                                            style: TextStyleX.subHeading3(
                                                context)),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                '${controller.transactionHistories[index].date}',
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
                                                '${controller.transactionHistories[index].time}',
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
                                  AppRatioSpaces.horizontalSectionSpaceXXXS(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '\$${controller.transactionHistories[index].amount}',
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
                                                          .transactionHistories[
                                                              index]
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
                                                                  .transactionHistories[
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
