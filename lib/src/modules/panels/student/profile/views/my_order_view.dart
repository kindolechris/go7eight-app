import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/challenges_card_widget.dart';
import 'package:go7eight/src/modules/panels/student/profile/controllers/profile_controller.dart';

import '../../home/views/widget/all_session_widget.dart';
import '../../session/views/session_list_view.dart';
import '../../../global_widgets/app_bar_widget.dart';

class MyOrderView extends GetView<ProfileController> {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(
        context,
        showSaveIcon: false,
        title: "my_orders_lbl",
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
              AppRatioSpaces.verticalSectionSpaceM(),
              Obx(() {
                return AppTabBar(
                    onChange: (value) {
                      controller.isExerciseSelected.value = value;
                    },
                    isFirstOptionSelected: controller.isExerciseSelected.value,
                    horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                    optionOneText: "lbl_exercises",
                    optionTwoText: "lbl_nutrition");
              }),
              AppRatioSpaces.verticalSectionSpaceS(),
              Obx(() {
                return _myOrderCarouselSection(
                    sessionType: controller.isExerciseSelected.value == true
                        ? SessionType.regular
                        : SessionType.nutrition);
              }),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              Obx(() {
                return Container(
                  alignment: Alignment.center,
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.isExerciseSelected.value == true
                        ? controller.myRegularChallengeIndex.value
                        : controller.myNutritionChallengeIndex.value,
                    count: controller.isExerciseSelected.value == true
                        ? controller.myRegularChallenges.length
                        : controller.myNutritionChallenges.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotColor: AppColor.textBlueGrey.withOpacity(0.4),
                      activeDotColor: AppColor.primary,
                      dotWidth: 8,
                      radius: 100,
                      strokeWidth: 25,
                    ),
                  ),
                );
              }),
              AppRatioSpaces.verticalSectionSpaceXXS(),
              Obx(() {
                return controller.isExerciseSelected.value == true
                    ? const AllSessionWidget()
                    : ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const AppSectionTitle(
                            title: "nutrition_sessions_lbl",
                            disableDefaultVPadding: true,
                          ),
                          AppRatioSpaces.verticalSectionSpaceXXXS(),
                          SessionListViewWidget(
                            sessionList: controller.myNutritionSessions,
                            sessionType: SessionType.nutrition,
                          ),
                        ],
                      );
              }),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }

  Widget _myOrderCarouselSection({required SessionType sessionType}) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          autoPlay: false,
          enableInfiniteScroll: true,
          enlargeCenterPage: false,
          aspectRatio: 1.1,
          onPageChanged: (index, reason) {
            if (sessionType == SessionType.regular) {
              controller.myRegularChallengeIndex.value = index;
            } else {
              controller.myNutritionChallengeIndex.value = index;
            }
          }),
      itemCount: sessionType == SessionType.regular
          ? controller.myRegularChallenges.length
          : controller.myNutritionChallenges.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          GestureDetector(
        onTap: () {
          controller.gotoChallengeDetailedView(true,
              challengeModel: controller.myRegularChallenges[itemIndex]);
        },
        child: ChallengesCardWidget(
          width: AppRatioSize.getRatioWidth() / 1.1,
          challenge: sessionType == SessionType.regular
              ? controller.myRegularChallenges[itemIndex]
              : controller.myNutritionChallenges[itemIndex],
        ),
      ),
    );
  }
}
