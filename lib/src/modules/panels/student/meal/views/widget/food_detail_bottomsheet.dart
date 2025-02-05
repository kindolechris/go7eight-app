import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/reusableComponents/app_html_view.dart';
import 'package:go7eight/src/modules/panels/global_widgets/tag_list_horizontal_widget.dart';

class FoodDetailsBottomSheet extends StatefulWidget {
  const FoodDetailsBottomSheet({super.key});

  @override
  State<FoodDetailsBottomSheet> createState() => _FoodDetailsBottomSheetState();
}

class _FoodDetailsBottomSheetState extends State<FoodDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 60,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              height: 60,
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                "food_details_title".tr,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleX.subHeading1(context)
                    .copyWith(fontSize: AppTextSizes.titleText5()),
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          _overviewDetails(context),
          _overviewMoreDetails(context),
          AppRatioSpaces.verticalSectionSpaceMF(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: AppButton(
              action: () {
                Navigator.pop(context);
              },
              text: "close_lbl",
              btnColor: AppColor.primary.withOpacity(0.2),
              txtColor: AppColor.primary,
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceM(),
        ],
      ),
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
              "food_type_title".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading3(context),
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

  _overviewDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: AppHtmlView.applyHtml(context,
          text: """
              <p><strong><span style="color:#000000">Detailed Overview</span></strong></p>

<ul>
	<li><span style="color:#000000"><span style="font-size:12px">Certified Personal Trainer (CPT) - National Academy of Sports Medicine (NASM)</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Yoga Alliance Registered Yoga Teacher (RYT 200)</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Group Fitness Instructor - American Council on Exercise (ACE)</span></span></li>
</ul>

<p><strong><span style="color:#000000">Nutrition Value</span></strong></p>

<ul>
	<li><span style="color:#000000"><span style="font-size:12px">10+ years of experience in the fitness industry, helping individuals achieve their health and wellness goals.</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Worked as a personal trainer and group fitness instructor in renowned fitness centers and gyms.</span></span></li>
	<li><span style="color:#000000"><span style="font-size:12px">Led various types of fitness classes, including HIIT, strength training, cardio, and bootcamp-style workouts.</span></span></li>
</ul>



""",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.textBlueGrey
                : AppColor.creamColor,
          ),
          textAlign: TextAlign.left),
    );
  }
}
