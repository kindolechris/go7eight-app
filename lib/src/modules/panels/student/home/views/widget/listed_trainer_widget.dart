import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/home_controller.dart';

class ListedTrainerWidget extends StatefulWidget {
  const ListedTrainerWidget({super.key});

  @override
  State<ListedTrainerWidget> createState() => _ListedTrainerWidgetState();
}

class _ListedTrainerWidgetState extends State<ListedTrainerWidget> {
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        AppSectionTitle(
          title: "Listed Trainers",
          showViewAll: false,
          disableDefaultVPadding: true,
          onTapViewAll: () {
            controller.nutritionSessionSeeAllClick();
          },
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 9.5,
            width: Get.width,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.listedTrainerList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: index == 0
                            ? (AppRatioSize.getRatioWidth() / 48)
                            : 0),
                    child: GestureDetector(
                        onTap: () {
                          controller.gotoInstructorPublicView(
                              index % 2 == 0
                                  ? SessionType.regular
                                  : SessionType.nutrition,
                              controller.listedTrainerList[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 12, top: 4, bottom: 4, left: 10),
                          height: AppRatioSize.getRatioHeight() / 9.5,
                          width: AppRatioSize.getRatioWidth() - 60,
                          child: AppContainerWidget(
                            disableDefaultVPadding: true,
                            child: Row(
                              children: [
                                AppNetworkImage(
                                    width: AppRatioSize.getRatioWidth() / 7,
                                    height: AppRatioSize.getRatioWidth() / 7,
                                    showBoarder: false,
                                    borderRadius: 7,
                                    imagePath:
                                        "${controller.listedTrainerList[index].imagePath}"),
                                AppRatioSpaces.horizontalSectionSpaceXXS(),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.listedTrainerList[index].name}"
                                            .tr,
                                        textAlign: TextAlign.left,
                                        style: TextStyleX.subHeading3(context),
                                      ),
                                      Text(
                                        "${controller.listedTrainerList[index].type}",
                                        textAlign: TextAlign.left,
                                        style: TextStyleX.subHeading2(context),
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 4.5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            ignoreGestures: true,
                                            maxRating: 5,
                                            itemSize:
                                                AppRatioSize.getRatioWidth() /
                                                    28,
                                            itemPadding: const EdgeInsets.symmetric(
                                                horizontal: 0.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          Text(
                                            " (${index + 89})",
                                            textAlign: TextAlign.left,
                                            style: TextStyleX.body2(context)
                                                .copyWith(
                                              color: AppColor.lightBlueGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AppButton(
                                  action: () {
                                    setState(() {
                                      controller.listedTrainerList[index]
                                              .isFollowed =
                                          !controller.listedTrainerList[index]
                                              .isFollowed!;
                                    });
                                    if (controller.listedTrainerList[index]
                                            .isFollowed ==
                                        true) {
                                      SnackBarX.showSuccess(
                                          title: "follow_trainer_snack_title",
                                          message:
                                              "follow_trainer_snack_message");
                                    } else {
                                      SnackBarX.showWarning(
                                          title: "unfollow_trainer_snack_title",
                                          message:
                                              "unfollow_trainer_snack_message");
                                    }
                                  },
                                  text: controller.listedTrainerList[index]
                                              .isFollowed ==
                                          true
                                      ? "btn_text_unfollow"
                                      : "btn_text_follow",
                                  buttonWidth:
                                      AppRatioSize.getRatioWidth() / 5.2,
                                  buttonHeight:
                                      AppRatioSize.getRatioHeight() / 28,
                                  boarderRadius: 5,
                                  // primary: trainer.isFollowed == true?false:true,
                                  txtColor: controller.listedTrainerList[index]
                                              .isFollowed ==
                                          true
                                      ? AppColor.primary
                                      : AppColor.white,
                                  fontSize: AppTextSizes.headerText3(),
                                  btnColor: controller.listedTrainerList[index]
                                              .isFollowed ==
                                          true
                                      ? AppColor.primary.withOpacity(0.2)
                                      : AppColor.primary,
                                )
                              ],
                            ),
                          ),
                        )),
                  );
                })),
      ],
    );
  }
}
