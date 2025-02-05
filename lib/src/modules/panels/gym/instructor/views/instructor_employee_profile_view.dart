import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import 'package:go7eight/src/modules/panels/gym/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/gym/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/gym/session/views/session_details_view.dart';
import '../../../global_widgets/gym_trainer_container.dart';
import '../../challenge/bindings/challenge_binding.dart';
import '../controllers/instructor_employee_controller.dart';
import 'widgets/basic_training_info.dart';
import 'widgets/overview_button.dart';

class InstructorEmployeeView extends GetView<InstructorEmployeeController> {
  final SessionType sessionType;

  const InstructorEmployeeView({super.key, required this.sessionType});

  @override
  Widget build(BuildContext context) {
    controller.trainer.value.type = sessionType == SessionType.regular
        ? "fitness_trainer_lbl"
        : "nutritionist_lbl";
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          title: "instructor_lbl", showAddIcon: false, showLeading: true),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        children: [
          AppRatioSpaces.verticalSectionSpaceS(),
          Obx(() {
            return TrainerContainer(
              trainer: controller.trainer.value,
              imageBorderRadius: Get.width,
              imageSize: AppRatioSize.getRatioWidth() / 8,
              showActionButton: true,
              onClickAction: controller.gotoTrainerProfileVerification,
            );
          }),
          _trainerDetails(context),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          const OverviewButton(),
          AppRatioSpaces.verticalSectionSpaceS(),
          const BasicTrainingInfo(
              sessionCount: "29", challengeCount: "05", followerCount: "18k"),
          AppRatioSpaces.verticalSectionSpaceXXS(),
          Obx(() {
            return AppTabBar(
                onChange: (value) {
                  controller.isChallengesSelected.value = value;
                },
                isFirstOptionSelected: controller.isChallengesSelected.value,
                horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                optionOneText: "challenges_lbl",
                optionTwoText: "sessions_title");
          }),
          AppRatioSpaces.verticalSectionSpaceS(),
          Obx(() {
            return controller.isChallengesSelected.value == true
                ? _challengeList()
                : _sessionList();
          }),
        ],
      ),
    );
  }

  _trainerDetails(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
            .tr,
        style: TextStyleX.subHeading2BlueGrey(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.blackShade
                : AppColor.white,
            fontSize: AppTextSizes.headerText4()),
        maxLines: 150,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _challengeList() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.challenges.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    () => GYMChallengeDetailsView(
                          title: controller.challenges[index].title!,
                          challenge: sessionType == SessionType.regular
                              ? controller.challenges[index]
                              : controller.challengesNutrition[index],
                        ),
                    binding: GYMChallengeBinding(),
                    duration: const Duration(milliseconds: 400),
                    transition: Transition.fadeIn);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: AppContainerWidget(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppNetworkImage(
                            width: AppRatioSize.getRatioWidth() / 4.5,
                            height: AppRatioSize.getRatioWidth() / 7.5,
                            imagePath: sessionType == SessionType.regular
                                ? "${controller.challenges[index].imagePath}"
                                : "${controller.challengesNutrition[index].imagePath}",
                            borderRadius: 12,
                          ),
                          AppRatioSpaces.horizontalSectionSpaceXS(),
                          Expanded(
                            child: _titlePriceTextWidget(context,
                                title: "${controller.challenges[index].title}",
                                price: "${controller.challenges[index].price}"),
                          )
                        ],
                      ),
                      const Divider(
                        color: AppColor.lightGrey,
                        thickness: 1.5,
                      ),
                      _viewCountWidget(context, viewCount: "${290 - index}"),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _sessionList() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.sessions.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                      () => GYMSessionDetailsView(
                          title: controller.sessions[index].title!,
                          sessionModel: sessionType == SessionType.regular
                              ? controller.sessions[index]
                              : controller.sessionsNutrition[index],
                          sessionType: sessionType),
                      binding: GYMSessionBinding(),
                      duration: const Duration(milliseconds: 400),
                      transition: Transition.fadeIn);
                },
                child: AppContainerWidget(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppNetworkImage(
                            width: AppRatioSize.getRatioWidth() / 4.5,
                            height: AppRatioSize.getRatioWidth() / 7.5,
                            imagePath: sessionType == SessionType.regular
                                ? "${controller.sessions[index].imagePath}"
                                : "${controller.sessionsNutrition[index].imagePath}",
                            borderRadius: 12,
                          ),
                          AppRatioSpaces.horizontalSectionSpaceXS(),
                          Expanded(
                            child: _titlePriceTextWidget(context,
                                title: "${controller.sessions[index].title}",
                                price: "${controller.sessions[index].price}"),
                          )
                        ],
                      ),
                      const Divider(
                        color: AppColor.lightGrey,
                        thickness: 1.5,
                      ),
                      _viewCountWidget(context, viewCount: "${687 - index}")
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _titlePriceTextWidget(BuildContext context,
      {required String title, required String price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyleX.subHeading3(context),
        ),
        Row(
          children: [
            Text(
              "\$$price".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading3(context).copyWith(
                  color: AppColor.primary,
                  fontSize: AppTextSizes.titleText6()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }

  Widget _viewCountWidget(BuildContext context, {required String viewCount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary.withOpacity(0.2)
                      : AppColor.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: AppColor.primary,
                      size: AppRatioSize.getRatioWidth() / 28,
                    ),
                  ),
                  Text('  $viewCount ${'views_lbl'.tr}',
                      style: TextStyleX.subHeading1(context).copyWith(
                          color: AppColor.primary,
                          fontSize: AppTextSizes.headerText5())),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width),
              color: AppColor.primary),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.white,
            size: AppRatioSize.getRatioWidth() / 32,
          ),
        ),
      ],
    );
  }
}
