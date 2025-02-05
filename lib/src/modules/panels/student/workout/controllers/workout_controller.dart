import 'package:get/get.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:go7eight/src/data/dummy_dataset/schedule_macro_data.dart';
import 'package:go7eight/src/models/schedule_macro_model.dart';

class WorkoutController extends GetxController {
  List<ScheduleMacroModel> scheduleMacros = getScheduleMacroData();

  Rx<PickedTime> inBedTime = PickedTime(h: 11, m: 30).obs;
  Rx<PickedTime> outBedTime = PickedTime(h: 5, m: 30).obs;
  Rx<PickedTime> intervalBedTime = PickedTime(h: 0, m: 0).obs;
  ClockTimeFormat clockTimeFormat = ClockTimeFormat.twelveHours;
  ClockIncrementTimeFormat clockIncrementTimeFormat =
      ClockIncrementTimeFormat.fiveMin;
  double sleepGoal = 6.0;
  bool isSleepGoal = false;

  void updateLabels(PickedTime init, PickedTime end, bool? isDisableRange) {
    inBedTime.value = init;
    outBedTime.value = end;
    intervalBedTime.value = formatIntervalTime(
      init: inBedTime.value,
      end: outBedTime.value,
      clockTimeFormat: clockTimeFormat,
      clockIncrementTimeFormat: clockIncrementTimeFormat,
    );
    isSleepGoal = validateSleepGoal(
      inTime: init,
      outTime: end,
      sleepGoal: sleepGoal,
      clockTimeFormat: clockTimeFormat,
      clockIncrementTimeFormat: clockIncrementTimeFormat,
    );
  }
}
