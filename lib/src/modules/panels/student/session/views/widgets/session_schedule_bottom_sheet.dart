import 'package:go7eight/src/core/app_export.dart';

import 'bottomsheet_calender_widget.dart';
import 'bottomsheet_header_widget.dart';
import 'bottomsheet_set_reminder_widget.dart';
import 'bottomsheet_time_picker_widget.dart';

class SessionBookingBottomSheet extends StatefulWidget {
  const SessionBookingBottomSheet({super.key});

  @override
  State<SessionBookingBottomSheet> createState() =>
      _SessionBookingBottomSheetState();
}

class _SessionBookingBottomSheetState extends State<SessionBookingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 1.2,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const BottomsheetHeaderWidget(title: "set_schedule_lbl"),
          const BottomsheetCalenderWidget(),
          const BottomsheetTimePickerWidget(),
          const BottomsheetSetReminderWidget(),
          _bottomAddButtonWidget(context),
          AppRatioSpaces.verticalSectionSpaceS(),
        ],
      ),
    );
  }

  Widget _bottomAddButtonWidget(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: AppButton(
        action: () {
          Navigator.pop(context);
          SnackBarX.showSuccess(
              title: "session_schedule_title",
              message: "session_schedule_message");
        },
        text: "add_lbl",
      ),
    );
  }
}
