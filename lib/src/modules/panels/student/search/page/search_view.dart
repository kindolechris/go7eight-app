import 'package:carousel_slider/carousel_slider.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/core/reusableComponents/app_status_bar.dart';
import 'package:go7eight/src/modules/panels/global_widgets/challenges_card_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_column_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_row_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/trainer_container_widget.dart';
import 'package:go7eight/src/modules/panels/student/search/page/widget/filter_bottom_sheet.dart';
import '../controller/search_controller.dart';

class FitnofySearchVew extends GetView<FitnofySearchController> {
  const FitnofySearchVew({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStatusBar(
      statusBarColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.blackShade,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      systemNavigationBarColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.blackShade,
      systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          appBar: PreferredSize(
              preferredSize: Size(Get.width, AppRatioSize.getRatioHeight() / 88),
              child: AppBar(
                elevation: 0,
                backgroundColor:  Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
              )),
          body: Hero(
            tag: "search_container",
            child: Container(
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
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 24),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                width: AppRatioSize.getRatioWidth() / 14,
                                height: AppRatioSize.getRatioWidth() / 9,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.black
                                      : AppColor.white,
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: AppTextField(
                            controller: controller.searchTextController,
                            showLabel: false,
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColor.grey.withOpacity(0.15)
                                    : AppColor.blackShade,
                            hintText: "search_here_lbl".tr,
                            showBoarder: false,
                            boarderRadius: 12,
                            showPrefixIcon: true,
                            showSuffixIcon: false,
                            shadowOpacity: 0,
                            prefixIcon: Icons.search_rounded,
                            labelColor: Colors.transparent,
                            prefixIconColor: AppColor.primary,
                            onSubmit: (value) {
                              controller.addItemToRecentSearch(value);
                            },
                          ),
                        ),
                        AppRatioSpaces.horizontalSectionSpaceXXS(),
                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              // showModalBottomSheet(
                              //   context: context,
                              //   isScrollControlled: true,
                              //   shape: const RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.vertical(
                              //       top: Radius.circular(20),
                              //     ),
                              //   ),
                              //   builder: (context) {
                              //     return const FilterBottomSheet();
                              //   },
                              // );
                            },
                            child: Container(
                              width: AppRatioSize.getRatioWidth() / 9,
                              height: AppRatioSize.getRatioWidth() / 9,
                              // margin: EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 88),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.primary
                                    : AppColor.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(AppIcon.filterIcon),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppRatioSize.getRatioHeight() / 66,
                  ),
                  Obx(() {
                    return controller.isSearchDone.value == false
                        ? controller.isSearching.value == true
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppRatioSize.getRatioWidth() / 24),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: AppRatioSize.getRatioHeight() / 8,
                                    ),
                                    Image.asset(AppIcon.searchingIcon),
                                    Text(
                                      "${"searching_lbl".tr}...",
                                      textAlign: TextAlign.start,
                                      style: TextStyleX.subHeading1(context),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppRatioSize.getRatioWidth() / 24),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.recentSearch.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // controller.searchTextController.text = controller.recentSearch[index];
                                              // controller.noResultFound.value = false;
                                              // controller.isSearchDone.value = true;
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: AppRatioSize
                                                          .getRatioHeight() /
                                                      140),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          child: Icon(
                                                              Icons.history,
                                                              color: AppColor
                                                                  .lightBlueGrey,
                                                              size: AppRatioSize
                                                                      .getRatioWidth() /
                                                                  20),
                                                        ),
                                                        AppRatioSpaces
                                                            .horizontalSectionSpaceXXS(),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            controller.recentSearch[index],
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyleX
                                                                .subHeading2(
                                                                    context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .removeRecentSearchItem(
                                                                index);
                                                      },
                                                      child: Icon(Icons.clear,
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .light
                                                              ? AppColor
                                                                  .blackShade
                                                              : AppColor
                                                                  .creamColor,
                                                          size: AppRatioSize
                                                                  .getRatioWidth() /
                                                              20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          index ==
                                                  (controller.recentSearch
                                                              .length >
                                                          1
                                                      ? controller.recentSearch
                                                              .length -
                                                          1
                                                      : 0)
                                              ? Container()
                                              : Divider(
                                                  thickness: 1.5,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? AppColor.lightGrey
                                                      : AppColor.lightGrey),
                                        ],
                                      );
                                    }),
                              )
                        : controller.noResultFound.value == true
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppRatioSize.getRatioWidth() / 24),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: AppRatioSize.getRatioHeight() / 6,
                                    ),
                                    Image.asset(AppIcon.searchNotFoundIcon),
                                    Text(
                                      "no_search_result_found_lbl".tr,
                                      textAlign: TextAlign.start,
                                      style: TextStyleX.subHeading1(context),
                                    ),
                                    Text(
                                      "try_different_key_lbl",
                                      textAlign: TextAlign.start,
                                      style: TextStyleX.subHeading2(context),
                                    ),
                                  ],
                                ),
                              )
                            : ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                const AppSectionTitle(
                                  title: "challenges_lbl",
                                  disableDefaultVPadding: true,
                                ),
                                AppRatioSpaces.verticalSectionSpaceXXXS(),
                                CarouselSlider.builder(
                                  options: CarouselOptions(
                                      autoPlay: false,
                                      enableInfiniteScroll: true,
                                      enlargeCenterPage: false,
                                      aspectRatio: 1.1,
                                      onPageChanged: (index, reason) {
                                        controller.regularChallenge.value =
                                            index;
                                      }),
                                  itemCount: 7,
                                  itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) =>
                                      GestureDetector(
                                        onTap:(){
                                        },
                                        child: ChallengesCardWidget(
                                          width:
                                              AppRatioSize.getRatioWidth() / 1.1,
                                          challenge: controller
                                                  .searchListRegularChallenges[
                                              itemIndex],
                                        ),
                                      ),
                                ),
                                AppRatioSpaces.verticalSectionSpaceS(),
                                AppSectionTitle(
                                  title: "nutrition_sessions_lbl",
                                  showViewAll: true,
                                  disableDefaultVPadding: true,
                                  onTapViewAll: () {
                                    controller.nutritionSessionSeeAllClick();
                                  },
                                ),
                                AppRatioSpaces.verticalSectionSpaceXXXS(),
                                SizedBox(
                                    height: AppRatioSize.getRatioHeight() / 7,
                                    width: Get.width,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller
                                            .searchListNutritionChallenges
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: index == 0
                                                    ? (AppRatioSize
                                                            .getRatioWidth() /
                                                        48)
                                                    : 0),
                                            child: GestureDetector(
                                              onTap: () {
                                              },
                                              child: SessionRowCardWidget(
                                                width: AppRatioSize
                                                        .getRatioWidth() /
                                                    1.15,
                                                session: controller
                                                        .searchListNutritionChallenges[
                                                    index],
                                              ),
                                            ),
                                          );
                                        })),
                                AppRatioSpaces.verticalSectionSpaceS(),
                                const AppSectionTitle(
                                  title: "sessions_title",
                                  disableDefaultVPadding: true,
                                ),
                                AppRatioSpaces.verticalSectionSpaceXXXS(),
                                SizedBox(
                                    height:
                                        AppRatioSize.getRatioHeight() / 2.6,
                                    width: Get.width,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller
                                            .trendingSessions.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: index == 0
                                                    ? (AppRatioSize
                                                            .getRatioWidth() /
                                                        48)
                                                    : 0),
                                            child: GestureDetector(
                                              onTap: () {
                                              },
                                              child: SessionColumnCardWidget(
                                                width: AppRatioSize
                                                        .getRatioWidth() /
                                                    1.25,
                                                session: controller
                                                    .trendingSessions[index],
                                              ),
                                            ),
                                          );
                                        })),
                                AppRatioSpaces.verticalSectionSpaceS(),
                                const AppSectionTitle(
                                  title: "ad_type_trainer",
                                  disableDefaultVPadding: true,
                                ),
                                AppRatioSpaces.verticalSectionSpaceXXXS(),
                                SizedBox(
                                    height: AppRatioSize.getRatioHeight() / 8,
                                    width: Get.width,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller
                                            .trendingSessions.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            width:
                                                AppRatioSize.getRatioWidth() /
                                                    1.15,
                                            child: GestureDetector(
                                              onTap: () {
                                              },
                                              child: TrainerContainer(
                                                  trainer: controller
                                                          .searchedTrainers[
                                                      index],
                                                  isHorizontal: true,
                                                  onClickFollow: () {
                                                  }),
                                            ),
                                          );
                                        })),
                                AppRatioSpaces.verticalSectionSpaceS(),
                                const AppSectionTitle(
                                  title: "food_challenges_lbl",
                                  disableDefaultVPadding: true,
                                ),
                                AppRatioSpaces.verticalSectionSpaceXXXS(),
                                SizedBox(
                                    height:
                                        AppRatioSize.getRatioHeight() / 2.6,
                                    width: Get.width,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller
                                            .nutritionSessions.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                left: index == 0
                                                    ? (AppRatioSize
                                                            .getRatioWidth() /
                                                        48)
                                                    : 0),
                                            child: GestureDetector(
                                              onTap: () {
                                              },
                                              child: SessionColumnCardWidget(
                                                width: AppRatioSize
                                                        .getRatioWidth() /
                                                    1.25,
                                                session: controller
                                                    .nutritionSessions[index],
                                              ),
                                            ),
                                          );
                                        })),
                                AppRatioSpaces.verticalSectionSpaceS(),
                                const AppSectionTitle(
                                  title: "user_type_three",
                                  disableDefaultVPadding: true,
                                ),
                                AppRatioSpaces.verticalSectionSpaceXXXS(),
                                SizedBox(
                                    height: AppRatioSize.getRatioHeight() / 8,
                                    width: Get.width,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: controller
                                            .searchedNutritionist.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            width:
                                                AppRatioSize.getRatioWidth() /
                                                    1.15,
                                            child: GestureDetector(
                                              onTap: () {
                                              },
                                              child: TrainerContainer(
                                                  trainer: controller
                                                          .searchedNutritionist[
                                                      index],
                                                  isHorizontal: true,
                                                  onClickFollow: () {
                                                  }),
                                            ),
                                          );
                                        })),
                                AppRatioSpaces.verticalSectionSpaceS(),
                              ],
                            );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
