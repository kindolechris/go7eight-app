import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/gym/profile/controllers/gym_profile_controller.dart';
import 'widgets/republish_reason_bottomsheet.dart';
import 'widgets/request_accepting_alertbox.dart';
import 'widgets/request_rejection_alertbox.dart';

class GYMRepublishingRequestListView extends GetView<GYMProfileController> {
  final SessionType sessionType;

  const GYMRepublishingRequestListView({super.key, required this.sessionType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          title: "republishing_requests_lbl",
          showAddIcon: false,
          showLeading: true),
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
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: ChallengeAdminMessageBottomSheet(
                          actionType: "challenge_title",
                          index: index,
                        ));
                  },
                );
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
                      _bottomActionSection(context, type: "challenge_title")
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: ChallengeAdminMessageBottomSheet(
                            actionType: "sessions_title",
                            index: index,
                          ));
                    },
                  );
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
                      _bottomActionSection(context, type: "session_title")
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

  Widget _bottomActionSection(BuildContext context, {required String type}) {
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
                  Text(' ${'message_for_admin_lbl'.tr}',
                      style: TextStyleX.subHeading1(context).copyWith(
                          color: AppColor.primary,
                          fontSize: AppTextSizes.headerText5())),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                acceptRepublishRequest(context, type);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                //margin: EdgeInsets.only(top: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.green.withOpacity(0.2)),
                child: Icon(
                  Icons.check,
                  color: AppColor.green,
                  size: AppRatioSize.getRatioHeight() / 38,
                ),
              ),
            ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            GestureDetector(
              onTap: () {
                rejectRepublishRequest(context, type);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                //margin: EdgeInsets.only(top: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.red.withOpacity(0.2)),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: AppColor.red,
                  size: AppRatioSize.getRatioHeight() / 38,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
