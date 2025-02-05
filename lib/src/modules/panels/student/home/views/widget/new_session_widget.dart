import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_column_widget.dart';

import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/home_controller.dart';

class NewSessionWidget extends GetView<HomeController> {
  const NewSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AppSectionTitle(
          title: "new_sessions_lbl",
          showViewAll: true,
          disableDefaultVPadding: true,
          onTapViewAll: () {
            controller.newSessionSeeAllClick();
          },
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 2.6,
            width: Get.width,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.newSessions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: index == 0
                            ? (AppRatioSize.getRatioWidth() / 48)
                            : 0),
                    child: GestureDetector(
                      onTap: () {
                        controller.singleSessionClick(
                            SessionType.regular,
                            index % 2 == 0 ? true : false,
                            controller.newSessions[index]);
                      },
                      child: SessionColumnCardWidget(
                        width: AppRatioSize.getRatioWidth() / 1.25,
                        session: controller.newSessions[index],
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
