

import '../../core/app_export.dart';
import '../../models/schedule_macro_model.dart';

List<ScheduleMacroModel> getAdminInsightMacroData() {
  final List<ScheduleMacroModel> insightMacro = [
    ScheduleMacroModel(
        id: 0,
        name: "total_user_lbl",
        iconPath: AppIcon.userMacroIcon,
        macroValue: "6254",
        macroUnit: "",
      iconColor: AppColor.macroBlue
    ),
    ScheduleMacroModel(
        id: 1,
        name: "total_trainer_lbl",
        iconPath: AppIcon.trainerMacroIcon,
        macroValue: "358",
        macroUnit: "",
        iconColor: AppColor.macroMagenta
    ),
    ScheduleMacroModel(
        id: 2,
        name: "total_nutritionist_lbl",
        iconPath: AppIcon.nutritionMacroIcon,
        macroValue: "122",
        macroUnit: "",
        iconColor: AppColor.macroPurple
    ),
    ScheduleMacroModel(
        id: 3,
        name: "user_avg_age_lbl",
        iconPath: AppIcon.ageMacroIcon,
        macroValue: "24",
        macroUnit: "",
        iconColor: AppColor.macroAmber
    ),
    ScheduleMacroModel(
        id: 4,
        name: "macro_total_earning_lbl",
        iconPath: AppIcon.earningMacroIcon,
        macroValue: "\$152",
        macroUnit: "k",
        iconColor: AppColor.macroGreen
    ),
    ScheduleMacroModel(
        id: 5,
        name: "total_session_lbl",
        iconPath: AppIcon.sessionMacroIcon,
        macroValue: "1,267",
        macroUnit: "",
        iconColor: AppColor.macroMaroon
    ),
  ];

  return insightMacro;
}