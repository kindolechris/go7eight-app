import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_column_widget.dart';

import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/home_controller.dart';

class TrendingSessionWidget extends GetView<HomeController> {
  const TrendingSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AppSectionTitle(
          title: "trending_sessions_lbl",
          showViewAll: true,
          disableDefaultVPadding: true,
          onTapViewAll: () {
            controller.trendingSessionSeeAllClick();
          },
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 2.6,
            width: Get.width,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.trendingSessions.length,
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
                            controller.trendingSessions[index]);
                      },
                      child: SessionColumnCardWidget(
                        width: AppRatioSize.getRatioWidth() / 1.25,
                        session: controller.trendingSessions[index],
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
