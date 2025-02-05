import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/cart_model.dart';

class CartItemWidget extends StatefulWidget {
  final CartModel cartItem;
  final Function() deleteAction;
  const CartItemWidget({super.key, required this.cartItem, required this.deleteAction});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppRatioSize.getRatioHeight() / 88),
      child: Stack(
        children: [
          AppContainerWidget(
            child: Row(
              children: [
                AppNetworkImage(
                  width: AppRatioSize.getRatioWidth() / 5.5,
                  height: AppRatioSize.getRatioWidth() / 5.5,
                  imagePath: "${widget.cartItem.imagePath}",
                  borderRadius: 12,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.cartItem.name}".tr,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleX.subHeading3(context).copyWith(),
                      ),
                      AppRatioSpaces.verticalSectionSpaceXXXS(),
                      _sessionTextInfoSection(context),
                      AppRatioSpaces.verticalSectionSpaceXXXS(),
                      _sessionTextPriceSection(context)
                    ],
                  ),
                ),
                AppRatioSpaces.horizontalSectionSpaceM(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: AppRatioSize.getRatioWidth() / 44,
                right: AppRatioSize.getRatioWidth() / 44),
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                widget.deleteAction();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColor.red.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12)),
                width: AppRatioSize.getRatioWidth() / 12,
                height: AppRatioSize.getRatioWidth() / 12,
                alignment: Alignment.center,
                child: const Icon(Icons.delete_outline_rounded, color: AppColor.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sessionTextInfoSection(BuildContext context) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.caloriesIcon,
            value: "${widget.cartItem.macros![0].value}",
            unit: "${widget.cartItem.macros![0].unit}"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        _textInfoWidget(context,
            iconPath: AppIcon.clockIcon,
            value: "${widget.cartItem.macros![1].value}",
            unit: "${widget.cartItem.macros![1].unit}"),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: AppTextSizes.headerText(),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "$value $unit".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _sessionTextPriceSection(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$${widget.cartItem.price}".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading1(context).copyWith(
            color: AppColor.primary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
