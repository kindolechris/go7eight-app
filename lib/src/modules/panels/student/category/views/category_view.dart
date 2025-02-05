import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/student/category/controllers/category_controller.dart';
import 'package:go7eight/src/modules/panels/global_widgets/app_bar_widget.dart';

import 'category_session_list_view.dart';
import 'widgets/challenge_carousel_slider.dart';

class CategoryView extends GetView<CategoryController> {
  final String categoryName;

  const CategoryView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sessionAppBar(context, title: categoryName.tr),
      body: Container(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            AppRatioSpaces.verticalSectionSpaceS(),
            const AppSectionTitle(
              title: "challenges_lbl",
              disableDefaultVPadding: true,
            ),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            ChallengeCarouselSlider(
              sessionType:
                  (categoryName.tr == "Nutrition" || categoryName.tr == "Diet")
                      ? SessionType.nutrition
                      : SessionType.regular,
            ),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            _carouselIndicator(),
            AppRatioSpaces.verticalSectionSpaceXXS(),
            CategorySessionListView(
              categoryName: categoryName,
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselIndicator() {
    return Obx(() {
      return Container(
        alignment: Alignment.center,
        child: AnimatedSmoothIndicator(
          activeIndex: controller.currentChallenge.value,
          count: controller.categoryChallenges.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotColor: Theme.of(Get.context!).brightness == Brightness.light
                ? AppColor.textBlueGrey.withOpacity(0.4)
                : AppColor.lightBlueGrey.withOpacity(0.4),
            activeDotColor: AppColor.primary,
            dotWidth: 8,
            radius: 100,
            strokeWidth: 25,
          ),
        ),
      );
    });
  }
}
