import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';

import '../controllers/trainer_advertisement_controller.dart';

class TrainerAdvertisementView extends StatefulWidget {
  const TrainerAdvertisementView({super.key});

  @override
  State<TrainerAdvertisementView> createState() =>
      _TrainerAdvertisementViewState();
}

class _TrainerAdvertisementViewState extends State<TrainerAdvertisementView> {
  final TrainerAdvertisementController _controller =
      Get.put(TrainerAdvertisementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: true,
          title: "my_advertisements_lbl",
          showLeading: true,
          iconAction: _controller.gotoAdAdvertisement),
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
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: AppContainerWidget(
                              disableDefaultHPadding: true,
                              disableDefaultVPadding: true,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(
                                        AppRatioSize.getRatioWidth() / 44),
                                    child: AppNetworkImage(
                                      height:
                                          AppRatioSize.getRatioHeight() / 5.5,
                                      width: Get.width,
                                      borderRadius: 12,
                                      imagePath: _controller
                                          .adImageList[index].imagePath!,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            AppRatioSize.getRatioWidth() / 44),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 2),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? AppColor.primary
                                                          .withOpacity(0.2)
                                                      : AppColor.primary
                                                          .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(1),
                                                    child: Icon(
                                                      Icons.remove_red_eye,
                                                      color: AppColor.primary,
                                                      size: AppRatioSize
                                                              .getRatioWidth() /
                                                          28,
                                                    ),
                                                  ),
                                                  Text(
                                                      '  ${687 - index} ${'views_lbl'.tr}',
                                                      style: TextStyleX
                                                              .subHeading2(
                                                                  context)
                                                          .copyWith(
                                                              color: AppColor
                                                                  .primary,
                                                              fontSize: AppTextSizes
                                                                  .headerText5())),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppRatioSpaces.verticalSectionSpaceXS(),
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
