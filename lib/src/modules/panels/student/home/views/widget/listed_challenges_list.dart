import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/home_controller.dart';

class ListedChallengesWidget extends GetView<HomeController> {
  const ListedChallengesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AppSectionTitle(
          title: "Top Sellers",
          showViewAll: false,
          disableDefaultVPadding: true,
          onTapViewAll: () {
            controller.trendingSessionSeeAllClick();
          },
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 2.6,
            width: Get.width,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.listedChallenges.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        controller.gotoChallengeDetailedView(
                          SessionType.regular,
                          index % 2 == 0 ? true : false,
                          challengeModel: controller.listedChallenges[index],
                        );
                      },
                      child: Container(
                        height: AppRatioSize.getRatioHeight() / 2.6,
                        width: AppRatioSize.getRatioWidth() / 1.5,
                        margin: EdgeInsets.only(
                            left: index == 0
                                ? (AppRatioSize.getRatioWidth() / 24)
                                : 0,
                            right: 12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                _imageWidget(index),
                                _imageBlackOverlay(),
                                _textWidget(context, index)
                              ],
                            )),
                      ));
                })),
      ],
    );
  }

  Widget _imageWidget(int index) {
    return SizedBox(
        height: AppRatioSize.getRatioHeight() / 2.6,
        width: AppRatioSize.getRatioWidth() / 1.5,
        child: Image.network(
          "${controller.listedChallenges[index].imagePath}",
          fit: BoxFit.cover,
        ));
  }

  Widget _imageBlackOverlay() {
    return Container(
      height: AppRatioSize.getRatioHeight() / 2.6,
      width: AppRatioSize.getRatioWidth() / 1.5,
      color: AppColor.black.withOpacity(0.2),
    );
  }

  Widget _textWidget(BuildContext context, int index) {
    return Container(
        height: AppRatioSize.getRatioHeight() / 2.6,
        width: AppRatioSize.getRatioWidth() / 1.5,
        padding:
            EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.listedChallenges[index].title}".tr,
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.titleText1(context),
            ),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "${controller.listedChallenges[index].tags![0].tag}".tr,
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading6(context),
              ),
            ),
          ],
        ));
  }
}
