import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_bar_widget.dart';
import '../controllers/session_controllers.dart';
import 'session_list_view.dart';

class RecentSessionListView extends GetView<SessionController> {
  const RecentSessionListView({super.key});

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
            appBar: sessionAppBar(context,
                title: "new_sessions_lbl",
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
                  SessionListViewWidget(sessionList: controller.newSessions),
                  AppRatioSpaces.verticalSectionSpaceM(),
                ],
              ),
            )),
      ),
    );
  }
}
