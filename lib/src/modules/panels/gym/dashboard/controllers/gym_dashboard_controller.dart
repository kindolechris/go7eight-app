import 'package:get/get.dart';
import 'package:go7eight/src/data/dummy_dataset/admin_insight_data.dart';
import 'package:go7eight/src/models/schedule_macro_model.dart';

class GYMDashboardController extends GetxController {
  List<ScheduleMacroModel> insightMacros = getAdminInsightMacroData();
  RxString lineChartFilterValue = "Today".obs;
}
