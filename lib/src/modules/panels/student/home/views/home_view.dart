import '../controllers/home_controller.dart';
import 'widget/all_session_widget.dart';
import 'widget/featured_trainer_list.dart';
import 'widget/home_ad_banner_widget.dart';
import 'widget/listed_challenges_list.dart';
import 'widget/home_app_bar.dart';
import 'widget/listed_trainer_widget.dart';
import 'widget/new_session_widget.dart';
import 'widget/quick_macro_widget.dart';
import 'widget/reflection_widget.dart';

import '../../../../../core/app_export.dart';
import 'widget/category_list_widget.dart';
import 'widget/current_challenge_widget.dart';
import 'widget/suggested_nutrition_session_widget.dart';
import 'widget/trending_session_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
            appBar: const HomeAppBar(),
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            body: Container(
              height: Get.height,
              width: Get.width,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  AppRatioSpaces.verticalSectionSpaceS(),
                  // const ListedChallengesWidget(),
                  // AppRatioSpaces.verticalSectionSpaceS(),
                  // const CurrentChallengeWidget(),
                  // AppRatioSpaces.verticalSectionSpaceMTF(),
                  // const QuickMacroWidget(),
                  // AppRatioSpaces.verticalSectionSpaceS(),
                  // const CategoryListWidget(),
                  // AppRatioSpaces.verticalSectionSpaceXS(),
                  // const ReflectionWidget(),
                  // AppRatioSpaces.verticalSectionSpaceXXS(),
                  // const FeaturedTrainerWidget(),
                  // AppRatioSpaces.verticalSectionSpaceS(),
                  // const TrendingSessionWidget(),
                  // AppRatioSpaces.verticalSectionSpaceXXS(),
                  // const ListedTrainerWidget(),
                  // AppRatioSpaces.verticalSectionSpaceXXS(),
                  // const HomeAdBannerWidget(),
                  // AppRatioSpaces.verticalSectionSpaceS(),
                  // const SuggestedNutritionSessionWidget(),
                  // AppRatioSpaces.verticalSectionSpaceS(),
                  // const NewSessionWidget(),
                  // AppRatioSpaces.verticalSectionSpaceXXS(),
                  const AllSessionWidget(),
                  AppRatioSpaces.verticalSectionSpaceM(),
                ],
              ),
            )),
      ),
    );
  }
}
