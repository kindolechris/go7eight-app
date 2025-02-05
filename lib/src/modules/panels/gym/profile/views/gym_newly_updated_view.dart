import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/gym/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/gym/profile/controllers/gym_profile_controller.dart';
import 'package:go7eight/src/modules/panels/gym/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/gym/session/views/session_details_view.dart';
import '../../challenge/bindings/challenge_binding.dart';

class GYMNewlyUpdatedView extends GetView<GYMProfileController> {
  final SessionType sessionType;

  const GYMNewlyUpdatedView({super.key, required this.sessionType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          title: "newly_posted_lbl", showAddIcon: false, showLeading: true),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          AppRatioSpaces.verticalSectionSpaceS(),
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
                          challenge: controller.challenges[index],
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
                            imagePath:
                                "${controller.challenges[index].imagePath}",
                            width: AppRatioSize.getRatioWidth() / 4.5,
                            height: AppRatioSize.getRatioWidth() / 7.5,
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
                          title: controller.challenges[index].title!,
                          sessionModel: controller.sessions[index],
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
                            imagePath:
                                "${controller.sessions[index].imagePath}",
                            width: AppRatioSize.getRatioWidth() / 4.5,
                            height: AppRatioSize.getRatioWidth() / 7.5,
                            borderRadius: 12,
                          ),
                          AppRatioSpaces.horizontalSectionSpaceXS(),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _titlePriceTextWidget(context,
                                  title: "${controller.sessions[index].title}",
                                  price: "${controller.sessions[index].price}"),
                              TagListWidget(
                                disableDefaultHPadding: true,
                                tags: controller.sessions[index].tags!,
                              )
                            ],
                          ))
                        ],
                      ),
                      const Divider(
                        color: AppColor.lightGrey,
                        thickness: 1.5,
                      ),
                      _viewCountWidget(context, viewCount: "${687 - index}"),
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
