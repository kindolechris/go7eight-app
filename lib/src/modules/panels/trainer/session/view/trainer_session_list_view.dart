import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/trainer_session_controller.dart';
import 'widgets/published_session_list.dart';
import 'widgets/type_dropdown.dart';
import 'widgets/unpublished_session_list.dart';

class TrainerSessionView extends GetView<TrainerSessionController> {
  const TrainerSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.isPublishedSelected.value == true;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: true,
          title: "sessions_title",
          iconAction: controller.onSessionAddClick),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceS(),
              const TypeDropdown(),
              AppRatioSpaces.verticalSectionSpaceS(),
              Obx(() {
                return AppTabBar(
                    onChange: (value) {
                      controller.isPublishedSelected.value = value;
                    },
                    isFirstOptionSelected: controller.isPublishedSelected.value,
                    horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                    optionOneText: "Published",
                    optionTwoText: "Unpublished");
              }),
              AppRatioSpaces.verticalSectionSpaceS(),
              Obx(() {
                return controller.isPublishedSelected.value == true
                    ? const PublishedSessionList()
                    : const UnpublishedSessionList();
              }),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
