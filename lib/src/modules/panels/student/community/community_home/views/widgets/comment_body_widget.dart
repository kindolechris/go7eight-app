import 'package:go7eight/src/core/app_export.dart';
import 'dart:math' as math;

import 'package:go7eight/src/data/dummy_dataset/user_image_data.dart';

class CommentBodyWidget extends StatelessWidget {
  final int indexId;

  const CommentBodyWidget({super.key, required this.indexId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Icon(
                Icons.keyboard_return_rounded,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.blackShade.withOpacity(0.6)
                    : AppColor.white.withOpacity(0.6),
                size: AppRatioSize.getRatioWidth() / 24,
              ),
            ),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            AppNetworkImage(
                width: AppRatioSize.getRatioWidth() / 18,
                height: AppRatioSize.getRatioWidth() / 18,
                showBoarder: false,
                imagePath: userImageGet(id: indexId + 1)),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            Text(
              "OrkoMS".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading2(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: AppRatioSize.getRatioWidth() / 7,
            ),
            Expanded(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                    .tr,
                textAlign: TextAlign.left,
                style: TextStyleX.subHeading2BlueGrey(context)
                    .copyWith(fontSize: AppTextSizes.headerText4()),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
