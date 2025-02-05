import 'package:go7eight/src/core/app_export.dart';
import '../../../transfer/views/widgets/transfer_type_bottomsheet.dart';

class MoneyTransferWidget extends StatelessWidget {
  const MoneyTransferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const TransferMoneyBottomSheet(),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppRatioSize.getRatioWidth() / 32,
            vertical: AppRatioSize.getRatioHeight() / 77),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total_earning_lbl".tr,
                    maxLines: 1,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: AppColor.white,
                    ),
                  ),
                  AppRatioSpaces.verticalSectionSpaceXXXS(),
                  Text(
                    "\$99678.86".tr,
                    maxLines: 1,
                    style: TextStyleX.subHeading1(context).copyWith(
                      color: AppColor.white,
                      height: 1,
                      fontSize: AppTextSizes.titleText3(),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: AppRatioSize.getRatioHeight() / 16,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.white
                      : AppColor.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppRatioSize.getRatioWidth() / 22,
                      height: AppRatioSize.getRatioWidth() / 22,
                      child: Image.asset(
                        AppIcon.transferIcon,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.lightBlueGrey
                            : AppColor.creamColor,
                      ),
                    ),
                    Text(
                      "transfer_btn_lbl".tr,
                      maxLines: 1,
                      style: TextStyleX.subHeading3(context).copyWith(
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
