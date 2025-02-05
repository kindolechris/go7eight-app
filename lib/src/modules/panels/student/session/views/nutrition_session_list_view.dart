import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_bar_widget.dart';

import '../controllers/session_controllers.dart';
import 'session_list_view.dart';

class NutritionSessionListView extends GetView<SessionController> {
  const NutritionSessionListView({super.key});

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
        child: Obx(() {
          return Scaffold(
              appBar: sessionAppBar(context,
                  title: "nutrition_sessions_lbl",
                  saveIconAction: controller.saveSession,
                  sessionSaved: controller.sessionIsSaved.value),
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
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
                    AppRatioSpaces.verticalSectionSpaceS(),
                    SessionListViewWidget(
                      sessionList: controller.nutritionSessions,
                      sessionType: SessionType.nutrition,
                    ),
                    AppRatioSpaces.verticalSectionSpaceM(),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
