import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:intl/intl.dart' as intl;

class TimeValueWidget extends StatelessWidget {
  final String title;
  final PickedTime time;
  final Icon icon;

  const TimeValueWidget(
      {super.key, required this.title, required this.time, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 44),
            decoration: BoxDecoration(
              color: AppColor.textBlueGrey,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  AppRatioSpaces.verticalSectionSpaceXXXS(),
                  Text(
                    title.tr,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: AppColor.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${intl.NumberFormat('00').format(time.h)}:${intl.NumberFormat('00').format(time.m)}',
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: AppColor.white,
                      fontSize: AppTextSizes.titleText3(),
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColor.white,
            child: icon,
          ),
        ],
      ),
    );
  }
}
