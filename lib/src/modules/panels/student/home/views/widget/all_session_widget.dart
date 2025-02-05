import 'package:shimmer/shimmer.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_column_widget.dart';

import '../../controllers/home_controller.dart';

class AllSessionWidget extends GetView<HomeController> {
  const AllSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const AppSectionTitle(
          title: "Go7eight Posts",
          disableDefaultVPadding: true,
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.allSessions.length + 1,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index < controller.allSessions.length) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: AppRatioSize.getRatioWidth() / 48,
                      right: AppRatioSize.getRatioWidth() / 48,
                      bottom: 6,
                    ),
                    height: AppRatioSize.getRatioHeight() / 2.6,
                    child: GestureDetector(
                      onTap: () {
                        // controller.singleSessionClick(
                        //     SessionType.regular,
                        //     index % 2 == 0 ? true : false,
                        //     controller.allSessions[index]);
                      },
                      child: SessionColumnCardWidget(
                        width: AppRatioSize.getRatioWidth(),
                        session: controller.allSessions[index],
                      ),
                    ),
                  );
                } else {
                  return Container(
                      margin: EdgeInsets.only(
                        left: AppRatioSize.getRatioWidth() / 48,
                        right: AppRatioSize.getRatioWidth() / 48,
                        bottom: 6,
                      ),
                      height: AppRatioSize.getRatioHeight() / 3.1,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.grey.withOpacity(0.2),
                        highlightColor: AppColor.lightGrey.withOpacity(0.4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ));
                }
              });
        })
      ],
    );
  }
}
