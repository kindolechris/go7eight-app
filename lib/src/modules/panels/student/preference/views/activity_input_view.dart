
import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';
import 'widgets/option_container_widget.dart';

class ActivityInputView extends GetView<PreferenceController> {
  const ActivityInputView({super.key});

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
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.preferenceActivityList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onActivitySelection(
                          controller.preferenceActivityList[index]);
                    },
                    child: OptionContainerWidget(
                     item: controller
                          .preferenceActivityList[index],
                    ),
                  );
                });
          })
        ],
      ),
    );
  }
}