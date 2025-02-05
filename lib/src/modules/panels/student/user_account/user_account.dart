import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/home_app_bar.dart';

import '../community/community_home/controller/community_home_controller.dart';


class UserAccountView extends GetView<CommunityHomeController> {
  const UserAccountView({super.key});

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
