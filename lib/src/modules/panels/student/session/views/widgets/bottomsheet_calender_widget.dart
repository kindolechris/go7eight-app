import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/calendar_widget.dart';

import '../../controllers/session_controllers.dart';

class BottomsheetCalenderWidget extends GetView<SessionController> {
  const BottomsheetCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        AppRatioSpaces.verticalSectionSpaceM(),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            height: AppRatioSize.getRatioHeight() / 5.8,
            child: Calendar(
              titleChild: Row(
                children: [
                  const Icon(Icons.calendar_month_rounded),
                  Text(
                    "selected_date_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
