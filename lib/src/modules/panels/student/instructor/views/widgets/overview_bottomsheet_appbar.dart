import 'package:go7eight/src/core/app_export.dart';

class OverviewBottomSheetAppBar extends StatelessWidget {
  const OverviewBottomSheetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        height: 60,
        width: Get.width,
        alignment: Alignment.center,
        child: Text("preference_qh_overview".tr,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleX.subHeading1(context)
                .copyWith(fontSize: AppTextSizes.titleText5())),
      ),
    );
  }
}
