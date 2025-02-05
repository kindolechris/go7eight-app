import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/gym/profile/controllers/gym_profile_controller.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../../../global_widgets/gym_trainer_container.dart';

class GYMVerifyTrainerView extends GetView<GYMProfileController> {
  const GYMVerifyTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: false,
          title: "verify_trainer_profile_lbl",
          showLeading: true),
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
              AppRatioSpaces.verticalSectionSpaceM(),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.trainers.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.onEmployeeClick(SessionType.regular);
                          },
                          child: TrainerContainer(
                            trainer: controller.trainers[index],
                            showActionButton: true,
                          ),
                        );
                      }),
                  AppRatioSpaces.verticalSectionSpaceM(),
                ],
              )
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
