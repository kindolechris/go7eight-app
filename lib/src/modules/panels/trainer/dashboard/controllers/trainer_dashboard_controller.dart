import 'package:get/get.dart';
import 'package:go7eight/src/models/schedule_macro_model.dart';

import '../../../../../data/dummy_dataset/trainer_insight_data.dart';

class TrainerDashboardController extends GetxController {
  List<ScheduleMacroModel> insightMacros = getTrainerInsightMacroData();
  RxString lineChartFilterValue = "Today".obs;
}
