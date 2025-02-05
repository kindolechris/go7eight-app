import 'dart:ui';

import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import '../../controllers/trainer_session_controller.dart';
import 'admin_reason_bottomsheet.dart';
import 'session_card_widget.dart';

class PublishedSessionList extends GetView<TrainerSessionController> {
  const PublishedSessionList({super.key});

  @override
  Widget build(BuildContext context) {
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
            return GestureDetector(
              onTap: () {
                controller.singleSessionClick(
                    controller.selectedItem.value == "lbl_exercises"
                        ? SessionType.regular
                        : SessionType.nutrition,
                    true,
                    controller.sessions[index],
                    isCreate: false);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: index == 2
                    ? Stack(
                        children: [
                          SessionCardWidget(
                            session: controller.sessions[index],
                            isPublished: true,
                          ),
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
                                filter:
                                    ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                        SessionAdminReasonBottomSheet(
                                                      actionType:
                                                          "session_title",
                                                      index: index,
                                                    ));
                                              },
                                            );
                                          },
                                          buttonWidth:
                                              AppRatioSize.getRatioWidth() / 3,
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
                    : SessionCardWidget(
                        session: controller.sessions[index],
                        isPublished: true,
                      ),
              ),
            );
          }),
    );
  }
}
