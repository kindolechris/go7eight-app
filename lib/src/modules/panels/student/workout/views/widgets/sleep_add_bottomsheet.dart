import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/workout_controller.dart';
import 'time_picker_widget.dart';
import 'time_value_widget.dart';

class SleepAddBottomSheet extends GetView<WorkoutController> {
  const SleepAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.textBlueGrey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 60,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.textBlueGrey
                  : AppColor.textBlueGrey,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    "sleep_schedule_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: AppColor.white,
                      fontSize: AppTextSizes.titleText5(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          right: AppRatioSize.getRatioWidth() / 32),
                      child: Icon(
                        Icons.close,
                        color: AppColor.white,
                        size: AppRatioSize.getRatioWidth() / 16,
                      )),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(0.025),
              image: const DecorationImage(
                image: AssetImage(
                  AppImage.sleepBGImage,
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                AppRatioSpaces.verticalSectionSpaceM(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: Text(
                    "sleep_schedule_message".tr,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: AppColor.lightBlueGrey,
                      fontSize: AppTextSizes.headerText3(),
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceXS(),
                const TimePickerWidget(),
                AppRatioSpaces.verticalSectionSpaceM(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TimeValueWidget(
                          title: 'bedtime_lbl',
                          time: controller.inBedTime.value,
                          icon: const Icon(
                            Icons.nights_stay_rounded,
                            size: 25.0,
                            color: AppColor.textBlueGrey,
                          ),
                        ),
                        AppRatioSpaces.horizontalSectionSpaceS(),
                        TimeValueWidget(
                          title: 'wakeup_lbl',
                          time: controller.outBedTime.value,
                          icon: const Icon(
                            Icons.notifications_rounded,
                            size: 25.0,
                            color: AppColor.textBlueGrey,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                AppRatioSpaces.verticalSectionSpaceMF(),
              ],
            ),
          ),
          Container(
            height: AppRatioSize.getRatioHeight() / 10,
            width: Get.width,
            padding: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            decoration: const BoxDecoration(
                color: AppColor.textBlueGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Column(
              children: [
                AppRatioSpaces.verticalSectionSpaceS(),
                AppButton(
                  btnColor: AppColor.white,
                  txtColor: AppColor.textBlueGrey,
                  action: () {
                    Navigator.pop(context);
                    SnackBarX.showSuccess(
                        title: "sleep_schedule_title",
                        message: "sleep_schedule_add_message");
                  },
                  text: "add_lbl",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
