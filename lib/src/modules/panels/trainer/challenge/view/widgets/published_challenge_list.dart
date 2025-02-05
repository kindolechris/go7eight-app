import 'dart:ui';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/view/widgets/challenge_card_widget.dart';

import '../../controllers/trainer_challenge_controller.dart';
import 'admin_reason_bottomsheet.dart';

class PublishedChallengeList extends GetView<TrainerChallengeListController> {
  const PublishedChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
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
                controller.gotoChallengeDetails(
                    challenge: controller.challenges[index], isCreate: false);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: index == 2
                      ? Stack(
                          children: [
                            ChallengeCardWidget(
                                challenge: controller.challenges[index],
                                isPublished: true),
                            Positioned.fill(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.black.withOpacity(0.4)
                                    : AppColor.white.withOpacity(0.2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 2.0, sigmaY: 2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "unpublished_by_gym_lbl".tr,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleX.subHeading1(context)
                                              .copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        AppRatioSpaces.verticalSectionSpaceXS(),
                                        AppButton(
                                            action: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(20),
                                                  ),
                                                ),
                                                builder: (context) {
                                                  return Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                                  context)
                                                              .viewInsets
                                                              .bottom),
                                                      child:
                                                          ChallengeAdminReasonBottomSheet(
                                                        actionType:
                                                            "challenge_title",
                                                        index: index,
                                                      ));
                                                },
                                              );
                                            },
                                            buttonWidth:
                                                AppRatioSize.getRatioWidth() /
                                                    3,
                                            buttonHeight:
                                                AppRatioSize.getRatioHeight() /
                                                    22,
                                            text: "see_reason_lbl")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        )
                      : ChallengeCardWidget(
                          challenge: controller.challenges[index],
                          isPublished: true,
                        )),
            );
          }),
    );
  }
}
