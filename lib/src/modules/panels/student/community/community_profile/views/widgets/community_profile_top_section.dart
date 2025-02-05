import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';

class CommunityProfileTopSection extends StatelessWidget {
  const CommunityProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                Scaffold.of(context).openDrawer();
              },
              child: Hero(
                tag: "profileImage_user",
                child: AppNetworkImage(
                    width: AppRatioSize.getRatioWidth() / 5,
                    height: AppRatioSize.getRatioWidth() / 5,
                    showBoarder: true,
                    imagePath: trainerImageGet(id: 17)),
              ),
            ),
            AppRatioSpaces.verticalSectionSpaceM(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "@orkoMS",
                  textAlign: TextAlign.start,
                  style: TextStyleX.subHeading1(context),
                ),
              ],
            ),
            AppRatioSpaces.verticalSectionSpaceXXXS(),
            Text(
              "Goal: Lose Weight & Shred Fat",
              textAlign: TextAlign.start,
              style: TextStyleX.subHeading2(context),
            ),
          ],
        ),
        AppRatioSpaces.verticalSectionSpaceM(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "0",
                  textAlign: TextAlign.start,
                  style: TextStyleX.subHeading1(context),
                ),
                Text(
                  "post_lbl".tr,
                  textAlign: TextAlign.start,
                  style: TextStyleX.subHeading2(context),
                ),
              ],
            ),
            AppRatioSpaces.horizontalSectionSpaceM(),
            Column(
              children: [
                Text(
                  "0",
                  textAlign: TextAlign.start,
                  style: TextStyleX.subHeading1(context),
                ),
                Text(
                  "comments_lbl".tr,
                  textAlign: TextAlign.start,
                  style: TextStyleX.subHeading2(context),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
