

import '../../core/app_export.dart';
import '../../models/schedule_macro_model.dart';

List<ScheduleMacroModel> getScheduleMacroData() {
  final List<ScheduleMacroModel> scheduleMacro = [
    ScheduleMacroModel(
        id: 0,
        name: "BPM",
        iconPath: AppIcon.bmpMacroIcon,
        macroValue: "345",
      macroUnit: ""
    ),
    ScheduleMacroModel(
        id: 1,
        name: "Steps",
        iconPath: AppIcon.stepsMacroIcon,
        macroValue: "4,585",
        macroUnit: ""
    ),
    ScheduleMacroModel(
        id: 2,
        name: "Sleep",
        iconPath: AppIcon.sleepMacroIcon,
        macroValue: "6.2",
        macroUnit: "hr"
    ),
    ScheduleMacroModel(
        id: 3,
        name: "Blood Oxygen",
        iconPath: AppIcon.bloodOxygenMacroIcon,
        macroValue: "97",
        macroUnit: "%"
    ),
    ScheduleMacroModel(
        id: 4,
        name: "Water",
        iconPath: AppIcon.waterMacroIcon,
        macroValue: "4",
        macroUnit: "L"
    ),
    ScheduleMacroModel(
        id: 5,
        name: "Water",
        iconPath: AppIcon.weightMacroIcon,
        macroValue: "82",
        macroUnit: "kg"
    ),
    ScheduleMacroModel(
        id: 6,
        name: "Calories",
        iconPath: AppIcon.waterMacroIcon,
        macroValue: "512",
        macroUnit: "",
    ),
    ScheduleMacroModel(
        id: 7,
        name: "Workout",
        iconPath: AppIcon.workoutMacroIcon,
        macroValue: "3",
        macroUnit: "hr"
    ),
  ];

  return scheduleMacro;
}