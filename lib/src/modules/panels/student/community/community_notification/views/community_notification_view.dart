import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/gym/session/views/widgets/app_bar_widget.dart';

import '../controllers/community_notification_controller.dart';

class CommunityNotificationView extends GetView<CommunityNotificationController> {
  const CommunityNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        appBar: sessionAppBar(
          context,
          title: "Community Notification",
          showSaveIcon: false,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Center(
                child: Text(
                  "No item to show".tr,
                  style: TextStyleX.subHeading1(context),
                ),
              )),
        ));
  }
}
