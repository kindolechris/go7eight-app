import 'package:go7eight/src/core/app_export.dart';

class BasicTrainingInfo extends StatelessWidget {
  final String sessionCount;
  final String challengeCount;
  final String followerCount;

  const BasicTrainingInfo(
      {super.key,
      required this.sessionCount,
      required this.challengeCount,
      required this.followerCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: AppContainerWidget(
          child: Row(
        children: [
          _basicInfoItem(context,
              itemKey: "sessions_title", itemValue: sessionCount),
          Container(
            height: 40,
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.lightBlueGrey
                : AppColor.grey,
          ),
          _basicInfoItem(context,
              itemKey: "challenges_title", itemValue: challengeCount),
          Container(
            height: 40,
            width: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.lightBlueGrey
                : AppColor.grey,
          ),
          _basicInfoItem(context,
              itemKey: "followers_title", itemValue: followerCount),
        ],
      )),
    );
  }

  Widget _basicInfoItem(BuildContext context,
      {required String itemKey, required String itemValue}) {
    return Expanded(
        child: Column(
      children: [
        Text(itemValue, style: TextStyleX.subHeading2BlueGrey(context)),
        Text(itemKey.tr, style: TextStyleX.subHeading2BlueGrey(context)),
      ],
    ));
  }
}
