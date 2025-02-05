import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_bar_widget.dart';

import '../../../../../core/app_export.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        appBar: sessionAppBar(
          context,
          showSaveIcon: false,
          title: "lbl_notifications",
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
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 12,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppRatioSize.getRatioWidth() / 24,
                            vertical: AppRatioSize.getRatioHeight() / 120),
                        decoration: BoxDecoration(
                          color: index > 3 && index < 8
                              ? AppColor.primary.withOpacity(0.15)
                              : Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColor.white
                                  : AppColor.black,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AppNetworkImage(
                                  width: AppRatioSize.getRatioWidth() / 5,
                                  height: AppRatioSize.getRatioWidth() / 6.5,
                                  imagePath:
                                      sessionNutritionImageGet(id: index),
                                  borderRadius: 12,
                                ),
                                AppRatioSpaces.horizontalSectionSpaceXXS(),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "You’ve unpublished a session named 'High-Intensity Interval Training' "
                                              "by Talan Gouse."
                                          .tr,
                                      textAlign: TextAlign.justify,
                                      style: TextStyleX.body3(context)
                                          .copyWith(
                                              fontSize:
                                                  AppTextSizes.headerText3() /
                                                      1.1),
                                      maxLines: 3,
                                    ),
                                    Text(
                                      "10 hours ago".tr,
                                      textAlign: TextAlign.left,
                                      style: TextStyleX.body3(context)
                                          .copyWith(
                                              color: AppColor.primary,
                                              fontSize:
                                                  AppTextSizes.headerText3() /
                                                      1.1),
                                      maxLines: 1,
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            AppRatioSpaces.verticalSectionSpaceXS(),
                            Divider(
                              color: AppColor.primary.withOpacity(0.8),
                              height: 1,
                            )
                          ],
                        ),
                      );
                    })
              ]),
        ));
  }
}
