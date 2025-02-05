import 'package:go7eight/src/modules/panels/global_widgets/calendar_widget.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/home_app_bar.dart';
import 'package:go7eight/src/modules/panels/student/search/binding/search_binding.dart';
import 'package:go7eight/src/modules/panels/student/search/page/search_view.dart';
import 'package:go7eight/src/modules/panels/student/workout/controllers/workout_controller.dart';
import 'package:go7eight/src/modules/panels/student/workout/views/widgets/schedule_container.dart';
import 'package:go7eight/src/modules/panels/student/workout/views/widgets/sleep_add_bottomsheet.dart';
import '../../../../../core/app_export.dart';
import 'widgets/schedule_macro_widget.dart';

class AddPostView extends GetView<WorkoutController> {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
            appBar: const HomeAppBar(
              showSearchButton: false,
            ),
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            body: Container(
              height: Get.height,
              width: Get.width,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: Container(),
            )),
      ),
    );
  }
}
