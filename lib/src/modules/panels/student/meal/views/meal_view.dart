import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/calendar_widget.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/home_app_bar.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/widget/meal_data_widget.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/widget/meal_type_list_widget.dart';
import '../controllers/meal_controller.dart';
import 'widget/meal_type_header_widget.dart';

class AnalyticsView extends GetView<MealController> {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            appBar: const HomeAppBar(
              showSearchButton: false,
            ),
            body: Container(
                height: Get.height,
                width: Get.width,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                margin: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 24),
                child: Container())));
  }
}
