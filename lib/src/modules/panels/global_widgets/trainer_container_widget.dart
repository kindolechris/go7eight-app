
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';
import '../../../models/challenge_model.dart';

class TrainerContainer extends StatefulWidget {
  final TrainerModel trainer;
  final Function() onClickFollow;
  final bool isHorizontal;
  final double? imageBorderRadius;
  final double? imageSize;

  const TrainerContainer(
      {super.key, required this.trainer,
      required this.onClickFollow,
      this.isHorizontal = false,
      this.imageBorderRadius,
      this.imageSize});

  @override
  State<TrainerContainer> createState() => _TrainerContainerState();
}

class _TrainerContainerState extends State<TrainerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppRatioSize.getRatioWidth() / 24,
        right: widget.isHorizontal
            ? AppRatioSize.getRatioWidth() / 88
            : AppRatioSize.getRatioWidth() / 24,
        bottom: AppRatioSize.getRatioHeight() / 66,
        top: 4,
      ),
      child: AppContainerWidget(
          child: Row(
        children: [
          AppNetworkImage(
              width: widget.imageSize ?? AppRatioSize.getRatioWidth() / 6,
              height: widget.imageSize ?? AppRatioSize.getRatioWidth() / 6,
              showBoarder: false,
              borderRadius: widget.imageBorderRadius ?? 8,
              imagePath: "${widget.trainer.imagePath}"),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: widget.isHorizontal
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(
                  "${widget.trainer.name}".tr,
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading3(context),
                ),
                Text(
                  "${widget.trainer.type}",
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading2(context),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: AppButton(
              action: () {
                setState(() {
                  widget.onClickFollow();
                });
              },
              text: widget.trainer.isFollowed == true
                  ? "btn_text_unfollow"
                  : "btn_text_follow",
              buttonHeight: AppRatioSize.getRatioHeight() / 28,
              boarderRadius: 5,
              txtColor: widget.trainer.isFollowed == true
                  ? AppColor.primary
                  : AppColor.white,
              fontSize: AppTextSizes.headerText3(),
              btnColor: widget.trainer.isFollowed == true
                  ? AppColor.primary.withOpacity(0.2)
                  : AppColor.primary,
            ),
          )
        ],
      )),
    );
  }
}
