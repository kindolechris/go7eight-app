import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_column_widget.dart';
import 'package:go7eight/src/modules/panels/global_widgets/session_row_widget.dart';
import '../controllers/session_controllers.dart';

class SessionListViewWidget extends GetView<SessionController> {
  final List<SessionModel> sessionList;
  final SessionType sessionType;

  const SessionListViewWidget(
      {super.key, required this.sessionList, this.sessionType = SessionType.regular});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: sessionList.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return sessionType == SessionType.regular
                  ? Container(
                      margin: EdgeInsets.only(
                        left: AppRatioSize.getRatioWidth() / 48,
                        right: AppRatioSize.getRatioWidth() / 48,
                        bottom: 6,
                      ),
                      height: AppRatioSize.getRatioHeight() / 2.6,
                      child: GestureDetector(
                        onTap: () {
                          controller.singleSessionClick(
                              sessionType,
                              index % 2 == 0 ? true : false,
                              sessionList[index]);
                        },
                        child: SessionColumnCardWidget(
                          width: AppRatioSize.getRatioWidth(),
                          session: sessionList[index],
                        ),
                      ))
                  : Container(
                      margin: EdgeInsets.only(
                        left: AppRatioSize.getRatioWidth() / 48,
                        right: AppRatioSize.getRatioWidth() / 48,
                        bottom: 6,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.singleSessionClick(
                              sessionType,
                              index % 2 == 0 ? true : false,
                              sessionList[index]);
                        },
                        child: SessionRowCardWidget(
                          width: AppRatioSize.getRatioWidth(),
                          session: sessionList[index],
                        ),
                      ),
                    );
            })
      ],
    );
  }
}
