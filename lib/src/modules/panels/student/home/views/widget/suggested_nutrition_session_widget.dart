import 'package:go7eight/src/core/enums/session_type_enum.dart';

import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_row_widget.dart';

import '../../controllers/home_controller.dart';

class SuggestedNutritionSessionWidget extends GetView<HomeController> {
  const SuggestedNutritionSessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AppSectionTitle(
          title: "suggested_nutrition_sessions_lbl",
          showViewAll: true,
          disableDefaultVPadding: true,
          onTapViewAll: () {
            controller.nutritionSessionSeeAllClick();
          },
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 7,
            width: Get.width,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.nutritionSessions.length,
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
                            SessionType.nutrition,
                            index % 2 == 0 ? true : false,
                            controller.nutritionSessions[index]);
                      },
                      child: SessionRowCardWidget(
                        width: AppRatioSize.getRatioWidth() / 1.15,
                        session: controller.nutritionSessions[index],
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
