import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/models/community_post_model.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/widgets/notificaiton_icon_widget.dart';

class PostUserProfileWidget extends StatelessWidget {
  final CommunityPostModel communityPost;
  final bool showNotificationIcon;
  const PostUserProfileWidget(
      {super.key, required this.communityPost, this.showNotificationIcon = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppNetworkImage(
            width: AppRatioSize.getRatioWidth() / 12,
            height: AppRatioSize.getRatioWidth() / 12,
            showBoarder: false,
            imagePath: trainerImageGet(id: 2)),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${communityPost.user!.name}".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading2(context)
                  .copyWith(color: AppColor.primary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${communityPost.date}".tr,
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading2(context).copyWith(
                      color: AppColor.grey,
                      fontSize: AppTextSizes.headerText4()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  Icons.fiber_manual_record_rounded,
                  size: AppTextSizes.headerText5(),
                  color: AppColor.grey,
                ),
                Text(
                  "${communityPost.time}".tr,
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading2(context).copyWith(
                      color: AppColor.grey,
                      fontSize: AppTextSizes.headerText4()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        showNotificationIcon == true
            ? NotificationIconWidget(postID: "${communityPost.id}")
            : Container(),
      ],
    );
  }
}
