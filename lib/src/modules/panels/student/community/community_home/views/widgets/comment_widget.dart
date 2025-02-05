import 'package:go7eight/src/core/app_export.dart';

import '../../controller/community_home_controller.dart';
import 'comment_body_widget.dart';
import 'post_user_profile_widget.dart';

class CommentWidget extends GetView<CommunityHomeController> {
  final int index;

  const CommentWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 24,
          vertical: AppRatioSize.getRatioHeight() / 88),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColor.appBrown,
          ),
          BoxShadow(
            color: AppColor.activeGreen,
            spreadRadius: -12.0,
            blurRadius: 12.0,
          ),
        ],
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          PostUserProfileWidget(
              communityPost: controller.communityPostList[index],
              showNotificationIcon: false),
          AppRatioSpaces.verticalSectionSpaceXS(),
          Text(
            "${controller.communityPostList[index].title}".tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading3(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          AppRatioSpaces.verticalSectionSpaceXS(),
          CommentBodyWidget(
            indexId: index,
          ),
          AppRatioSpaces.verticalSectionSpaceXS(),
        ],
      ),
    );
  }
}
