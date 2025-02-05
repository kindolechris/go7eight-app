import 'package:go7eight/src/core/app_export.dart';

class ScheduleContainer extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String title;
  final String subTitle;
  final Color textColorLight;
  final Color textColorDark;
  final Color iconBackgroundColor;
  final Color iconColor;
  final IconData iconData;
  final void Function()? iconAction;

  const ScheduleContainer(
      {super.key,
      this.backgroundColor = AppColor.primaryLight,
      this.imagePath = AppIcon.noSessionScheduleIcon,
      required this.title,
      required this.subTitle,
      this.textColorLight = AppColor.textBlueGrey,
      this.textColorDark = AppColor.creamColor,
      this.iconBackgroundColor = AppColor.primary,
      this.iconColor = AppColor.white,
      this.iconData = Icons.search_rounded,
      this.iconAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 32,
          vertical: AppRatioSize.getRatioHeight() / 100),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(AppImage.statBGImage),
          fit: BoxFit.contain,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: AppRatioSize.getRatioHeight() / 8,
            child: Image.asset(imagePath),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    textAlign: TextAlign.left,
                    style: TextStyleX.subHeading1(context).copyWith(
                        fontSize: AppTextSizes.titleText6(),
                        color: Theme.of(context).brightness == Brightness.light
                            ? textColorLight
                            : textColorDark),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle.tr,
                    textAlign: TextAlign.left,
                    style: TextStyleX.subHeading1(context).copyWith(
                        fontSize: AppTextSizes.headerText3(),
                        color: Theme.of(context).brightness == Brightness.light
                            ? textColorLight
                            : textColorDark),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: iconAction,
            child: CircleAvatar(
              backgroundColor: iconBackgroundColor,
              child: Icon(
                iconData,
                color: iconColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
