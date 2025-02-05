import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/modules/panels/global_widgets/option_widget.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/widgets/post_widget.dart';
import 'package:go7eight/src/modules/panels/student/community/community_notification/bindings/community_notification_binding.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/home_app_bar.dart';

import '../../community_notification/views/community_notification_view.dart';
import '../../community_profile/bindings/community_profile_binding.dart';
import '../../community_profile/views/community_profile_view.dart';
import '../controller/community_home_controller.dart';

class MessageView extends GetView<CommunityHomeController> {
  const MessageView({super.key});

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
