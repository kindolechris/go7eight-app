import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/community_post_model.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/widgets/post_details_widget.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/widgets/post_tags_widget.dart';
import '../../controller/community_home_controller.dart';
import 'post_interaction_widget.dart';
import 'post_user_profile_widget.dart';

class PostWidget extends GetView<CommunityHomeController> {
  final CommunityPostModel communityPost;
  final double borderRadius;

  const PostWidget({super.key, required this.communityPost, this.borderRadius = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 24,
          vertical: AppRatioSize.getRatioHeight() / 88),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? communityPost.id! % 2 == 0
                  ? AppColor.white
                  : AppColor.offWhite
              : communityPost.id! % 2 == 0
                  ? AppColor.black
                  : AppColor.blackShade,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          PostUserProfileWidget(communityPost: communityPost),
          AppRatioSpaces.verticalSectionSpaceXS(),
          const PostTagsWidget(),
          AppRatioSpaces.verticalSectionSpaceXS(),
          PostDetailsWidget(communityPost: communityPost),
          _postImageWidget(),
          AppRatioSpaces.verticalSectionSpaceXS(),
          PostInteractionWidget(
            communityPost: communityPost,
          )
        ],
      ),
    );
  }

  Widget _postImageWidget() {
    return Column(
      children: [
        communityPost.id! % 2 == 0
            ? AppRatioSpaces.verticalSectionSpaceXS()
            : Container(),
        communityPost.id! % 2 == 0
            ? AppNetworkImage(
                width: Get.width,
                height: Get.height / 2,
                showBoarder: false,
                borderRadius: 18,
                imagePath: "${communityPost.imagePath}")
            : Container()
      ],
    );
  }
}
