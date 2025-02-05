import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import '../../../global_widgets/session_column_widget.dart';
import '../controllers/category_controller.dart';

class CategorySessionListView extends GetView<CategoryController> {
  final String categoryName;
  const CategorySessionListView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AppSectionTitle(
          title: "${categoryName.tr} Sessions",
          disableDefaultVPadding: true,
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.categorySessions.length,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: AppRatioSize.getRatioWidth() / 48,
                    right: AppRatioSize.getRatioWidth() / 48,
                    bottom: 6,
                  ),
                  height: AppRatioSize.getRatioHeight() / 2.6,
                  child: GestureDetector(
                    onTap: () {
                      controller.singleSessionClick(
                          (categoryName.tr == "Nutrition" ||
                                  categoryName.tr == "Diet")
                              ? SessionType.nutrition
                              : SessionType.regular,
                          index % 2 == 0 ? true : false,
                          controller.categorySessions[index]);
                    },
                    child: SessionColumnCardWidget(
                      width: AppRatioSize.getRatioWidth(),
                      session: controller.categorySessions[index],
                    ),
                  ),
                );
              });
        })
      ],
    );
  }
}
