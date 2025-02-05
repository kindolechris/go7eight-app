import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';

import '../../controllers/trainer_session_controller.dart';
import 'session_card_widget.dart';

class UnpublishedSessionList extends GetView<TrainerSessionController> {
  const UnpublishedSessionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.unpublishedSessions.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  controller.singleSessionClick(
                      controller.selectedItem.value == "lbl_exercises"
                          ? SessionType.regular
                          : SessionType.nutrition,
                      true,
                      controller.sessions[index],
                      isCreate: false);
                },
                child: SessionCardWidget(
                  session: controller.sessions[index],
                  isPublished: false,
                ),
              ),
            );
          }),
    );
  }
}
