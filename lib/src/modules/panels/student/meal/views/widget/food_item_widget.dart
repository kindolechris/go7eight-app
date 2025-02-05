import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/food_model.dart';

class FoodItemWidget extends StatelessWidget {
  final FoodModel food;
  final double width;
  final bool isAdded;
  final void Function() addAction;
  const FoodItemWidget(
      {super.key,
      required this.food,
      required this.width,
      required this.addAction,
      this.isAdded = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 66, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(isAdded ? 0 : 12),
        boxShadow: isAdded
            ? null
            : [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.blackShade.withOpacity(0.1)
                      : AppColor.white.withOpacity(0.1),
                  spreadRadius: 1.5,
                  blurRadius: 4,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              _foodImageWidget(context),
              AppRatioSpaces.horizontalSectionSpaceXXS(),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _foodTextSection(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _foodTypeSection(context),
                    ],
                  ),
                ],
              )),
              AppRatioSpaces.horizontalSectionSpaceXXSS(),
            ],
          ),
          GestureDetector(
            onTap: addAction,
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(top: 8, right: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isAdded
                      ? AppColor.red.withOpacity(0.2)
                      : AppColor.primary.withOpacity(0.2)),
              child: Icon(
                isAdded ? Icons.delete_outline_rounded : Icons.add,
                color: isAdded ? AppColor.red : AppColor.primary,
                size: AppRatioSize.getRatioHeight() / 38,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _foodImageWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: SizedBox(
        width: AppRatioSize.getRatioWidth() / (isAdded ? 6 : 4.5),
        height: AppRatioSize.getRatioWidth() / (isAdded ? 6 : 4.5),
        child: AppNetworkImage(
          width: AppRatioSize.getRatioWidth() / (isAdded ? 6 : 4.5),
          height: AppRatioSize.getRatioWidth() / (isAdded ? 6 : 4.5),
          imagePath: "${food.imagePath}",
          borderRadius: 12,
        ),
      ),
    );
  }

  Widget _foodTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _foodTextTitleSection(context),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                _foodTextInfoSection(context),
              ],
            )),
            Container(
              width: AppRatioSize.getRatioWidth() / 10,
            )
          ],
        ),
      ],
    );
  }

  Widget _foodTextTitleSection(BuildContext context) {
    return Text(
      "${food.title}".tr,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyleX.subHeading3(context),
    );
  }

  Widget _foodTextInfoSection(BuildContext context) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.caloriesIcon,
            value: "${food.totalCalories}",
            unit: "Cal"),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        _textInfoWidget(context,
            iconPath: AppIcon.clockIcon,
            value: "${food.duration}",
            unit: "Min"),
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
          style: TextStyleX.subHeading2(context)
              .copyWith(fontSize: AppTextSizes.bodyText2()),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _foodTypeSection(BuildContext context) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.breIcon, value: "${food.mealType}", unit: ""),
      ],
    );
  }
}
