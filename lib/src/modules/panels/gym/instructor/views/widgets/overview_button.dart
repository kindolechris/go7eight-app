import 'package:go7eight/src/core/app_export.dart';

import 'overview_bottomsheet.dart';

class OverviewButton extends StatelessWidget {
  const OverviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return const OverviewBottomSheet();
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.primary.withOpacity(0.2)
                      : AppColor.primary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('preference_qh_overview'.tr,
                      style: TextStyleX.subHeading2BlueGrey(context)),
                  Container(
                    padding: const EdgeInsets.all(1),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.primary
                            : AppColor.primary,
                        borderRadius: BorderRadius.circular(Get.width)),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.white,
                      size: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
