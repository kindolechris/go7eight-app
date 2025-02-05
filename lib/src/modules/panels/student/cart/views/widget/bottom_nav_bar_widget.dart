import 'package:go7eight/src/core/app_export.dart';

import 'bottom_puchase_widget.dart';
import 'invoice_text_widget.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 4.5,
      child: Column(
        children: [
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: const AppContainerWidget(
                child: Column(
              children: [
                InvoiceTextWidget(fieldKey: "total_item_lbl", fieldValue: "5"),
                InvoiceTextWidget(
                    fieldKey: "item_price_lbl", fieldValue: "\$92.00"),
              ],
            )),
          ),
          AppRatioSpaces.verticalSectionSpaceS(),
          Container(
              padding: AppPaddings.bottomBarButton2(),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColor.blackShade.withOpacity(0.1)
                        : AppColor.white.withOpacity(0.1),
                    spreadRadius: 1.5,
                    blurRadius: 4,
                    offset: const Offset(0, -2), // changes position of shadow
                  ),
                ],
              ),
              child: const BottomPurchasedWidget()),
        ],
      ),
    );
  }
}
