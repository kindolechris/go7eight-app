import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/option_widget.dart';

import '../../controllers/session_controllers.dart';

class BottomsheetSetReminderWidget extends StatefulWidget {
  const BottomsheetSetReminderWidget({super.key});

  @override
  State<BottomsheetSetReminderWidget> createState() =>
      _BottomsheetSetReminderWidgetState();
}

class _BottomsheetSetReminderWidgetState
    extends State<BottomsheetSetReminderWidget> {
  final SessionController _controller = Get.find();
  bool reminderSwitch = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        AppRatioSpaces.verticalSectionSpaceXS(),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.notifications_outlined),
                  Text(
                    "set_reminder_lbl".tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleX.subHeading1(context),
                  ),
                ],
              ),
              Switch(
                value: reminderSwitch,
                activeColor: AppColor.primary,
                onChanged: (value) {
                  setState(() {
                    reminderSwitch = value;
                  });
                },
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 0),
            child: OptionWidget(
                title: "", filterOptions: _controller.reminderOptions)),
        AppRatioSpaces.verticalSectionSpaceM(),
      ],
    );
  }
}
