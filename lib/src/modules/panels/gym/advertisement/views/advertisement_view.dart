import 'package:flutter/cupertino.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';

import 'package:go7eight/src/modules/panels/gym/advertisement/controllers/gym_advertisement_controller.dart';

class GYMAdvertisementView extends StatefulWidget {
  const GYMAdvertisementView({super.key});

  @override
  State<GYMAdvertisementView> createState() => _GYMAdvertisementViewState();
}

class _GYMAdvertisementViewState extends State<GYMAdvertisementView> {
  final GYMAdvertisementController _controller =
      Get.put(GYMAdvertisementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: true,
          title: "advertisement_list_lbl",
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
                    itemCount: _controller.adImageList.length,
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
                                      imagePath:
                                          _controller.adImageList[index].imagePath!,
                                      borderRadius: 12,
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
                                                              .subHeading1(
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
                                        Row(
                                          children: [
                                            SizedBox(
                                                height: AppRatioSize
                                                        .getRatioWidth() /
                                                    16,
                                                width: AppRatioSize
                                                        .getRatioWidth() /
                                                    8,
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: CupertinoSwitch(
                                                    value: _controller
                                                        .adImageList[index]
                                                        .isSelected,
                                                    activeColor:
                                                        AppColor.primary,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _controller
                                                            .adImageList[index]
                                                            .isSelected = value;
                                                      });
                                                    },
                                                  ),
                                                )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _controller.adImageList
                                                      .remove(_controller
                                                          .adImageList[index]);
                                                });
                                                SnackBarX.showSuccess(
                                                    title:
                                                        "advertisement_deletion_lbl",
                                                    message:
                                                        "advertisement_deletion_message");
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: AppColor.red
                                                        .withOpacity(0.2)),
                                                child: Icon(
                                                  Icons.delete_outline_rounded,
                                                  color: AppColor.red,
                                                  size: AppRatioSize
                                                          .getRatioHeight() /
                                                      38,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
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
