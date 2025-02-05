import '../../../../../core/app_export.dart';
import '../controllers/preference_controller.dart';
import 'widgets/weight_scale_widget.dart';

class WeightInputView extends GetView<PreferenceController> {
  const WeightInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Obx(() {
            return Column(children: [
              Obx(() {
                return AppTabBar(
                    onChange: (value) {
                      controller.isWeightTabOneSelected.value = value;
                    },
                    isFirstOptionSelected: controller.isWeightTabOneSelected
                        .value,
                    optionOneText: "Lbs",
                    optionTwoText: "Kg");
              }),
              AppRatioSpaces.verticalSectionSpaceLF(),
              controller.isWeightTabOneSelected.value
                  ? WeightScaleWidget(
                scaleController: controller.lbsWeightScaleController,
                scaleIntList: controller.lbsWeightList,
                scaleType: "Lbs",
                onChange: (value) {
                  controller.currentWeightValue.value = value;
                },
              )
                  :
              WeightScaleWidget(
                scaleController: controller.kgWeightScaleController,
                scaleIntList: controller.kgWeightList,
                scaleType: "Kg",
                onChange: (value) {
                  controller.currentWeightValue.value = value;
                },
              )
            ]);
          }),
          AppRatioSpaces.verticalSectionSpaceL(),
        ],
      ),
    );
  }
}
