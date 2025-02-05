import 'package:go7eight/src/core/app_export.dart';

import '../../controller/community_home_controller.dart';

class PostTagsWidget extends GetView<CommunityHomeController> {
  const PostTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 58,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.primary,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 88),
              margin: EdgeInsets.only(
                right: Directionality.of(context) == TextDirection.rtl ? 0 : 4,
                left: Directionality.of(context) == TextDirection.rtl ? 4 : 0,
              ),
              alignment: Alignment.center,
              child: Text(
                "Tag ${index + 1}".tr,
                textAlign: TextAlign.left,
                style: TextStyleX.subHeading2(context).copyWith(
                    color: AppColor.white,
                    fontSize: AppTextSizes.headerText5()),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
    );
  }
}
