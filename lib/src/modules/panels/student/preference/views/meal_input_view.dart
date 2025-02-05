import 'package:go7eight/src/modules/panels/student/preference/views/widgets/option_container_widget.dart';

import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';

class MealInputView extends GetView<PreferenceController> {
  const MealInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          AppRatioSpaces.verticalSectionSpaceMF(),
          Obx(() {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Get.width < 600 ? 2 : 4,
                    crossAxisSpacing: AppRatioSize.getRatioWidth() / 24,
                    mainAxisSpacing: AppRatioSize.getRatioWidth() / 100,
                    childAspectRatio: 1.1),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.preferenceMealList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onMealSelection(
                          controller.preferenceMealList[index]);
                    },
                    child: OptionContainerWidget(
                      item: controller.preferenceMealList[index],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      hideDescription: true,
                      hideIconImage: false,
                    ),
                  );
                });
          })
        ],
      ),
    );
  }
}
