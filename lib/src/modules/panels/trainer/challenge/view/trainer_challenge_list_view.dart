import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/trainer_challenge_controller.dart';
import 'widgets/published_challenge_list.dart';
import 'widgets/type_dropdown.dart';
import 'widgets/unpublished_challenge_list.dart';

class TrainerChallengeListView extends GetView<TrainerChallengeListController> {
  const TrainerChallengeListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.isPublishedSelected.value == true;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: true,
        title: "challenges_lbl",
        iconAction: controller.onChallengeAddClick,
      ),
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
                    optionOneText: "published_lbl",
                    optionTwoText: "unpublished_lbl");
              }),
              AppRatioSpaces.verticalSectionSpaceS(),
              Obx(() {
                return controller.isPublishedSelected.value == true
                    ? const PublishedChallengeList()
                    : const UnpublishedChallengeList();
              }),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
