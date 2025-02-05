import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/challenge_model.dart';

class EmployeeCardWidget extends StatelessWidget {
  final TrainerModel trainer;
  final void Function()? onDeleteClick;
  final void Function()? onBlockClick;
  final double? imageBorderRadius;
  final double? imageSize;
  final bool? isBlocked;

  const EmployeeCardWidget(
      {super.key, required this.trainer,
      this.onDeleteClick,
      this.onBlockClick,
      this.imageBorderRadius,
      this.imageSize,
      this.isBlocked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppRatioSize.getRatioWidth() / 24,
          right: AppRatioSize.getRatioWidth() / 24,
          bottom: AppRatioSize.getRatioHeight() / 66),
      child: AppContainerWidget(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                  width: imageSize ?? AppRatioSize.getRatioWidth() / 7.5,
                  height: imageSize ?? AppRatioSize.getRatioWidth() / 7.5,
                  showBoarder: false,
                  borderRadius: imageBorderRadius ?? 8,
                  imagePath: "${trainer.imagePath}"),
              AppRatioSpaces.horizontalSectionSpaceXXS(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${trainer.name}".tr,
                      textAlign: TextAlign.left,
                      style: TextStyleX.subHeading3(context),
                    ),
                    Text(
                      "${trainer.type}",
                      textAlign: TextAlign.left,
                      style: TextStyleX.subHeading2(context),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  isBlocked == true
                      ? GestureDetector(
                          onTap: onBlockClick,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.macroGreen.withOpacity(0.2)),
                            child: Icon(
                              Icons.check,
                              color: AppColor.macroGreen,
                              size: AppRatioSize.getRatioHeight() / 38,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: onBlockClick,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.buttonLight.withOpacity(0.2)),
                            child: Icon(
                              Icons.block_outlined,
                              color: AppColor.buttonLight,
                              size: AppRatioSize.getRatioHeight() / 38,
                            ),
                          ),
                        ),
                  AppRatioSpaces.horizontalSectionSpaceXXS(),
                  GestureDetector(
                    onTap: onDeleteClick,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      //margin: EdgeInsets.only(top: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.red.withOpacity(0.2)),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: AppColor.red,
                        size: AppRatioSize.getRatioHeight() / 38,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppRatioSpaces.verticalSectionSpaceXS(),
          _trainerTextInfoSection(context)
        ],
      )),
    );
  }

  Widget _trainerTextInfoSection(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              fieldKey: "earning_lbl", value: "1500", unit: ""),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              fieldKey: "sold_item_lbl", value: "60", unit: ""),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              fieldKey: "trainer_total_item_lbl", value: "100", unit: ""),
        ),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String fieldKey, required String value, required String unit}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            fieldKey.tr,
            maxLines: 1,
            style: TextStyleX.subHeading2(context).copyWith(
              letterSpacing: 0.1,
              fontSize: AppTextSizes.headerText4(),
            ),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            style: TextStyleX.subHeading2BlueGrey(context),
            maxLines: 1,
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                ),
                TextSpan(
                  text: ' ${unit.tr}',
                  style: TextStyleX.subHeading2(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
