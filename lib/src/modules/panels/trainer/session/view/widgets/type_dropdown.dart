import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_session_controller.dart';

class TypeDropdown extends GetView<TrainerSessionController> {
  const TypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          _showDropdownMenu(context);
        },
        child: Container(
          height: AppRatioSize.getRatioHeight() / 18,
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 32),
          padding: EdgeInsets.only(
            right: AppRatioSize.getRatioWidth() / 32,
            left: AppRatioSize.getRatioWidth() / 32,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.primary, width: 1.5),
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.primary.withOpacity(0.15)
                : AppColor.primary.withOpacity(0.55),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                controller.selectedItem.value.tr,
                style: TextStyleX.subHeading1(context).copyWith(
                  color: AppColor.primary,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColor.primary,
              ),
            ],
          ),
        ),
      );
    });
  }

  void _showDropdownMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(
        Offset(AppRatioSize.getRatioWidth() / 24,
            (AppRatioSize.getRatioHeight() / -1.3)),
        ancestor: overlay);

    showMenu(
      constraints: BoxConstraints(minWidth: Get.width),
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(position.dx,
          position.dy + button.size.height, button.size.width, position.dy),
      items: controller.items.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          padding: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 44),
          textStyle: TextStyleX.subHeading1(context).copyWith(
            color: AppColor.primary,
          ),
          child: Container(
              height: AppRatioSize.getRatioHeight() / 18,
              width: Get.width,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              margin:
                  EdgeInsets.only(bottom: controller.items[0] == item ? 8 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.primary.withOpacity(0.15)
                    : AppColor.primary.withOpacity(0.55),
              ),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.tr),
                    controller.selectedItem.value == item
                        ? Container(
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Get.width),
                                color: AppColor.primary),
                            child: Icon(
                              Icons.check,
                              color: AppColor.white,
                              size: AppRatioSize.getRatioWidth() / 24,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Get.width),
                            ),
                            child: Icon(
                              Icons.fiber_manual_record_outlined,
                              color: AppColor.grey,
                              size: AppRatioSize.getRatioWidth() / 16,
                            ),
                          )
                  ],
                );
              })),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        controller.selectedItem.value = value;
      }
    });
  }
}
