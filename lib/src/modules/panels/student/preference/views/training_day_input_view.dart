
import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';
import 'widgets/option_container_widget.dart';

class TrainingDayInputView extends GetView<PreferenceController> {
  const TrainingDayInputView({super.key});

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
          SizedBox(height: Get.height / 32),
          Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.preferenceTrainingDayList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onTrainingDaySelection(
                          controller.preferenceTrainingDayList[index]);
                    },
                    child: OptionContainerWidget(
                      item: controller
                          .preferenceTrainingDayList[index],
                      hideDescription: true,
                      hideCheckbox: false,
                    ),
                  );
                });
          })
        ],
      ),
    );
  }
}