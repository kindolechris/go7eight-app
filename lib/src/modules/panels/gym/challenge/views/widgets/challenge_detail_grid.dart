import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/challenge_drawer_item_widget.dart';

class ChallengeDetailGridView extends StatelessWidget {
  const ChallengeDetailGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width < 600 ? 2 : 4,
            crossAxisSpacing: AppRatioSize.getRatioWidth() / 44,
            mainAxisSpacing: AppRatioSize.getRatioWidth() / 44,
            childAspectRatio: 3.5),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return getGridItems(index);
        },
      ),
    );
  }

  getGridItems(int index) {
    switch (index) {
      case 0:
        return const ChallengeDrawerItem(
            iconPath: AppIcon.clockIcon,
            iconColor: AppColor.red,
            noPadding: true,
            label: "time_lbl",
            value: "30-60",
            unit: "min");
      case 1:
        return const ChallengeDrawerItem(
            iconPath: AppIcon.challengesDurationIcon,
            iconColor: AppColor.lightBlueGrey,
            noPadding: true,
            label: "day_lbl",
            value: "30",
            unit: "days");
      case 2:
        return const ChallengeDrawerItem(
            iconPath: AppIcon.challengesMemberIcon,
            iconColor: AppColor.grey,
            noPadding: true,
            label: "members_lbl",
            value: "9k",
            unit: "+");
      case 3:
        return const ChallengeDrawerItem(
            iconPath: AppIcon.challengesTypeIcon,
            iconColor: AppColor.lightBlueGrey,
            noPadding: true,
            label: "workout_type_lbl",
            value: "Gym",
            unit: "");
    }
  }
}
