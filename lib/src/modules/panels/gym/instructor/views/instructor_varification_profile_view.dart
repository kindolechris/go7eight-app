import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/reusableComponents/app_html_view.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import 'package:go7eight/src/modules/panels/global_widgets/gym_trainer_container.dart';
import 'package:go7eight/src/modules/panels/global_widgets/open_alert_box.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';
import 'package:go7eight/src/modules/panels/gym/instructor/views/widgets/approval_widget.dart';

import '../controllers/instructor_employee_controller.dart';

class InstructorProfileVerificationView
    extends GetView<InstructorEmployeeController> {
  const InstructorProfileVerificationView({super.key});

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
          appBar: fitnofyGeneralAppBar(context,
              title: "trainer_profile_info_title",
              showAddIcon: false,
              showLeading: true),
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
                Obx(() {
                  return TrainerContainer(
                    trainer: controller.trainer.value,
                    imageBorderRadius: Get.width,
                    imageSize: AppRatioSize.getRatioWidth() / 8,
                  );
                }),
                const ApprovalWidget(title: "additional_info_lbl"),
                AppRatioSpaces.verticalSectionSpaceXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: AppContainerWidget(
                      child: Column(
                    children: [
                      _additionalInfoWidget(context,
                          fieldKey: "Age", fieldValue: "24 Years"),
                      _additionalInfoWidget(context,
                          fieldKey: "Mail", fieldValue: "trainer@gmail.com"),
                      _additionalInfoWidget(context,
                          fieldKey: "Phone", fieldValue: "+1924765881"),
                      _additionalInfoWidget(context,
                          fieldKey: "Age", fieldValue: "24 Years"),
                    ],
                  )),
                ),
                AppRatioSpaces.verticalSectionSpaceS(),
                const ApprovalWidget(title: "certificate_lbl"),
                AppRatioSpaces.verticalSectionSpaceXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: AppContainerWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("NGA CERTIFIED PERSONAL TRAINER COURSE".tr,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleX.subHeading2BlueGrey(context)),
                        AppRatioSpaces.verticalSectionSpaceXXXS(),
                        Center(
                            child:
                                Image.asset(AppImage.certificateTrainerImage)),
                      ],
                    ),
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceS(),
                const ApprovalWidget(title: "certificate_lbl"),
                AppRatioSpaces.verticalSectionSpaceXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: AppContainerWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("NGA CERTIFIED PERSONAL TRAINER COURSE".tr,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleX.subHeading2BlueGrey(context)),
                        AppRatioSpaces.verticalSectionSpaceXXXS(),
                        Center(
                            child:
                                Image.asset(AppImage.certificateTrainerImage)),
                      ],
                    ),
                  ),
                ),
                AppRatioSpaces.verticalSectionSpaceS(),
                const ApprovalWidget(title: "preference_qh_overview"),
                AppRatioSpaces.verticalSectionSpaceXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child: AppContainerWidget(child: _overviewDetails(context)),
                ),
                AppRatioSpaces.verticalSectionSpaceS(),
                const ApprovalWidget(title: "specialization_lbl"),
                AppRatioSpaces.verticalSectionSpaceXXS(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 24),
                  child:
                      AppContainerWidget(child: _overviewMoreDetails(context)),
                ),
                AppRatioSpaces.verticalSectionSpaceM(),
              ],
            ),
          ),
          bottomNavigationBar: _bottomNavBar(context),
        ),
      ),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return Container(
        padding: AppPaddings.bottomBarButton2(),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade.withOpacity(0.1)
                  : AppColor.white.withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: AppButton(
                action: () {
                  openAlertBox(
                      context: context,
                      title: "verification_successful_message",
                      description: "",
                      icon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.green),
                            child: Icon(Icons.check,
                                color: AppColor.white,
                                size: AppRatioSize.getRatioHeight() / 24),
                          ),
                        ],
                      ),
                      buttonText: "done_cap_lbl",
                      buttonAction: () {
                        Navigator.pop(context);
                      });
                },
                text: "done_verification_lbl",
                fontSize: AppTextSizes.headerText1(),
                buttonWidth: double.infinity,
                boarderRadius: 8,
                txtColor: AppColor.white,
              )),
            ],
          ),
        ));
  }

  Widget _additionalInfoWidget(BuildContext context,
      {required String fieldKey, required String fieldValue}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldKey.tr,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading2(context)
                .copyWith(fontSize: AppTextSizes.buttonText4(), height: 1.2),
          ),
          Text(
            fieldValue.tr,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading2(context).copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.blackShade
                    : AppColor.creamColor,
                fontSize: AppTextSizes.buttonText4(),
                height: 1.2),
          ),
        ],
      ),
    );
  }

  _overviewDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: AppHtmlView.applyHtml(context,
          text: """
              <p><strong><span style="color:#000000">Certifications &amp; Training</span></strong></p>

<ul>
	<li><span style="color:#000000"><span style="font-size:12px">Certified Personal Trainer (CPT) - National Academy of Sports Medicine (NASM)</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Yoga Alliance Registered Yoga Teacher (RYT 200)</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Group Fitness Instructor - American Council on Exercise (ACE)</span></span></li>
</ul>

<p><strong><span style="color:#000000">Experiences</span></strong></p>

<ul>
	<li><span style="color:#000000"><span style="font-size:12px">10+ years of experience in the fitness industry, helping individuals achieve their health and wellness goals.</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Worked as a personal trainer and group fitness instructor in renowned fitness centers and gyms.</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Led various types of fitness classes, including HIIT, strength training, cardio, and bootcamp-style workouts.</span></span></li>
</ul>

<p><strong><span style="color:#000000">Contact</span></strong></p>

<p><span style="font-size:12px"><span style="color:#000000">✉&nbsp;</span><a href="mailto:abram.kenter@example.com"><span style="color:#000000">abram.kenter@example.com</span></a></span></p>

<p><span style="color:#000000"><span style="font-size:12px">☎ +55 2131 2312</span></span></p>

<p><span style="color:#000000"><span style="font-size:12px">&copy; www.abramkenter.com</span></span></p>


""",
          style: const TextStyle(),
          textAlign: TextAlign.left),
    );
  }

  _overviewMoreDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "specialist_lbl".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading2BlueGrey(context),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          const TagListWidget(
            disableDefaultHPadding: true,
            tags: [],
          )
        ],
      ),
    );
  }
}
