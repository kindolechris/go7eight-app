import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_export.dart';
import '../../../models/recipe_model.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeModel recipe;
  final double width;
  final void Function() addAction;
  final bool isAdded;
  final bool isTrainerView;
  const RecipeWidget(
      {super.key,
      required this.recipe,
      required this.width,
      required this.addAction,
      this.isAdded = false,
      this.isTrainerView = false});
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
        alignment: Directionality.of(context) == TextDirection.rtl
            ? Alignment.topLeft
            : Alignment.topRight,
        children: [
          Row(
            children: [
              _sessionImageWidget(context),
              AppRatioSpaces.horizontalSectionSpaceXXS(),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sessionTextSection(context),
                  AppRatioSpaces.verticalSectionSpaceXXXS(),
                  _recipeMacros(context)
                ],
              )),
              AppRatioSpaces.horizontalSectionSpaceS(),
            ],
          ),
          isTrainerView
              ? GestureDetector(
                  onTap: addAction,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.red.withOpacity(0.2)),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: AppColor.red,
                      size: AppRatioSize.getRatioHeight() / 38,
                    ),
                  ),
                )
              : GestureDetector(
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

  Widget _recipeMacros(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _recipeMacroItems(context,
            macroColor: Colors.amber,
            macroKey: "recipe_macro_protein",
            macroValue: "${recipe.totalProteins}"),
        _recipeMacroItems(context,
            macroColor: Colors.red,
            macroKey: "recipe_macro_fat",
            macroValue: "${recipe.totalFats}"),
        _recipeMacroItems(context,
            macroColor: Colors.green,
            macroKey: "recipe_macro_carbs",
            macroValue: "${recipe.totalCarbs}"),
      ],
    );
  }

  Widget _recipeMacroItems(BuildContext context,
      {required Color macroColor,
      required String macroKey,
      required String macroValue}) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: AppRatioSize.getRatioHeight() / 20,
              width: 5,
              decoration: BoxDecoration(
                  color: AppColor.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24)),
            ),
            Container(
              height: AppRatioSize.getRatioHeight() / 25,
              width: 5,
              decoration: BoxDecoration(
                  color: macroColor, borderRadius: BorderRadius.circular(24)),
            ),
          ],
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              macroValue.tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading2BlueGrey(context),
            ),
            Text(
              macroKey.tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading2(context),
            ),
          ],
        )
      ],
    );
  }

  Widget _sessionImageWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: SizedBox(
        width: AppRatioSize.getRatioWidth() /
            (isTrainerView ? 4.5 : (isAdded ? 6 : 4.5)),
        height: AppRatioSize.getRatioWidth() /
            (isTrainerView ? 4.5 : (isAdded ? 6 : 4.5)),
        child: Container(
          width: AppRatioSize.getRatioWidth() /
              (isTrainerView ? 4.5 : (isAdded ? 6 : 4.5)),
          height: AppRatioSize.getRatioWidth() /
              (isTrainerView ? 4.5 : (isAdded ? 6 : 4.5)),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: AppColor.grey,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: "${recipe.imagePath}",
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColor.grey.withOpacity(0.2),
                highlightColor: AppColor.lightGrey.withOpacity(0.4),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported_rounded,
                color: AppColor.grey.withOpacity(0.5),
                size: AppRatioSize.getRatioWidth() / 8,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sessionTextSection(BuildContext context) {
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
                _sessionTextTitleSection(context),
                _sessionTextInfoSection(context),
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

  Widget _sessionTextTitleSection(BuildContext context) {
    return Text(
      "${recipe.title}".tr,
      textAlign: TextAlign.start,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyleX.subHeading3(context),
    );
  }

  Widget _sessionTextInfoSection(BuildContext context) {
    return Row(
      children: [
        _textInfoWidget(context,
            iconPath: AppIcon.caloriesIcon,
            value: "${recipe.totalCalories}",
            unit: "Calories"),
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
          style: TextStyleX.subHeading2(context).copyWith(
            color: AppColor.red,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
