import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/home_controller.dart';

class FeaturedTrainerWidget extends StatefulWidget {
  const FeaturedTrainerWidget({super.key});

  @override
  State<FeaturedTrainerWidget> createState() => _FeaturedTrainerWidgetState();
}

class _FeaturedTrainerWidgetState extends State<FeaturedTrainerWidget> {
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 12, bottom: AppRatioSize.getRatioWidth() / 66),
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 44),
            child: AppSectionTitle(
              title: "Featured Trainers",
              titleColor: AppColor.white,
              showViewAll: false,
              disableDefaultVPadding: true,
              disableDefaultHPadding: true,
              onTapViewAll: () {
                _controller.nutritionSessionSeeAllClick();
              },
            ),
          ),
          SizedBox(
              height: AppRatioSize.getRatioHeight() / 8.5,
              width: Get.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _controller.featuredTrainerList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          _controller.gotoInstructorPublicView(
                              index % 2 == 0
                                  ? SessionType.regular
                                  : SessionType.nutrition,
                              _controller.featuredTrainerList[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: index ==
                                      (_controller
                                              .featuredTrainerList.length -
                                          1)
                                  ? 10
                                  : Directionality.of(context) ==
                                          TextDirection.rtl
                                      ? 10
                                      : 0,
                              top: 4,
                              bottom: 4,
                              left: index ==
                                      (_controller
                                              .featuredTrainerList.length -
                                          1)
                                  ? 10
                                  : Directionality.of(context) ==
                                          TextDirection.rtl
                                      ? 0
                                      : 10),
                          height: AppRatioSize.getRatioHeight() / 9.5,
                          width: AppRatioSize.getRatioWidth() - 100,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppRatioSize.getRatioHeight() / 55),
                                child: AppContainerWidget(
                                  borderRadius: 8,
                                  disableDefaultVPadding: true,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: AppRatioSize.getRatioWidth() /
                                            4.8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${_controller.featuredTrainerList[index].name}"
                                                  .tr,
                                              textAlign: TextAlign.left,
                                              style: TextStyleX
                                                  .subHeading2BlueGrey(
                                                      context),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "${_controller.featuredTrainerList[index].type}",
                                              textAlign: TextAlign.left,
                                              style: TextStyleX
                                                      .subHeading2(context)
                                                  .copyWith(
                                                      color: AppColor
                                                          .lightBlueGrey,
                                                      fontSize: AppTextSizes
                                                          .headerText4()),
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: RatingBar.builder(
                                                    initialRating: 4.5,
                                                    minRating: 1,
                                                    direction:
                                                        Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    ignoreGestures: true,
                                                    maxRating: 5,
                                                    itemSize: AppRatioSize
                                                            .getRatioWidth() /
                                                        28,
                                                    itemPadding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 0.0),
                                                    itemBuilder:
                                                        (context, _) => const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate:
                                                        (rating) {},
                                                  ),
                                                ),
                                                Text(
                                                  " (${index + 89})",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyleX
                                                          .subHeading2(
                                                              context)
                                                      .copyWith(
                                                          color: AppColor
                                                              .lightBlueGrey,
                                                          fontSize: AppTextSizes
                                                              .headerText4()),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      AppRatioSpaces
                                          .horizontalSectionSpaceXXXS(),
                                      AppButton(
                                        action: () {
                                          setState(() {
                                            _controller
                                                    .featuredTrainerList[index]
                                                    .isFollowed =
                                                !_controller
                                                    .featuredTrainerList[
                                                        index]
                                                    .isFollowed!;
                                          });
                                          if (_controller
                                                  .featuredTrainerList[index]
                                                  .isFollowed ==
                                              true) {
                                            SnackBarX.showSuccess(
                                                title:
                                                    "follow_trainer_snack_title",
                                                message:
                                                    "follow_trainer_snack_message");
                                          } else {
                                            SnackBarX.showWarning(
                                                title:
                                                    "unfollow_trainer_snack_title",
                                                message:
                                                    "unfollow_trainer_snack_message");
                                          }
                                        },
                                        text: _controller
                                                    .featuredTrainerList[
                                                        index]
                                                    .isFollowed ==
                                                true
                                            ? "btn_text_unfollow"
                                            : "btn_text_follow",
                                        buttonWidth:
                                            AppRatioSize.getRatioWidth() / 6,
                                        buttonHeight:
                                            AppRatioSize.getRatioHeight() /
                                                30,
                                        boarderRadius: 5,
                                        // primary: trainer.isFollowed == true?false:true,
                                        txtColor: _controller
                                                    .featuredTrainerList[
                                                        index]
                                                    .isFollowed ==
                                                true
                                            ? AppColor.primary
                                            : AppColor.white,
                                        fontSize: AppTextSizes.headerText4(),
                                        btnColor: _controller
                                                    .featuredTrainerList[
                                                        index]
                                                    .isFollowed ==
                                                true
                                            ? AppColor.primary
                                                .withOpacity(0.2)
                                            : AppColor.primary,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                child: AppNetworkImage(
                                    width: AppRatioSize.getRatioWidth() / 5.5,
                                    height:
                                        AppRatioSize.getRatioWidth() / 5.5,
                                    showBoarder: false,
                                    borderRadius: 7,
                                    imagePath:
                                        "${_controller.featuredTrainerList[index].imagePath}"),
                              ),
                            ],
                          ),
                        ));
                  })),
        ],
      ),
    );
  }
}
