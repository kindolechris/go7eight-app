import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:intl/intl.dart' as intl;

import '../../controllers/workout_controller.dart';

class TimePickerWidget extends GetView<WorkoutController> {
  const TimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: AppRatioSize.getRatioWidth() / 1.2,
            width: AppRatioSize.getRatioWidth() / 1.2,
            child: Image.asset(AppImage.clockBGImage)),
        TimePicker(
          initTime: controller.inBedTime.value,
          endTime: controller.outBedTime.value,
          height: AppRatioSize.getRatioWidth() / 1.7,
          width: AppRatioSize.getRatioWidth() / 1.7,
          onSelectionChange: controller.updateLabels,
          onSelectionEnd: (start, end, isDisableRange) {},
          primarySectors: controller.clockTimeFormat.value,
          secondarySectors: controller.clockTimeFormat.value * 2,
          decoration: TimePickerDecoration(
            baseColor: AppColor.black,
            pickerBaseCirclePadding: 0.0,
            sweepDecoration: TimePickerSweepDecoration(
              pickerStrokeWidth: 30.0,
              pickerColor:
                  controller.isSleepGoal ? AppColor.primary : Colors.white,
              showConnector: false,
            ),
            initHandlerDecoration: TimePickerHandlerDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
              radius: 12.0,
              icon: const Icon(
                Icons.motion_photos_on,
                size: 20.0,
                color: AppColor.white,
              ),
            ),
            endHandlerDecoration: TimePickerHandlerDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
              radius: 12.0,
              icon: const Icon(
                Icons.notifications_none_rounded,
                size: 20.0,
                color: AppColor.white,
              ),
            ),
            primarySectorsDecoration: TimePickerSectorDecoration(
              color: Colors.white,
              width: 1.0,
              size: 4.0,
              radiusPadding: 25.0,
            ),
            secondarySectorsDecoration: TimePickerSectorDecoration(
              color: AppColor.primary,
              width: 1.0,
              size: 2.0,
              radiusPadding: 25.0,
            ),
            clockNumberDecoration: TimePickerClockNumberDecoration(
              defaultTextColor: Colors.white,
              defaultFontSize: 12.0,
              scaleFactor: 2.0,
              showNumberIndicators: true,
              clockTimeFormat: controller.clockTimeFormat,
              clockIncrementTimeFormat: controller.clockIncrementTimeFormat,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(62.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    '${intl.NumberFormat('00').format(controller.intervalBedTime.value.h)}Hr ${intl.NumberFormat('00').format(controller.intervalBedTime.value.m)}Min',
                    style: TextStyleX.subHeading2(context).copyWith(
                      color: controller.isSleepGoal
                          ? AppColor.primary
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
