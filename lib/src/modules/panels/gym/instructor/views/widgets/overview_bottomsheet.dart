import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/reusableComponents/app_html_view.dart';

import 'overview_bottomsheet_appbar.dart';

class OverviewBottomSheet extends StatefulWidget {
  const OverviewBottomSheet({super.key});

  @override
  State<OverviewBottomSheet> createState() => _OverviewBottomSheetState();
}

class _OverviewBottomSheetState extends State<OverviewBottomSheet> {
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
          const OverviewBottomSheetAppBar(),
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
              "specialist_lbl".tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading2BlueGrey(context),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          // TagListWidget(disableDefaultHPadding: true,)
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
}
