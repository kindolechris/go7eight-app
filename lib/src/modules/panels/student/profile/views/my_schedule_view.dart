import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_column_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_row_widget.dart';
import 'package:go7eight/src/modules/panels/student/profile/controllers/profile_controller.dart';

import '../../../global_widgets/app_bar_widget.dart';
import '../../session/views/widgets/session_schedule_bottom_sheet.dart';

class MyScheduleView extends GetView<ProfileController> {
  const MyScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(
        context,
        showSaveIcon: false,
        title: "my_schedule_lbl",
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
              Obx(() {
                return controller.isExerciseSelected.value == true
                    ? ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          AppRatioSpaces.verticalSectionSpaceS(),
                          _mySessionListWidget(
                              sessionList: controller.myScheduledSessions,
                              sessionType: SessionType.regular),
                          AppRatioSpaces.verticalSectionSpaceM(),
                        ],
                      )
                    : ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          AppRatioSpaces.verticalSectionSpaceS(),
                          _mySessionListWidget(
                            sessionList: controller.myNutritionSessions,
                            sessionType: SessionType.nutrition,
                          ),
                          AppRatioSpaces.verticalSectionSpaceM(),
                        ],
                      );
              }),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }

  Widget _mySessionListWidget(
      {required List<SessionModel> sessionList,
      required SessionType sessionType}) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: sessionList.length,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "12 Jun, 2023 | 12:34pm",
                      textAlign: TextAlign.start,
                      style: TextStyleX.subHeading2BlueGrey(context),
                    ),
                    GestureDetector(
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
                            return const SessionBookingBottomSheet();
                          },
                        );
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: [
                            Text(
                              "edit_schedule_lbl".tr,
                              textAlign: TextAlign.start,
                              style:
                                  TextStyleX.subHeading2(context).copyWith(
                                color: AppColor.white,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SizedBox(
                                width: AppRatioSize.getRatioWidth() / 22,
                                height: AppRatioSize.getRatioWidth() / 22,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.asset(
                                      AppIcon.editIcon,
                                      color: AppColor.white,
                                    ))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              sessionType == SessionType.regular
                  ? Container(
                      margin: EdgeInsets.only(
                        left: AppRatioSize.getRatioWidth() / 48,
                        right: AppRatioSize.getRatioWidth() / 48,
                        bottom: 6,
                      ),
                      height: AppRatioSize.getRatioHeight() / 2.6,
                      child: GestureDetector(
                        onTap: () {
                          controller.singleSessionClick(
                              sessionType, true, sessionList[index]);
                        },
                        child: SessionColumnCardWidget(
                          width: AppRatioSize.getRatioWidth(),
                          session: sessionList[index],
                        ),
                      ))
                  : Container(
                      margin: EdgeInsets.only(
                        left: AppRatioSize.getRatioWidth() / 48,
                        right: AppRatioSize.getRatioWidth() / 48,
                        bottom: 6,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.singleSessionClick(
                              sessionType, true, sessionList[index]);
                        },
                        child: SessionRowCardWidget(
                          width: AppRatioSize.getRatioWidth(),
                          session: sessionList[index],
                        ),
                      ),
                    )
            ],
          );
        });
  }
}
